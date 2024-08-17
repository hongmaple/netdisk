<template>
  <div id="global-uploader">

    <!-- 上传 -->
    <uploader
      ref="uploader"
      :options="options"
      :autoStart="false"
      @file-added="onFileAdded"
      @file-success="onFileSuccess"
      @file-progress="onFileProgress"
      @file-error="onFileError"
      class="uploader-app">
      <uploader-unsupport></uploader-unsupport>

      <uploader-btn id="global-uploader-btn" :attrs="attrs" ref="uploadBtn">选择文件</uploader-btn>

      <uploader-list v-show="panelShow">
        <div class="file-panel" slot-scope="props" :class="{'collapse': collapse}">
          <div class="file-title">
            <h2>文件列表</h2>
            <div class="operate">
              <el-button @click="fileListShow" type="text" :title="collapse ? '展开':'折叠' ">
                <i class="el-icon-d-caret" style="color:black;font-size: 18px"
                   :class="collapse ? 'inuc-fullscreen': 'inuc-minus-round'"></i>
              </el-button>
              <el-button @click="close" type="text" title="关闭">
                <i class="el-icon-close" style="color:black;font-size: 18px"></i>
              </el-button>
            </div>
          </div>

          <ul class="file-list">
            <li v-for="file in props.fileList" :key="file.id">
              <uploader-file :class="'file_' + file.id" ref="files" :file="file" :list="true"></uploader-file>
            </li>
            <div class="no-file" v-if="!props.fileList.length"><i class="iconfont icon-empty-file"></i> 暂无待上传文件</div>
          </ul>
        </div>
      </uploader-list>

    </uploader>

  </div>
</template>

<script>
/**
 *   全局上传插件
 *   调用方法：Bus.$emit('openUploader', {}) 打开文件选择框，参数为需要传递的额外参数
 *   监听函数：Bus.$on('fileAdded', fn); 文件选择后的回调
 *            Bus.$on('fileSuccess', fn); 文件上传成功的回调
 */

import {ACCEPT_CONFIG} from '@/assets/js/config';
import Bus from '@/assets/js/bus';
import SparkMD5 from 'spark-md5';
import {fileMerge} from '@/api/disk/fileuploader';

export default {
  data() {
    return {
      options: {
        // 目标上传 URL
        target: process.env.VUE_APP_BASE_API +'/disk/fileManagement/upload',
        //分块大小
        chunkSize: 5 * 1024 * 1000,
        //上传文件时文件的参数名，默认file
        fileParameterName: 'file',
        //并发上传数
        //simultaneousUploads: 1,
        //最大自动失败重试上传次数
        maxChunkRetries: 2,
        //重试间隔 单位毫秒
        //chunkRetryInterval: 5000,
        //是否开启服务器分片校验
        testChunks: true,
        // 服务器分片校验函数，秒传及断点续传基础
        checkChunkUploadedByResponse: function (chunk, message) {
          let objMessage = JSON.parse(message);
          if (objMessage.skipUpload) {
            return true;
          }
          return (objMessage.uploaded || []).indexOf(chunk.offset + 1) >= 0
        },
        headers: {
          Authorization: ''
        },
        // 额外的自定义查询参数
        query() {
        }
      },
      attrs: {
        accept: ACCEPT_CONFIG.getAll()
      },
      panelShow: false,   //选择文件后，展示上传panel
      collapse: false
    }
  },
  mounted() {
    //接收子组件触发的事件
    Bus.$on('openUploader', query => {
      this.params = query || {};
      this.options.headers.Authorization = 'Bearer ' + query.token


      if (this.$refs.uploadBtn) {
        $("#global-uploader-btn").click();
      }
    });
  },
  computed: {
    //Uploader实例
    uploader() {
      return this.$refs.uploader.uploader;
    }
  },
  methods: {
    onFileAdded(file) {
      this.panelShow = true;
      this.computeMD5(file);

      Bus.$emit('fileAdded');
    },
    //上传过程中，会不断触发file-progress上传进度的回调
    onFileProgress(rootFile, file, chunk) {
      console.log(`上传中 ${file.name}，chunk：${chunk.startByte / 1024 / 1024} ~ ${chunk.endByte / 1024 / 1024}`)
    },
    onFileSuccess(rootFile, file, response, chunk) {

      let res = JSON.parse(response);

      // TODO 如有需要 解开注释 和后台协议如何处理这种情况:服务器自定义的错误（即虽返回200，但是是错误的情况），这种错误是Uploader无法拦截的
      // if (!res.result) {
      //   this.$message({message: res.message, type: 'error'});
      //   // 文件状态设为“失败”
      //   this.statusSet(file.id, 'failed');
      //   return
      // }

      // 如果服务端返回需要合并
      if (res.needMerge) {
        // 文件状态设为“合并中”
        this.statusSet(file.id, 'merging');
        let param = {
          'filename': rootFile.name,
          'identifier': rootFile.uniqueIdentifier,
          'totalSize': rootFile.size
        }
        fileMerge(param).then(res => {
          // 文件合并成功
          Bus.$emit('fileSuccess');

          this.statusRemove(file.id);
        }).catch(e => {
          console.log("合并异常,重新发起请求,文件名为:", file.name)
          //由于网络或服务器原因,导致合并过程中断线,此时如果不重新发起请求,就会进入失败的状态,导致该文件无法重试
          file.retry();
        });

        // 不需要合并
      } else {
        Bus.$emit('fileSuccess');
        console.log('上传成功');
      }
    },
    onFileError(rootFile, file, response, chunk) {
      this.$message({
        message: response,
        type: 'error'
      })
    },

    /**
     * 计算md5，实现断点续传及秒传
     * @param file
     */
    computeMD5(file) {
      let fileReader = new FileReader();
      let time = new Date().getTime();
      let blobSlice = File.prototype.slice || File.prototype.mozSlice || File.prototype.webkitSlice;
      let currentChunk = 0;
      const chunkSize = 10 * 1024 * 1000;
      let chunks = Math.ceil(file.size / chunkSize);
      let spark = new SparkMD5.ArrayBuffer();

      // 文件状态设为"计算MD5"
      this.statusSet(file.id, 'md5');
      file.pause();

      loadNext();

      fileReader.onload = (e => {

        spark.append(e.target.result);

        if (currentChunk < chunks) {
          currentChunk++;
          loadNext();

          // 实时展示MD5的计算进度
          this.$nextTick(() => {
            $(`.myStatus_${file.id}`).text('校验MD5 ' + ((currentChunk / chunks) * 100).toFixed(0) + '%')
          })
        } else {
          let md5 = spark.end();
          this.computeMD5Success(md5, file);
          console.log(`MD5计算完毕：${file.name} \nMD5：${md5} \n分片：${chunks} 大小:${file.size} 用时：${new Date().getTime() - time} ms`);
        }
      });

      fileReader.onerror = function () {
        this.error(`文件${file.name}读取出错，请检查该文件`)
        file.cancel();
      };

      function loadNext() {
        let start = currentChunk * chunkSize;
        let end = ((start + chunkSize) >= file.size) ? file.size : start + chunkSize;

        fileReader.readAsArrayBuffer(blobSlice.call(file.file, start, end));
      }
    },

    computeMD5Success(md5, file) {
      // 将自定义参数直接加载uploader实例的opts上
      Object.assign(this.uploader.opts, {
        query: {
          ...this.params,
        }
      })

      file.uniqueIdentifier = md5;
      file.resume();
      this.statusRemove(file.id);
    },

    fileListShow() {
      let $list = $('#global-uploader .file-list');

      if ($list.is(':visible')) {
        $list.slideUp();
        this.collapse = true;
      } else {
        $list.slideDown();
        this.collapse = false;
      }
    },
    close() {
      this.uploader.cancel();

      this.panelShow = false;
    },

    /**
     * 新增的自定义的状态: 'md5'、'transcoding'、'failed'
     * @param id
     * @param status
     */
    statusSet(id, status) {
      let statusMap = {
        md5: {
          text: '校验MD5',
          bgc: '#fff'
        },
        merging: {
          text: '合并中',
          bgc: '#e2eeff'
        },
        transcoding: {
          text: '转码中',
          bgc: '#e2eeff'
        },
        failed: {
          text: '上传失败',
          bgc: '#e2eeff'
        }
      }

      this.$nextTick(() => {
        $(`<p class="myStatus_${id}"></p>`).appendTo(`.file_${id} .uploader-file-status`).css({
          'position': 'absolute',
          'top': '0',
          'left': '0',
          'right': '0',
          'bottom': '0',
          'zIndex': '1',
          'line-height': 'initial',
          'backgroundColor': statusMap[status].bgc
        }).text(statusMap[status].text);
      })
    },
    statusRemove(id) {
      this.$nextTick(() => {
        $(`.myStatus_${id}`).remove();
      })
    },

    error(msg) {
      this.$notify({
        title: '错误',
        message: msg,
        type: 'error',
        duration: 2000
      })
    }
  },
  watch: {},
  destroyed() {
    Bus.$off('openUploader');
  },
  components: {}
}
</script>

<style scoped lang="scss">
#global-uploader {
  position: fixed;
  z-index: 20;
  right: 15px;
  bottom: 15px;

  h1, h2 {
    font-weight: normal;
  }

  ul {
    list-style-type: none;
    padding: 0px 4px;
  }

  li {
    display: inline-block;
  }

  .uploader-app {
    width: 660px;
  }

  .file-panel {
    background-color: #fff;
    border: 1px solid #e2e2e2;
    border-radius: 7px 7px 0 0;
    box-shadow: 0 0 10px rgba(0, 0, 0, .2);

    .file-title {
      display: flex;
      height: 40px;
      line-height: 0px;
      padding: 0 15px;
      border-bottom: 1px solid #ddd;

      .operate {
        flex: 1;
        text-align: right;
      }
    }

    .file-list {
      position: relative;
      height: 264px;
      width: 654px;
      overflow-x: hidden;
      overflow-y: auto;
      background-color: #fff;

      > li {
        background-color: #fff;
      }
    }

    &.collapse {
      .file-title {
        background-color: #E7ECF2;
      }
    }
  }

  .no-file {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 16px;
  }

  .uploader-file {
    width: 654px;
  }

  ///deep/ .uploader-file-icon {
  .uploader-file-icon {
    &:before {
      content: '' !important;
    }

    &[icon=image] {
      background: url(../../../assets/images/image-icon.png);
    }

    &[icon=video] {
      background: url(../../../assets/images/video.png);
    }

    &[icon=document] {
      background: url(../../../assets/images/text-icon.png);
    }
  }

  ///deep/ .uploader-file-actions > span {
  .uploader-file-actions > span {
    margin-right: 6px;
  }
}

/* 隐藏上传按钮 */
#global-uploader-btn {
  position: absolute;
  clip: rect(0, 0, 0, 0);
}


/*.uploader-list>ul>li{*/
/*  width:100%;*/
/*  color:red;*/
/*  margin-bottom: 0;*/
/*}*/
/*a {*/
/*  color: #42b983;*/
/*}*/
</style>
