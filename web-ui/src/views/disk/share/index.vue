<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="过期时间">
        <el-date-picker
          v-model="daterangeExpirationTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
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
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['disk:share:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['disk:share:edit']"
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
          v-hasPermi="['disk:share:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['disk:share:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="shareList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="id" align="center" prop="id" />-->
<!--      <el-table-column label="分享的文件ids" align="center" prop="fileIds" />-->
      <el-table-column label="uuid" align="center" prop="uuid" />
      <el-table-column label="提取码" align="center" prop="secretKey" />
      <el-table-column label="分享方式" align="center" prop="type" >
        <template slot-scope="scope">
          <span v-if="scope.row.type==='0'">私密</span>
          <span v-else>公开</span>
        </template>
      </el-table-column>
      <el-table-column label="是否永久" align="center" prop="isPermanent" >
        <template slot-scope="scope">
          <span>{{ isPermanentFromt(scope.row.isPermanent) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="过期时间" align="center" prop="expirationTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expirationTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建者" align="center" prop="createId" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新者" align="center" prop="updateId" />
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            v-if="scope.row.type==='1'"
            v-clipboard:copy="shareBaseUrl+'uuid=' + scope.row.uuid +'   ' + scope.row.remark"
            v-clipboard:success="copySuccess"
            v-clipboard:error="copyFailed"
          >复制</el-button>
          <el-button
            size="mini"
            type="text"
            v-if="scope.row.type==='0'"
            v-clipboard:copy="shareBaseUrl+'uuid=' + scope.row.uuid +'   提取码：'+scope.row.secretKey+ '   ' + scope.row.remark"
            v-clipboard:success="copySuccess"
            v-clipboard:error="copyFailed"
          >复制</el-button>

          <el-button
            size="mini"
            type="text"
            v-if="scope.row.type==='0'"
            v-clipboard:copy="shareBaseUrl+'uuid=' + scope.row.uuid + '&secretKey='+scope.row.secretKey + '      ' + scope.row.remark"
            v-clipboard:success="copySuccess"
            v-clipboard:error="copyFailed"
          >复制（免填分享码）</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['disk:share:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['disk:share:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改分享对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <div v-if="shareOk===false">
        <el-form ref="form" :model="form" :rules="rules" label-width="80px">
          <el-form-item label="分享方式：">
            <el-radio v-model="form.type" label="0">私密</el-radio>
            <el-radio v-model="form.type" label="1">公开</el-radio>
          </el-form-item>
          <el-form-item v-if="form.type==='0'" label="提取码" prop="secretKey">
            <el-radio v-model="form.secretKeyRadio" label="1">系统生成</el-radio>
            <el-radio v-model="form.secretKeyRadio" label="2">自定义</el-radio>
            <el-input v-if="form.secretKeyRadio==='2'" v-model="form.secretKey" placeholder="请输入" />
          </el-form-item>
          <el-form-item label="过期时间" prop="expirationTime">
            <el-radio v-model="form.expirationTimeRadio" label="1">永久</el-radio>
            <el-radio v-model="form.expirationTimeRadio" label="2">自定义</el-radio>
            <el-date-picker v-if="form.expirationTimeRadio==='2'" clearable
                            v-model="form.expirationTime"
                            type="datetime"
                            align="right"
                            :picker-options="pickerOptions"
                            placeholder="请选择">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="备注" prop="remark">
            <el-input v-model="form.remark" placeholder="请输入备注" />
          </el-form-item>
        </el-form>
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
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listShare, getShare, delShare, addShare, updateShare } from "@/api/disk/share";

export default {
  name: "Share",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 分享表格数据
      shareList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 删除标志时间范围
      daterangeExpirationTime: [],
      // 删除标志时间范围
      daterangeCreateTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fileIds: null,
        uuid: null,
        secretKey: null,
        expirationTime: null,
        createId: null,
        createTime: null,
        updateId: null,
      },
      // 表单参数
      form: {
        secretKeyRadio: "1",
        expirationTimeRadio: "1",
        isPermanent: 0,
        type: '0'
      },
      // 表单校验
      rules: {
      },
      shareBaseUrl: '',
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now();
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
      shareOk: false
    };
  },
  created() {
    this.getList();
    this.getConfigKey("font.baseUrl").then(response => {
      this.shareBaseUrl = response.msg + "/external/share/share-list?";
    });
  },
  methods: {
    /** 查询分享列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeExpirationTime && '' != this.daterangeExpirationTime) {
        this.queryParams.params["beginExpirationTime"] = this.daterangeExpirationTime[0];
        this.queryParams.params["endExpirationTime"] = this.daterangeExpirationTime[1];
      }
      if (null != this.daterangeCreateTime && '' != this.daterangeCreateTime) {
        this.queryParams.params["beginCreateTime"] = this.daterangeCreateTime[0];
        this.queryParams.params["endCreateTime"] = this.daterangeCreateTime[1];
      }
      listShare(this.queryParams).then(response => {
        this.shareList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        fileIds: null,
        uuid: null,
        secretKey: null,
        expirationTime: null,
        createId: null,
        createTime: null,
        updateId: null,
        updateTime: null,
        remark: null,
        delFlag: null,
        secretKeyRadio: "1",
        expirationTimeRadio: "1"
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeExpirationTime = [];
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
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加分享";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      this.shareResult={}
      this.shareOk = false;
      getShare(id).then(response => {
        this.form = response.data;
        this.form.secretKeyRadio = "2";
        this.form.expirationTimeRadio = this.form.isPermanent===1?"2":"1";
        this.open = true;
        this.title = "修改分享";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateShare(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.shareResult = response.data;
              this.shareOk = true;
              this.open = false;
              this.getList();
            });
          } else {
            addShare(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除分享编号为"' + ids + '"的数据项？').then(function() {
        return delShare(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('disk/share/export', {
        ...this.queryParams
      }, `share_${new Date().getTime()}.xlsx`)
    },
    copySuccess() {
      this.$modal.msgSuccess("复制成功");
    },
    copyFailed() {
      this.$modal.msgError("复制失败");
    },
    isPermanentFromt(isPermanent) {
      return isPermanent===0?"否":"是";
    }
  }
};
</script>
