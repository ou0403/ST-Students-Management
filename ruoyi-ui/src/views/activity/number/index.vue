<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="期数名称" prop="number">
        <el-input
          v-model="queryParams.number"
          placeholder="请输入期数名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="总周数" prop="numberWeeks">
        <el-input
          v-model="queryParams.numberWeeks"
          placeholder="请输入总周数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开学日期" prop="numberTime">
        <el-date-picker clearable
                        v-model="queryParams.numberTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择开学日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="创建时间" prop="creatTime">
        <el-date-picker clearable
                        v-model="queryParams.creatTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
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
          v-hasPermi="['activity:number:add']"
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
          v-hasPermi="['activity:number:edit']"
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
          v-hasPermi="['activity:number:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['activity:number:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="numberList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="numberId" />
      <el-table-column label="期数名称" align="center" prop="number" />
      <el-table-column label="期数描述" align="center" prop="numberDescribe" />
      <el-table-column label="总周数" align="center" prop="numberWeeks" />
      <el-table-column label="开学日期" align="center" prop="numberTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.numberTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" prop="user.nickName" />
      <el-table-column label="创建时间" align="center" prop="creatTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.creatTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['activity:number:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['activity:number:remove']"
          >删除</el-button>

          <el-dropdown size="mini" @command="(command) => todayView(command, scope.row)">
            <el-button size="mini" type="text" icon="el-icon-more">查看</el-button>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="0" icon="el-icon-circle-check">行事历</el-dropdown-item>
              <el-dropdown-item command="1" icon="el-icon-date">时间表</el-dropdown-item>
              <el-dropdown-item command="2" icon="el-icon-star-off">部门颜色</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
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

    <!-- 添加或修改行事历期数对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="期数名称" prop="number">
          <el-input v-model="form.number" placeholder="请输入期数名称" />
        </el-form-item>
        <el-form-item label="期数描述" prop="numberDescribe">
          <el-input v-model="form.numberDescribe" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="开学日期" prop="numberTime" v-if="modify">
          <el-date-picker clearable
                          v-model="form.numberTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="必须是周一">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="总周数" prop="numberWeeks" v-if="modify">
          <el-input-number v-model="form.numberWeeks" placeholder="请输入总周数"/>
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
import { listNumber, getNumber, delNumber, addNumber, updateNumber } from "@/api/activity/number";
import {getRoom} from "@/api/leave/room";

export default {
  name: "Number",
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
      // 行事历期数表格数据
      numberList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        number: null,
        numberDescribe: null,
        numberWeeks: null,
        numberTime: null,
        userId: null,
        creatTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        number: [
          { required: true, message: "请输入期数名称", trigger: "blur" },
        ],
        numberDescribe: [
          { required: true, message: "请输入期数描述", trigger: "blur" },
        ],
        numberTime: [
          { required: true, message: "请输入开学日期", trigger: "blur" },
        ],
        numberWeeks: [
          { required: true, message: "请输入总周数", trigger: "blur" },
        ]
      },

      modify:true,
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询行事历期数列表 */
    getList() {
      console.log(this.queryParams);
      this.loading = true;
      listNumber(this.queryParams).then(response => {
        this.numberList = response.rows;
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
        numberId: null,
        number: null,
        numberDescribe: null,
        numberWeeks: null,
        numberTime: null,
        userId: null,
        creatTime: null
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
      this.ids = selection.map(item => item.numberId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.modify = true;
      this.title = "添加行事历期数";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const numberId = row.numberId || this.ids
      getNumber(numberId).then(response => {
        this.form = response.data;
        this.open = true;
        this.modify = false;
        this.title = "修改行事历期数";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.numberId != null) {
            updateNumber(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addNumber(this.form).then(response => {
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
      const numberIds = row.numberId || this.ids;
      this.$modal.confirm('是否确认删除行事历期数编号为"' + numberIds + '"的数据项？').then(function() {
        return delNumber(numberIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('activity/number/export', {
        ...this.queryParams
      }, `number_${new Date().getTime()}.xlsx`)
    },

    todayView(command,row){
      console.log(row);
      switch (command) {
        case "0":
          this.$router.push({
            path: "/event/calendarView",
            query: {
              numberId: row.numberId
            }
          })
          break;
        case "1":
          this.$router.push({
            path: "/event/time",
            query: {
              numberId: row.numberId
            }
          })
          break;
        case "2":
          this.$router.push({
            path: "/event/color",
            query: {
              numberId: row.numberId
            }
          })
          break;
        default:

          break;
      }
    },
  }
};
</script>
