<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="创建者" prop="createId">
        <el-input
          v-model="queryParams.createId"
          placeholder="请输入创建者"
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['disk:recovery:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-refresh"
          size="mini"
          :disabled="multiple"
          @click="handleRefresh"
          v-hasPermi="['disk:recovery:add']"
        >恢复</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="dataRefresh"></right-toolbar>
    </el-row>

    <el-main  v-loading="loading">
      <el-checkbox-group v-model="checkboxFileIds">
        <div style="margin-left: 20px" v-for="recovery in recoveryList">
          <div v-for="(itme,index) in recovery.diskFileList">
            <div style="float: left;width: 120px;height: 130px;margin-left: 25px;margin-right: 25px;margin-top: 20px;position: relative;" >
              <el-checkbox-button v-if="itme.isDir===1" @change="handleCheckboxChange" :label="recovery.id" :key="recovery.id" size="medium">
                <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" @dblclick="checkboxOndblclick(itme)" class="grid-content bg-purple">
                  <img style="width: 100px;height: 100px" src="@/assets/images/dir.png"/>
                  <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button v-if="itme.isDir===0&&itme.type===0" @change="handleCheckboxChange" :label="recovery.id" :key="recovery.id" size="medium">
                <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" class="grid-content bg-purple">
                  <image-preview :src="itme.url" :width="100" :height="100"/>
                  <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button v-if="itme.isDir===0&&itme.type===1" @change="handleCheckboxChange" :label="recovery.id" :key="recovery.id" size="medium">
                <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" class="grid-content bg-purple">
                   <div style="width: 100px;height: 83px;">
                      <vue-core-video-player preload="none" :title="itme.name" :src="baseUrl+itme.url"/>
                    </div>
                  <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;margin-top: 20px'>
                    {{itme.name}}
                  </div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button v-if="itme.isDir===0&&itme.type===2" @change="handleCheckboxChange" :label="recovery.id" :key="recovery.id" size="medium">
                <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" class="grid-content bg-purple">
                  <img style="width: 100px;height: 100px" src="@/assets/images/file_open.png"/>
                  <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button v-if="itme.isDir===0&&itme.type===3" @change="handleCheckboxChange" :label="recovery.id" :key="recovery.id" size="medium">
                <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" class="grid-content bg-purple">
                  <img style="width: 100px;height: 100px" src="@/assets/images/file_music.png"/>
                  <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
                </div>
              </el-checkbox-button>
              <el-checkbox-button v-if="itme.isDir===0&&itme.type===4" @change="handleCheckboxChange" :label="recovery.id" :key="recovery.id" size="medium">
                <div v-on:mouseover="mouseEnter(itme.id)" @mouseleave="mouseLeave(itme.id)" class="grid-content bg-purple">
                  <img style="width: 100px;height: 100px" src="@/assets/images/file_open.png" alt=""/>
                  <div style='width:80px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>{{itme.name}}</div>
                </div>
              </el-checkbox-button>

              <div v-if="currentId===itme.id" class="Extra-Text">
                <span>文件名：{{ itme.name }}</span><br/>
                <span>
                  文件大小：{{ storageUnitConversion(itme.size)}} &nbsp;&nbsp;
                  创建时间：{{ parseTime(itme.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}&nbsp;&nbsp;
                  更新时间：{{ parseTime(itme.updateTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
                </span>
              </div>

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

    <!-- 添加或修改回收站对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文件id" prop="fileId">
          <el-input v-model="form.fileId" placeholder="请输入文件id" />
        </el-form-item>
        <el-form-item label="创建者" prop="createId">
          <el-input v-model="form.createId" placeholder="请输入创建者" />
        </el-form-item>
        <el-form-item label="更新者" prop="updateId">
          <el-input v-model="form.updateId" placeholder="请输入更新者" />
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
import { listRecovery, getRecovery, delRecovery, addRecovery, updateRecovery,refresh } from "@/api/disk/recovery";

export default {
  name: "Recovery",
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
      // 回收站表格数据
      recoveryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 备注时间范围
      daterangeCreateTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        createId: null,
        createTime: null,
        updateId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      checkboxFileIds: [],
      baseUrl: process.env.VUE_APP_BASE_API,
      currentId: -1
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询回收站列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeCreateTime && '' != this.daterangeCreateTime) {
        this.queryParams.params["beginCreateTime"] = this.daterangeCreateTime[0];
        this.queryParams.params["endCreateTime"] = this.daterangeCreateTime[1];
      }
      listRecovery(this.queryParams).then(response => {
        this.recoveryList = response.rows;
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
        fileId: null,
        createId: null,
        createTime: null,
        updateId: null,
        updateTime: null,
        remark: null
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
      this.ids = this.checkboxFileIds;
      this.single = this.checkboxFileIds.length!==1
      this.multiple = !this.checkboxFileIds.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加回收站";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getRecovery(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改回收站";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateRecovery(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRecovery(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除回收站编号为"' + ids + '"的数据项？').then(function() {
        return delRecovery(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('disk/recovery/export', {
        ...this.queryParams
      }, `recovery_${new Date().getTime()}.xlsx`)
    },
    handleRefresh(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认恢复回收站编号为"' + ids + '"的数据项？').then(function() {
        return refresh(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("恢复成功");
      }).catch(() => {});
    },
    //刷新
    dataRefresh() {
      this.ids = [];
      this.checkboxFileIds = [];
      this.getList();
    },
    mouseEnter(id) {
      this.currentId = id;
    },
    mouseLeave(id) {
      this.currentId = -1;
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
