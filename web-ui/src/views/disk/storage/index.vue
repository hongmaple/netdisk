<template>
  <div class="app-container">
    <el-form v-if="checkRole(['admin'])" :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="总容量" prop="totalCapacity">
        <el-input
          v-model="queryParams.totalCapacity"
          placeholder="请输入总容量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="已用容量" prop="usedCapacity">
        <el-input
          v-model="queryParams.usedCapacity"
          placeholder="请输入已用容量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建者" prop="createId">
        <el-input
          v-model="queryParams.createId"
          placeholder="请输入创建者"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="更新者" prop="updateId">
        <el-input
          v-model="queryParams.updateId"
          placeholder="请输入更新者"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row v-if="checkRole(['admin'])" :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['disk:storage:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['disk:storage:edit']"
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
          v-hasPermi="['disk:storage:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['disk:storage:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-if="checkRole(['admin'])" v-loading="loading" :data="storageList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="" align="center" prop="id" />-->
      <el-table-column label="基础目录" align="center" prop="baseDir" />
      <el-table-column label="总容量" align="center" prop="totalCapacity" >
        <template slot-scope="scope">
          <span>{{ storageUnitConversion(scope.row.totalCapacity, 'mb') }} MB</span>
        </template>
      </el-table-column>
      <el-table-column label="已用容量" align="center" prop="usedCapacity" >
        <template slot-scope="scope">
          <span>{{ storageUnitConversion(scope.row.usedCapacity, 'mb') }} MB</span>
        </template>
      </el-table-column>
      <el-table-column label="用户名" align="center" prop="sysUser.userName" />
      <el-table-column label="用户昵称" align="center" prop="sysUser.nickName" />
      <el-table-column label="用户头像" align="center" prop="sysUser.avatar" >
        <template slot-scope="scope">
          <image-preview :src="scope.row.sysUser.avatar" :width="100" :height="100"/>
        </template>
      </el-table-column>
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
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['disk:storage:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['disk:storage:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <div @click="skipFileList" style="border: 2px solid;border-image: linear-gradient(to right, #743ad5, #d53a9d) 1;width: 350px;height: 150px;text-align: center" v-if="!checkRole(['admin'])" v-for="item in storageList">
      <div style="margin-top: 10px">
        <img style="width: 50px;height: 50px" src="@/assets/images/disk.png"/>
      </div>
      <div>
        总容量：
        <span>{{ storageUnitConversion(item.totalCapacity, 'mb') }}  MB</span>
      </div>
      <div>
        已用容量：
        <span>{{ storageUnitConversion(item.usedCapacity, 'mb') }}  MB</span>
      </div>
    </div>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改用户存储对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
       <!-- <el-form-item label="基础目录" prop="baseDir">
          <el-input v-model="form.baseDir" placeholder="请输入基础目录" />
        </el-form-item> -->
        <el-form-item label="总容量" prop="totalCapacity">
          <el-input v-model="form.totalCapacity" placeholder="请输入总容量" />
        </el-form-item>
        <el-form-item label="已用容量" prop="usedCapacity">
          <el-input v-model="form.usedCapacity" placeholder="请输入已用容量" />
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
import { listStorage, getStorage, delStorage, addStorage, updateStorage } from "@/api/disk/storage";
import { checkRole } from "@/utils/permission"; // 权限判断函数

export default {
  name: "Storage",
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
      // 用户存储表格数据
      storageList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        totalCapacity: null,
        usedCapacity: null,
        createId: null,
        updateId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询用户存储列表 */
    getList() {
      this.loading = true;
      listStorage(this.queryParams).then(response => {
        this.storageList = response.rows;
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
        baseDir: null,
        totalCapacity: null,
        usedCapacity: null,
        createId: null,
        createTime: null,
        updateId: null,
        updateTime: null,
        remark: null,
        delFlag: null
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
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加用户存储";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getStorage(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改用户存储";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateStorage(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addStorage(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除用户存储编号为"' + ids + '"的数据项？').then(function() {
        return delStorage(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('disk/storage/export', {
        ...this.queryParams
      }, `storage_${new Date().getTime()}.xlsx`)
    },
    checkRole,
    skipFileList() {
      this.$router.push({ path: "/disk/file" });
    }
  }
};
</script>
