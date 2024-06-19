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
      <el-form-item label="文件类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择文件类型" clearable>
          <el-option
            v-for="dict in dict.type.file_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <!--      <el-form-item label="是否是目录" prop="isDir">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.isDir"-->
      <!--          placeholder="请输入是否是目录"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->
      <!--      <el-form-item label="创建者" prop="createId">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.createId"-->
      <!--          placeholder="请输入创建者"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->
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
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleelDownload"
        >下载</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['disk:file:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-arrow-left"
          size="mini"
          @click="handleSkip(0)"
          v-hasPermi="['disk:file:add']"
        ></el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-arrow-right el-icon--right"
          size="mini"
          @click="handleSkip(1)"
          v-hasPermi="['disk:file:add']"
        ></el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="dataRefresh"></right-toolbar>
    </el-row>

    <el-main v-loading="loading">
      <el-checkbox-group v-model="checkboxIds">
        <div style="margin-left: 20px" v-for="(itme,index) in fileList">
          <div style="float: left;width: 120px;height: 130px;margin-left: 25px;margin-right: 25px;margin-top: 20px;position: relative;">
            <el-checkbox-button  v-if="itme.isDir===1" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
              <div v-on:mouseover="mouseEnter(index)" @mouseleave="mouseLeave(index)" @dblclick="checkboxOndblclick(itme)" class="grid-content bg-purple">
                <img style="width: 100px;height: 100px" src="@/assets/images/dir.png"/>
                <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
              </div>
            </el-checkbox-button>
            <el-checkbox-button  v-if="itme.isDir===0&&itme.type===0" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
              <div v-on:mouseover="mouseEnter(index)" @mouseleave="mouseLeave(index)"  class="grid-content bg-purple">
                <image-preview :src="itme.url" :width="100" :height="100"/>
                <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
              </div>
            </el-checkbox-button>
            <el-checkbox-button  v-if="itme.isDir===0&&itme.type===1" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
              <div v-on:mouseover="mouseEnter(index)" @mouseleave="mouseLeave(index)"  class="grid-content bg-purple">
                <div style="width: 100px;height: 83px;">
                  <vue-core-video-player :title="itme.name" :src="baseUrl+itme.url"/>
                </div>
                <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;margin-top: 20px'>
                  {{itme.name}}</div>
              </div>
            </el-checkbox-button>
            <el-checkbox-button  v-if="itme.isDir===0&&itme.type===2" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
              <div v-on:mouseover="mouseEnter(index)" @mouseleave="mouseLeave(index)"  class="grid-content bg-purple">
                <img style="width: 100px;height: 100px" src="@/assets/images/file_open.png"></img>
                <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
              </div>
            </el-checkbox-button>
            <el-checkbox-button  v-if="itme.isDir===0&&itme.type===3" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
              <div v-on:mouseover="mouseEnter(index)" @mouseleave="mouseLeave(index)"  class="grid-content bg-purple">
                <img style="width: 100px;height: 100px" src="@/assets/images/file_music.png"></img>
                <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
              </div>
            </el-checkbox-button>
            <el-checkbox-button  v-if="itme.isDir===0&&itme.type===4" @change="handleCheckboxChange" :label="itme.id" :key="itme.id" size="medium">
              <div v-on:mouseover="mouseEnter(index)" @mouseleave="mouseLeave(index)"  class="grid-content bg-purple">
                <img style="width: 100px;height: 100px" src="@/assets/images/file_open.png"></img>
                <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
              </div>
            </el-checkbox-button>
            <div v-if="currentIndex===index" class="Extra-Text">
              <span>文件名：{{ itme.name }}</span><br/>
              <span>
                  文件大小：{{ storageUnitConversion(itme.size)}} &nbsp;&nbsp;
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

    <!-- 添加或修改文件夹对话框 -->
    <el-dialog :title="title" :visible.sync="openDir" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="排序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入排序" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitDirForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

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

    <!-- 添加或修改分享对话框 -->
    <el-dialog :title="title" :visible.sync="openShare" width="500px" append-to-body>
      <div v-if="shareOk===false">
        <el-form ref="shareFrom" :model="shareFrom" :rules="shareRules" label-width="80px">
          <el-form-item label="分享方式：">
            <el-radio v-model="shareFrom.type" label="0">私密</el-radio>
            <el-radio v-model="shareFrom.type" label="1">公开</el-radio>
          </el-form-item>
          <el-form-item v-if="shareFrom.type==='0'" label="提取码" prop="secretKey">
            <el-radio v-model="shareFrom.secretKeyRadio" label="1">系统生成</el-radio>
            <el-radio v-model="shareFrom.secretKeyRadio" label="2">自定义</el-radio>
            <el-input v-if="shareFrom.secretKeyRadio==='2'" v-model="shareFrom.secretKey" placeholder="请输入" />
          </el-form-item>
          <el-form-item label="过期时间" prop="expirationTime">
            <el-radio v-model="shareFrom.expirationTimeRadio" label="1">永久</el-radio>
            <el-radio v-model="shareFrom.expirationTimeRadio" label="2">自定义</el-radio>
            <el-date-picker v-if="shareFrom.expirationTimeRadio==='2'" clearable
                            v-model="shareFrom.expirationTime"
                            type="datetime"
                            align="right"
                            value-format="yyyy-MM-dd"
                            :picker-options="pickerOptions"
                            placeholder="请选择">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="备注" prop="remark">
            <el-input v-model="shareFrom.remark" placeholder="请输入备注" />
          </el-form-item>
        </el-form>

        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitShareForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </div>
      <div v-else>
        <div style="margin-bottom: 20px">
          <div style="margin-top: 10px">
            链接
            <div>{{shareBaseUrl + 'uuid=' +shareResult.uuid}}</div>
          </div>

          <div style="margin-top: 10px" v-if="shareResult.type==='0'">
            提取码
            <el-input v-model="shareResult.secretKey" :disabled="true" />
          </div>

          <div style="margin-top: 10px">
            过期时间
            <div v-if="shareResult.isPermanent">永久</div>
            <div v-else>{{ parseTime(shareResult.expirationTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</div>

          </div>
        </div>
        <div slot="footer" class="dialog-footer">
          <el-button
            v-if="shareResult.type==='1'"
            v-clipboard:copy="shareBaseUrl + 'uuid=' + shareResult.uuid + '      ' + shareResult.remark"
            v-clipboard:success="copySuccess"
            v-clipboard:error="copyFailed"
          >复制</el-button>
          <el-button
            v-if="shareResult.type==='0'"
            v-clipboard:copy="shareBaseUrl + 'uuid=' + shareResult.uuid + '   提取码：'+ shareResult.secretKey + '      ' + shareResult.remark"
            v-clipboard:success="copySuccess"
            v-clipboard:error="copyFailed"
          >复制</el-button>
          <el-button
            v-if="shareResult.type==='0'"
            v-clipboard:copy="shareBaseUrl + 'uuid=' + shareResult.uuid + '&secretKey='+shareResult.secretKey   + '      ' + shareResult.remark"
            v-clipboard:success="copySuccess"
            v-clipboard:error="copyFailed"
          >复制(免填提取码)</el-button>
          <el-button @click="cancel">关闭</el-button>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {getToken} from "@/utils/auth";
import {addFile, delFile, getFile, listFile, updateFile} from "@/api/disk/file";
import {getStorageFileListByUserId} from "@/api/disk/storage";
import {addShare} from "@/api/disk/share";

export default {
  name: "File",
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
      openDir: false,
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
        type: null,
        isDir: null,
        parentId: null,
        createId: null,
        createTime: null,
        updateId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "名称不能为空", trigger: "blur" }
        ],
      },
      uploadFileUrl: process.env.VUE_APP_BASE_API + "/disk/file/upload/"+0,
      headers: {
        Authorization: "Bearer " + getToken()
      },
      // 数量限制
      limit: 1,
      // 大小限制(MB)
      fileSize: 100,
      fileType: ["bmp", "gif", "jpg", "jpeg", "png","swf", "flv", "mp3", "wav", "wma", "wmv", "mid", "avi", "mpg",
        "asf", "rm", "rmvb","mp4", "avi", "rmvb","doc", "docx", "xls", "ppt", "txt", "pdf"],
      // 是否显示提示
      isShowTip: {
        type: Boolean,
        default: true
      },
      number: 0,
      uploadFileList: [],
      shareFrom: {
        secretKeyRadio: "1",
        expirationTimeRadio: "1",
        type: "0"
      },
      openShare: false,
      shareRules: {
        secretKey: [
          { required: true, message: "密钥不能为空", trigger: "blur" }
        ],
        expirationTime: [
          { required: true, message: "过期时间不能为空", trigger: "blur" },
          { rangelength: [4-6], message: "密钥长度4-6", trigger: "blur" }
        ],
      },
      shareResult: {},
      shareOk: false,
      shareBaseUrl: '',
      skipList: [],
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() <= Date.now();
        },
        shortcuts: [{
          text: '三天',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 3);
            picker.$emit('pick', date);
          }
        }, {
          text: '一周',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }
        }, {
          text: '半月',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 15);
            picker.$emit('pick', date);
          }
        }, {
          text: '一个月',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 30);
            picker.$emit('pick', date);
          }
        }, {
          text: '半年',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 182.5);
            picker.$emit('pick', date);
          }
        }, {
          text: '一年',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 365);
            picker.$emit('pick', date);
          }
        }]
      },
      baseUrl: process.env.VUE_APP_BASE_API,
      currentIndex: -1
    }
  },
  created() {
    this.queryParams.parentId = 0;
    this.getList();
    this.getConfigKey("font.baseUrl").then(response => {
      this.shareBaseUrl = response.msg + "/external/share/share-list?";
    });
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
      this.ids = [];
      this.checkboxIds = [];
      this.queryParams.params = {};
      if (null != this.daterangeCreateTime && '' != this.daterangeCreateTime) {
        this.queryParams.params["beginCreateTime"] = this.daterangeCreateTime[0];
        this.queryParams.params["endCreateTime"] = this.daterangeCreateTime[1];
      }
      getStorageFileListByUserId(this.queryParams,$route.params.userId).then(response => {
        this.fileList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.uploadOpen = false;
      this.openDir = false;
      this.updteOpen = false;
      this.openShare = false;
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
    /** 新建文件夹按钮操作 */
    handleAddDir() {
      this.reset();
      this.openDir = true;
      this.title = "新建文件夹";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getFile(id).then(response => {
        this.form = response.data;
        if(this.form.isDir===1) {
          this.openDir = true;
          this.title = "修改文件夹";
        }else {
          this.updteOpen = true;
          this.title = "修改文件";
        }
      });
    },
    submitDirForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.parentId = this.queryParams.parentId;
          this.form.isDir = 1;
          if (this.form.id != null) {
            updateFile(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.openDir = false;
              this.getList();
            });
          } else {
            addFile(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.openDir = false;
              this.getList();
            });
          }
        }
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
        this.skipList.push(disk.id);
        this.skipList = [...new Set(this.skipList)].sort();
        this.uploadFileUrl = process.env.VUE_APP_BASE_API + "/disk/file/upload/"+disk.id
        this.getList();
      }
    },
    handleSkip(skip) {
      if(skip===0) {
        let index = this.skipList.indexOf(this.queryParams.parentId);
        this.skip(index-1)
      }else {
        let index = this.skipList.indexOf(this.queryParams.parentId);
        this.skip(index+1)
      }
    },
    skip(nextIndex) {
      if (nextIndex<0) {
        this.queryParams.parentId =0;
        this.getList();
      }else if (nextIndex>=this.skipList.length) {
        this.queryParams.parentId =0;
        this.getList();
      } else {
        this.queryParams.parentId = this.skipList[nextIndex];
        this.getList();
      }
    },
    handleShare() {
      this.shareFrom = {
        secretKeyRadio: "1",
        expirationTimeRadio: "1",
        type: "0"
      };
      this.shareResult={}
      this.shareOk = false;
      this.title = "分享"
      this.openShare = true;
    },
    /** 提交按钮 */
    submitShareForm() {

      if (this.shareFrom.type===0 && this.shareFrom.expirationTimeRadio==="2") {
        this.$refs["shareFrom"].validateField("expirationTime",valid => {
          if (!valid) {
            return;
          }
        });
      }
      if (this.shareFrom.type===0 && this.shareFrom.secretKeyRadio==="2") {
        this.$refs["shareFrom"].validateField("secretKey",valid => {
          if (!valid) {
            return;
          }
        });
      }
      this.shareFrom.fileIds = this.ids.join(",");
      addShare(this.shareFrom).then(response => {
        this.shareResult = response.data;
        this.shareOk = true;
      });
    },
    copySuccess() {
      this.$modal.msgSuccess("复制成功");
    },
    copyFailed() {
      this.$modal.msgError("复制失败");
    },
    handleelDownload(row) {
      const ids = row.id || this.ids;
      const data = {
        ids: ids.join(",")
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
