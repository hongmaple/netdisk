<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="68px">
      <el-form-item label="文件名" prop="filename">
        <el-input
          v-model="queryParams.filename"
          placeholder="请输入文件名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <div>

        </div>
        <el-button type="primary" icon="el-icon-upload" size="mini" @click="upload" v-hasPermi="['system:file:upload']">上传</el-button>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery" v-hasPermi="['disk:backFilelist:query']">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:filelist:remove']"
        >删除</el-button>
      </el-col>
      <!--      <el-col :span="1.5">
              <el-button
                type="warning"
                icon="el-icon-download"
                size="mini"
                @click="handleExport"
                v-hasPermi="['background:filelist:export']"
              >导出</el-button>
            </el-col>-->
    </el-row>

    <el-table v-loading="loading" :data="filelistList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="文件名" align="center" prop="filename" />
      <el-table-column label="本地地址" align="center" prop="location" />
      <el-table-column label="文件总大小" align="center" prop="totalSize" :formatter="storageFormatter"/>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改已上传文件列表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文件名" prop="filename">
          <el-input v-model="form.filename" placeholder="请输入文件名" />
        </el-form-item>
        <el-form-item label="唯一标识,MD5" prop="identifier">
          <el-input v-model="form.identifier" placeholder="请输入唯一标识,MD5" />
        </el-form-item>
        <el-form-item label="链接" prop="url">
          <el-input v-model="form.url" placeholder="请输入链接" />
        </el-form-item>
        <el-form-item label="本地地址" prop="location">
          <el-input v-model="form.location" placeholder="请输入本地地址" />
        </el-form-item>
        <el-form-item label="文件总大小" prop="totalSize">
          <el-input v-model="form.totalSize" placeholder="请输入文件总大小" />
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
import { listFilelist, getFilelist, delFilelist, addFilelist, updateFilelist, exportFilelist } from "@/api/disk/fileManage";
import Bus from '@/assets/js/bus';
import {getToken} from '@/utils/auth'

export default {
  name: "Files",
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
      // 总条数
      total: 0,
      // 已上传文件列表表格数据
      filelistList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        filename: undefined,
        identifier: undefined,
        url: undefined,
        location: undefined,
        totalSize: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        filename: [
          { required: true, message: "文件名不能为空", trigger: "blur" }
        ],
        identifier: [
          { required: true, message: "唯一标识,MD5不能为空", trigger: "blur" }
        ],
        url: [
          { required: true, message: "链接不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    storageFormatter(row, column){
      let totalSize= row.totalSize;
      //1073741824为1G
      if(totalSize>=1073741824){
        return Math.round((row.totalSize/1073741824)*100)/100+"G"
      }else if(totalSize>=1048576){ //1048576为1M
        return  Math.round((row.totalSize/1048576)*100)/100+"M"
      }else{
        return  Math.round((row.totalSize/1024)*100)/100+"K"
      }
    },
    upload() {
      // 打开文件选择框
      Bus.$emit('openUploader', {
        token:getToken()
      })
    },
    /** 查询已上传文件列表列表 */
    getList() {
      this.loading = true;
      listFilelist(this.queryParams).then(response => {
        this.filelistList = response.rows;
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
        id: undefined,
        filename: undefined,
        identifier: undefined,
        url: undefined,
        location: undefined,
        totalSize: undefined
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
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    // handleSelectionChange(selection) {
    //   this.ids = selection.map(item => item.id)
    //   this.single = selection.length!=1
    //   this.multiple = !selection.length
    // },

    /** 多选框选中数据 */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加已上传文件列表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getFilelist(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改已上传文件列表";
      });
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != undefined) {
            updateFilelist(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              } else {
                this.msgError(response.msg);
              }
            });
          } else {
            addFilelist(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              } else {
                this.msgError(response.msg);
              }
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认删除已上传文件列表编号为"' + ids + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function() {
        return delFilelist(ids);
      }).then(() => {
        this.getList();
        this.msgSuccess("删除成功");
      }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有已上传文件列表数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function() {
        return exportFilelist(queryParams);
      }).then(response => {
        this.download(response.msg);
      }).catch(function() {});
    }
  },
  mounted() {
    // 文件选择后的回调
    Bus.$on('fileAdded', () => {
      console.log('文件已选择')
    });

    // 文件上传成功的回调
    Bus.$on('fileSuccess', () => {
      console.log('文件上传成功')
    });
  }
};
</script>
