<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="请假表id" prop="leaveId">
        <el-input
          v-model="queryParams.leaveId"
          placeholder="请输入请假表id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户表id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户表id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审批状态" prop="approvalStatuss">
        <el-input
          v-model="queryParams.approvalStatuss"
          placeholder="请输入审批状态"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审批顺序" prop="approvalSequence">
        <el-input
          v-model="queryParams.approvalSequence"
          placeholder="请输入审批顺序"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审批留言" prop="approvalMessage">
        <el-input
          v-model="queryParams.approvalMessage"
          placeholder="请输入审批留言"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审批时间" prop="approvalTime">
        <el-date-picker clearable
          v-model="queryParams.approvalTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择审批时间">
        </el-date-picker>
      </el-form-item>
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
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['leave:approval:add']"
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
          v-hasPermi="['leave:approval:edit']"
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
          v-hasPermi="['leave:approval:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['leave:approval:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="approvalList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="approvalId" />
      <el-table-column label="请假表id" align="center" prop="leaveId" />
      <el-table-column label="用户表id" align="center" prop="userId" />
      <el-table-column label="审批状态" align="center" prop="approvalStatuss" />
      <el-table-column label="审批顺序" align="center" prop="approvalSequence" />
      <el-table-column label="审批留言" align="center" prop="approvalMessage" />
      <el-table-column label="审批时间" align="center" prop="approvalTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.approvalTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['leave:approval:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['leave:approval:remove']"
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

    <!-- 添加或修改请假审批对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="请假表id" prop="leaveId">
          <el-input v-model="form.leaveId" placeholder="请输入请假表id" />
        </el-form-item>
        <el-form-item label="用户表id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户表id" />
        </el-form-item>
        <el-form-item label="审批状态" prop="approvalStatuss">
          <el-input v-model="form.approvalStatuss" placeholder="请输入审批状态" />
        </el-form-item>
        <el-form-item label="审批顺序" prop="approvalSequence">
          <el-input v-model="form.approvalSequence" placeholder="请输入审批顺序" />
        </el-form-item>
        <el-form-item label="审批留言" prop="approvalMessage">
          <el-input v-model="form.approvalMessage" placeholder="请输入审批留言" />
        </el-form-item>
        <el-form-item label="审批时间" prop="approvalTime">
          <el-date-picker clearable
            v-model="form.approvalTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择审批时间">
          </el-date-picker>
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
import { listApproval, getApproval, delApproval, addApproval, updateApproval } from "@/api/leave/approval";

export default {
  name: "Approval",
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
      // 请假审批表格数据
      approvalList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        leaveId: null,
        userId: null,
        approvalStatuss: null,
        approvalSequence: null,
        approvalMessage: null,
        approvalTime: null
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
    /** 查询请假审批列表 */
    getList() {
      this.loading = true;
      listApproval(this.queryParams).then(response => {
        this.approvalList = response.rows;
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
        approvalId: null,
        leaveId: null,
        userId: null,
        approvalStatuss: null,
        approvalSequence: null,
        approvalMessage: null,
        approvalTime: null
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
      this.ids = selection.map(item => item.approvalId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加请假审批";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const approvalId = row.approvalId || this.ids
      getApproval(approvalId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改请假审批";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.approvalId != null) {
            updateApproval(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addApproval(this.form).then(response => {
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
      const approvalIds = row.approvalId || this.ids;
      this.$modal.confirm('是否确认删除请假审批编号为"' + approvalIds + '"的数据项？').then(function() {
        return delApproval(approvalIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('leave/approval/export', {
        ...this.queryParams
      }, `approval_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
