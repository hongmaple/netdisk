<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文件名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入文件名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="旧文件名" prop="oldName">
        <el-input
          v-model="queryParams.oldName"
          placeholder="请输入旧文件名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件大小" prop="size">
        <el-input
          v-model="queryParams.size"
          placeholder="请输入文件大小"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间">
        <el-date-picker
          v-model="daterangeCreateTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <!--      <el-form-item label="更新者" prop="updateId">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.updateId"-->
      <!--          placeholder="请输入更新者"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-upload el-icon--right"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['disk:file:add']"
        >上传</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleelDownload"
        >下载</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['disk:file:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['disk:file:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="dataRefresh"></right-toolbar>
    </el-row>

    <el-main  v-loading="loading">
      <el-checkbox-group v-model="checkboxIds">
        <div style="margin-left: 20px" v-for="(itme,index) in fileList">
          <div style="float: left;width: 120px;height: 130px;margin-left: 25px;margin-right: 25px;margin-top: 20px;position: relative;" v-if="itme.isDir===0&&itme.type===3">
            <el-checkbox-button @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
              <div v-on:mouseover="mouseEnter(index)" @mouseleave="mouseLeave(index)"  class="grid-content bg-purple">
                <img style="width: 100px;height: 100px" src="@/assets/images/file_music.png"/>
                <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
              </div>
            </el-checkbox-button>
            <div v-if="currentIndex===index" class="Extra-Text">
              <span>文件名：{{ itme.name }}</span><br/>
              <span>
                  文件大小：{{ storageUnitConversion(itme.size,"mb") }} MB &nbsp;&nbsp;
                  创建时间：{{ parseTime(itme.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}&nbsp;&nbsp;
                  更新时间：{{ parseTime(itme.updateTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
                </span>
            </div>
          </div>
        </div>
      </el-checkbox-group>
    </el-main>


    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 上传文件对话框 -->
    <el-dialog :title="title" :visible.sync="uploadOpen" width="500px" append-to-body>
      <!--          <file-upload :fileSize="100" :fileType="fileType" v-model="form.url"/>-->
      <el-upload
        class="upload-demo"
        drag
        :action="uploadFileUrl"
        :before-upload="handleBeforeUpload"
        :file-list="uploadFileList"
        :limit="limit"
        :on-error="handleUploadError"
        :on-exceed="handleExceed"
        :on-success="handleUploadSuccess"
        :show-file-list="true"
        :headers="headers"
        multiple>
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <!-- 上传提示 -->
        <div class="el-upload__tip" slot="tip" v-if="showTip">
          请上传
          <template v-if="fileSize"> 大小不超过 <b style="color: #f56c6c">{{ fileSize }}MB</b> </template>
          <template v-if="fileSize"> 数量不超过 <b style="color: #f56c6c">{{ limit }}</b> </template>
          <template v-if="fileType"> 格式为 <b style="color: #f56c6c">{{ fileType.join("/") }}</b> </template>
          的文件
        </div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">关闭</el-button>
      </div>
    </el-dialog>

    <!-- 修改文件对话框 -->
    <el-dialog :title="title" :visible.sync="updteOpen" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文件名" prop="name">
          <el-input v-model="form.name" placeholder="请输入文件名" />
        </el-form-item>
        <el-form-item label="旧文件名" prop="oldName">
          <el-input v-model="form.oldName" placeholder="请输入旧文件名" />
        </el-form-item>
        <el-form-item label="排序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入排序" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getToken } from "@/utils/auth";
import { listFile, getFile, delFile, addFile, updateFile } from "@/api/disk/file";

export default {
  name: "File-music",
  dicts: ['file_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      checkboxIds: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 文件表格数据
      fileList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      uploadOpen: false,
      updteOpen: false,
      // 删除标志时间范围
      daterangeCreateTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        oldName: null,
        size: null,
        type: 3,
        isDir: 0,
        parentId: null,
        createId: null,
        createTime: null,
        updateId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      uploadFileUrl: process.env.VUE_APP_BASE_API + "/disk/file/upload/"+0,
      headers: {
        Authorization: "Bearer " + getToken()
      },
      // 数量限制
      limit: 1,
      // 大小限制(MB)
      fileSize: 100,
      fileType: ["swf", "flv", "mp3", "wav", "wma", "wmv", "mid", "avi", "mpg", "asf", "rm", "rmvb"],
      // 是否显示提示
      isShowTip: {
        type: Boolean,
        default: true
      },
      number: 0,
      uploadFileList: [],
      currentIndex: -1
    }
  },
  created() {
    this.getList();
  },
  computed: {
    // 是否显示提示
    showTip() {
      return this.isShowTip && (this.fileType || this.fileSize);
    },
  },
  methods: {
    /** 查询文件列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeCreateTime && '' != this.daterangeCreateTime) {
        this.queryParams.params["beginCreateTime"] = this.daterangeCreateTime[0];
        this.queryParams.params["endCreateTime"] = this.daterangeCreateTime[1];
      }
      listFile(this.queryParams).then(response => {
        this.fileList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.uploadOpen = false;
      this.updteOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        oldName: null,
        size: null,
        url: null,
        type: null,
        parentId: null,
        isDir: null,
        orderNum: null,
        createId: null,
        createTime: null,
        updateId: null,
        updateTime: null,
        remark: null,
        delFlag: null
      };
      this.resetForm("form");
      this.number = 0;
      this.uploadFileList=[];
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.queryParams.type = 3
      this.queryParams.isDir = 0;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeCreateTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handleCheckboxChange(value) {
      this.ids = this.checkboxIds
      this.single = this.checkboxIds.length!==1
      this.multiple = !this.checkboxIds.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.uploadOpen = true;
      this.title = "添加文件";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getFile(id).then(response => {
        this.form = response.data;
        this.updteOpen = true;
        this.title = "修改文件";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFile(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.updteOpen = false;
              this.getList();
            });
          } else {
            this.form.pan
            addFile(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.updteOpen = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除文件编号为"' + ids + '"的数据项？').then(function() {
        return delFile(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('disk/file/export', {
        ...this.queryParams
      }, `file_${new Date().getTime()}.xlsx`)
    },
    // 上传前校检格式和大小
    handleBeforeUpload(file) {
      // 校检文件类型
      if (this.fileType) {
        const fileName = file.name.split('.');
        const fileExt = fileName[fileName.length - 1];
        const isTypeOk = this.fileType.indexOf(fileExt) >= 0;
        if (!isTypeOk) {
          this.$modal.msgError(`文件格式不正确, 请上传${this.fileType.join("/")}格式文件!`);
          return false;
        }
      }
      // 校检文件大小
      if (this.fileSize) {
        const isLt = file.size / 1024 / 1024 < this.fileSize;
        if (!isLt) {
          this.$modal.msgError(`上传文件大小不能超过 ${this.fileSize} MB!`);
          return false;
        }
      }
      this.$modal.loading("正在上传文件，请稍候...");
      this.number++;
      return true;
    },
    // 文件个数超出
    handleExceed() {
      this.$modal.msgError(`上传文件数量不能超过 ${this.limit} 个!`);
    },
    // 上传失败
    handleUploadError(err) {
      this.$modal.msgError("上传文件失败，请重试");
      this.$modal.closeLoading()
    },
    // 上传成功回调
    handleUploadSuccess(res, file) {
      if (res.code === 200) {
        this.uploadedSuccessfully();
      } else {
        this.number--;
        this.$modal.closeLoading();
        this.$modal.msgError(res.msg);
        this.$refs.fileUpload.handleRemove(file);
        this.uploadedSuccessfully();
      }
    },
    // 上传结束处理
    uploadedSuccessfully() {
      if (this.number > 0) {
        this.number = 0;
        this.uploadFileList=[];
        this.uploadOpen = false;
        this.getList();
        this.$modal.closeLoading();
      }
    },
    checkboxOndblclick(disk) {
      console.log(disk);
      if (disk.isDir===1) {
        this.queryParams.parentId = disk.id;
        this.uploadFileUrl = process.env.VUE_APP_BASE_API + "/disk/file/upload/"+disk.id
        this.getList();
      }
    },
    handleelDownload() {
      this.loading = true;
      const data = {
        ids: this.ids.join(",")
      }
      this.$download.downloadZip("/disk/file/download/zip",data,"netdisk.zip");
    },
    //刷新
    dataRefresh() {
      this.ids = [];
      this.checkboxIds = [];
      this.getList();
    },
    mouseEnter(index) {
      this.currentIndex = index;
    },
    mouseLeave(index) {
      this.currentIndex = -1;
    },
  }
};
</script>
<style lang="scss" scoped>

.Extra-Text {
  width: 500px;
  height: 60px;
  border: 2px solid #dfe6ec;
  font-size: 12px;
  position: absolute;
  top: -5px;
  left: 1px;
  background-color: #bfcbd9;
  text-align: center;
  color: #ffffff;
  z-index: 9999;
  border-radius: 50px;
}
</style>
