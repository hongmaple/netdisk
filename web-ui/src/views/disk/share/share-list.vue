<template>
  <div class="app-container">
    <div v-if="queryFileOk">
      <el-row :gutter="10" class="mb8">
        <div style="width: 80px;height: 100px;float: left">
          <img class="user-avatar" :src="baseUrl+shareInfo.sysUser.avatar"/>
        </div>
        <div style="width: 90px;height: 100px;float: left">
          <span style="margin-left: 10px;margin-top: 10px">{{ shareInfo.sysUser.userName }}</span>
        </div>
        <div style="width: 260px;height: 100px;float: left;text-align: left;margin-left: 10px">
          <div>
            分享于{{ parseTime(shareInfo.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
          </div>
          <div style="margin-top: 10px" v-if="shareInfo.isPermanent===1">永久有效</div>
          <div style="margin-top: 10px" v-else> 有效期到 {{ parseTime(shareInfo.expirationTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
          </div>
          <div style="margin-top: 10px">
            分享方式:
            <span v-if="shareInfo.type==='0'">私密</span>
            <span v-else>公开</span>
          </div>
        </div>
      </el-row>
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-arrow-left"
            size="mini"
            @click="handleSkip(0)"
          ></el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-arrow-right el-icon--right"
            size="mini"
            @click="handleSkip(1)"
          ></el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleDownload"
          >下载
          </el-button>
        </el-col>
        <right-toolbar @queryTable="refresh"></right-toolbar>
      </el-row>

      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>
          <el-link :underline="false" @click="skipCrumbs(0)">根目录</el-link>
        </el-breadcrumb-item>

        <el-breadcrumb-item v-for="(item,index) in crumbsList":key="index">
          <el-link :underline="false" @click="skipCrumbs(item.id)">{{item.name}}</el-link>
        </el-breadcrumb-item>
      </el-breadcrumb>

      <el-main v-loading="loading">
        <el-checkbox-group v-model="checkboxIds">
          <div  style="width: 100%;height: 100%;margin-left: 20px" v-for="(itme,index) in fileList">
            <div style="float: left;width: 120px;height: 130px;margin-left: 25px;margin-right: 25px;margin-top: 20px;position: relative;">
              <el-checkbox-button v-if="itme.isDir===1" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
                <div @dblclick="checkboxOndblclick(itme)" class="grid-content bg-purple">
                  <img style="width: 100px;height: 100px" src="@/assets/images/dir.png"/>
                  <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{ itme.name }}
                  </div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button v-if="itme.isDir===0&&itme.type===0" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
                <div class="grid-content bg-purple">
                  <image-preview :src="itme.url" :width="100" :height="100"/>
                  <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{ itme.name }}
                  </div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button v-if="itme.isDir===0&&itme.type===1" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
                <div @dblclick="handlePreview(itme)" class="grid-content bg-purple">
                  <img style="width: 100px;height: 100px" src="@/assets/images/video.png"/>
                  <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)"  style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>
                    {{ itme.name }}
                  </div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button v-if="itme.isDir===0&&itme.type===2" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
                <div class="grid-content bg-purple">
                  <img style="width: 100px;height: 100px" src="@/assets/images/file_open.png"/>
                  <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)"  style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{ itme.name }}
                  </div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button v-if="itme.isDir===0&&itme.type===3" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
                <div class="grid-content bg-purple">
                  <img style="width: 100px;height: 100px" src="@/assets/images/file_music.png"/>
                  <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{ itme.name }}
                  </div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button  v-if="itme.isDir===0&&itme.type===4" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
                <div  class="grid-content bg-purple ">
                  <img style="width: 100px;height: 100px" src="@/assets/images/file_open.png"/>
                  <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{ itme.name }}
                  </div>
                </div>
              </el-checkbox-button>
              <div v-if="currentId===itme.id" class="Extra-Text">
                <span>文件名：{{ itme.name }}</span><br/>
                <span>
                  文件大小：{{ storageUnitFormat(itme.size) }} &nbsp;&nbsp;
                  创建时间：{{ parseTime(itme.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}&nbsp;&nbsp;
                  更新时间：{{ parseTime(itme.updateTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
                </span>
              </div>
            </div>
          </div>
        </el-checkbox-group>
      </el-main>
    </div>

    <div style="text-align: center;width: 100%" v-show="total===0">
      该文件夹为空
    </div>

    <div class="border-effect share-info-check" v-if="!queryFileOk&&shareInfo.type==='0'">
      <el-row style="width: 100%;border-bottom: 2px solid #007bff;">
        <div style="width: 80px;height: 100px;float: left">
          <img class="user-avatar" :src="baseUrl+shareInfo.sysUser.avatar"/>
        </div>
        <div style="width: 90px;height: 100px;float: left">
          <span style="margin-left: 10px;margin-top: 10px">{{ shareInfo.sysUser.userName }}</span>
        </div>
        <div style="width: 260px;height: 100px;float: left;text-align: left;margin-left: 10px">
          <div>
            分享于{{ parseTime(shareInfo.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
          </div>
          <div style="margin-top: 10px" v-if="shareInfo.isPermanent===1">永久有效</div>
          <div style="margin-top: 10px" v-else> 有效期到 {{ parseTime(shareInfo.expirationTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
          </div>
          <div style="margin-top: 10px">
            分享方式:
            <span v-if="shareInfo.type==='0'">私密</span>
            <span v-else>公开</span>
          </div>
        </div>
      </el-row>
      <el-row style="width: 100%;margin-top: 20px;">
        <el-form ref="form" :model="queryParams" label-width="80px">
          <el-form-item label="提取码" prop="remark">
            <el-input size="medium" v-model="queryParams.secretKey" placeholder="请输入提取码"/>
          </el-form-item>
          <el-button type="primary" @click="getShareFileList">提取文件</el-button>
        </el-form>
      </el-row>
    </div>
  </div>
</template>

<script>
import {listFileByUUIDAndsecretKey} from "@/api/disk/file";
import {getInfo, listByUUIDAndsecretKey} from "@/api/disk/share"
import {getQueryObject} from "@/utils/index";

export default {
  name: "share-list",
  data() {
    return {
      // 遮罩层
      loading: false,
      // 选中数组
      ids: [],
      checkboxIds: [],
      // 显示搜索条件
      showSearch: true,
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 总条数
      total: 0,
      // 文件表格数据
      fileList: [],
      // 弹出层标题
      title: "",
      // 查询参数
      queryParams: {
        uuid: null,
        secretKey: null
      },
      parentId: null,
      uuid: '',
      secretKey: '',
      allCrumbsList: [],
      crumbsList: [
      ],
      skipList: [],
      skipIndex: -1,
      baseUrl: process.env.VUE_APP_BASE_API,
      shareInfo: {
        sysUser: {}
      },
      queryFileOk: false,
      currentId: -1
    }
  },
  created() {
    let uuid = getQueryObject().uuid.split(" ");
    this.queryParams.uuid = uuid[0];
    if (getQueryObject().secretKey !== undefined && getQueryObject().secretKey !== null) {
      let secretKey = getQueryObject().secretKey.split(" ");
      this.queryParams.secretKey = secretKey[0];
      this.getShareFileList();
    }
    this.getInfo();
  },
  methods: {
    /** 查询文件列表 */
    getList() {
      this.loading = true;
      listFileByUUIDAndsecretKey(this.queryParams, this.parentId).then(response => {
        this.fileList = response.data;
        this.loading = false;
      });
    },
    getInfo() {
      this.loading = true;
      getInfo(this.queryParams.uuid).then(response => {
        this.shareInfo = response.data;
        if (this.shareInfo.type==='1') {
          this.getShareFileList();
        }
        this.loading = false;
      });
    },
    /** 查询分享文件列表 */
    getShareFileList() {
      this.loading = true;
      listByUUIDAndsecretKey(this.queryParams).then(response => {
        this.fileList = response.data;
        this.queryFileOk = true;
        this.loading = false;
      });
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    handleCheckboxChange(value) {
      this.ids = this.checkboxIds
      this.single = this.checkboxIds.length !== 1
      this.multiple = !this.checkboxIds.length
    },
    checkboxOndblclick(disk) {
      console.log(disk);
      if (disk.isDir===1) {
        this.queryParams.parentId = disk.id;
        const skip = {
          id: disk.id,
          parentId: disk.parentId,
          name: disk.name
        }
        this.allCrumbsList.push(skip);
        this.allCrumbsList = this.uniqueObjects(this.allCrumbsList);
        this.crumbsList=[];
        this.generateCrumbs(disk.id);
        this.skipList.push(disk.id);
        this.skipList = [...new Set(this.skipList)];
        this.uploadFileUrl = process.env.VUE_APP_BASE_API + "/disk/file/upload/"+disk.id
        this.getList();
      }
    },
    handleSkip(skip) {
      if (skip === 0) {
        let index = this.skipList.indexOf(this.parentId);
        this.skip(index - 1)
      } else {
        let index = this.skipList.indexOf(this.parentId);
        this.skip(index + 1)
      }
    },
    skip(nextIndex) {
      this.crumbsList=[];
      if (nextIndex<0) {
        this.queryParams.parentId=0;
        this.allCrumbsList=[];
        this.getList();
      }else if (nextIndex>=this.skipList.length) {
        this.queryParams.parentId =0;
        this.allCrumbsList=[];
        this.getList();
      } else {
        this.queryParams.parentId = this.skipList[nextIndex];
        this.generateCrumbs(this.queryParams.parentId);
        this.getList();
      }
    },
    handleDownload() {
      const data = {
        uuid: this.queryParams.uuid,
        secretKey: this.queryParams.secretKey,
        ids: this.ids.join(",")
      }
      this.$download.downloadZip("/disk/file/download/zip", data, this.queryParams.uuid + ".zip");
    },
    refresh() {
      this.skip(this.skipIndex);
      this.ids = [];
      this.checkboxIds = [];
    },
    mouseEnter(id) {
      this.currentId = id;
    },
    mouseLeave(id) {
      this.currentId = -1;
    },
    uniqueObjects(arr) {
      const unique = [];
      const seen = new Set();
      arr.forEach(item => {
        const stringifiedItem = JSON.stringify(item);
        if (!seen.has(stringifiedItem)) {
          unique.push(item);
          seen.add(stringifiedItem);
        }
      });
      return unique;
    },
    generateCrumbs(id) {
      if (id===0) {
        this.crumbsList = this.crumbsList.reverse();
        return;
      }
      const crumbs = this.getCrumbsListById(id);
      if (crumbs!=null&&crumbs!=undefined) {
        this.crumbsList.push(crumbs);
        this.generateCrumbs(crumbs.parentId);
      }
    },
    getCrumbsListById(id) {
      return this.allCrumbsList.find(item => {
        return item.id === id;
      });
    },
    skipCrumbs(id) {
      this.queryParams.parentId = id;
      this.crumbsList = [];
      this.generateCrumbs(this.queryParams.parentId);
      this.getList();
    },
    handlePreview(row) {
      if (row.type===1) {
        //视频
        this.$router.push({ name: "preview_video" , params: {url: row.url,name:row.name} });
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.user-avatar {
  cursor: pointer;
  width: 80px;
  height: 80px;
  border-radius: 20px;
}

.border-effect {
  border: 2px solid #007bff; /* 2px边框，实线，蓝色 */
  padding: 10px; /* 内边距 */
  margin: 10px; /* 外边距 */
  border-radius: 5px; /* 圆角 */
}

.share-info-check {
  width: 500px;
  height: 260px;
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.Extra-Text {
  width: 300px;
  height: 80px;
  border: 2px solid #dfe6ec;
  font-size: 12px;
  position: relative;
  top: -150px;
  left: 1px;
  background-color: #bfcbd9;
  text-align: center;
  color: #ffffff;
  z-index: 9999;
  border-radius: 20px;
}
</style>
