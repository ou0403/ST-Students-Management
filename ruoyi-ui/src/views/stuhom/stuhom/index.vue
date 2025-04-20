<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">

      <el-form-item label="学生ID" prop="studentId">
        <el-input
          v-model="queryParams.studentId"
          placeholder="请输入学生ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--      <el-form-item label="批改情况，默认未批改" prop="graded">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.graded"-->
      <!--          placeholder="请输入批改情况，默认未批改"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->
      <!--      <el-form-item label="得分，支持最多5位数字，其中2位小数" prop="score">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.score"-->
      <!--          placeholder="请输入得分，支持最多5位数字，其中2位小数"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->
      <!--      <el-form-item label="批改时间" prop="gradeTime">-->
      <!--        <el-date-picker clearable-->
      <!--                        v-model="queryParams.gradeTime"-->
      <!--                        type="date"-->
      <!--                        value-format="yyyy-MM-dd"-->
      <!--                        placeholder="请选择批改时间">-->
      <!--        </el-date-picker>-->
      <!--      </el-form-item>-->


      <!--      <el-form-item label="部门id" prop="department">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.department"-->
      <!--          placeholder="请输入部门id"-->
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
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['stuhom:stuhom:add']"
        >新增</el-button>
        <!--      </el-col>-->
        <!--      <el-col :span="1.5">-->
        <!--        <el-button-->
        <!--          type="success"-->
        <!--          plain-->
        <!--          icon="el-icon-edit"-->
        <!--          size="mini"-->
        <!--          :disabled="single"-->
        <!--          @click="handleUpdate"-->
        <!--          v-hasPermi="['stuhom:stuhom:edit']"-->
        <!--        >修改</el-button>-->
        <!--      </el-col>-->
        <!--      <el-col :span="1.5">-->
        <!--        <el-button-->
        <!--          type="danger"-->
        <!--          plain-->
        <!--          icon="el-icon-delete"-->
        <!--          size="mini"-->
        <!--          :disabled="multiple"-->
        <!--          @click="handleDelete"-->
        <!--          v-hasPermi="['stuhom:stuhom:remove']"-->
        <!--        >删除</el-button>-->
        <!--      </el-col>-->
        <!--      <el-col :span="1.5">-->
        <!--        <el-button-->
        <!--          type="warning"-->
        <!--          plain-->
        <!--          icon="el-icon-download"-->
        <!--          size="mini"-->
        <!--          @click="handleExport"-->
        <!--          v-hasPermi="['stuhom:stuhom:export']"-->
        <!--        >导出</el-button>-->
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="homeworkList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="作业标题" align="center" prop="title" />
      <el-table-column label="作业内容" align="center" prop="content">
        <template slot-scope="scope">
          <!-- 仅显示汉字部分，可以通过正则去除非汉字字符 -->
          <span>{{ filterChinese(scope.row.content) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="截止日期" align="center" prop="dueDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.dueDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="发布教师" align="center" prop="nickName" />
      <!--      <el-table-column label="备注1" align="center" prop="remark" />-->
      <!--      <el-table-column label="备注2" align="center" prop="remark1" />-->
      <!--      <el-table-column label="备注3" align="center" prop="remark2" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">

            <el-button
              v-if="!isTitleSubmitted(scope.row.title)"
              type="text"
              icon="el-icon-plus"
              size="mini"
              @click="handleAdd(scope.row)"
              v-hasPermi="['stuhom:stuhom:add']"
            >新增</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['homework:homework:edit']"
            >修改</el-button>
            <el-button
              size="mini"
              type="text"
              @click="handleALLDate(scope.row)"
              v-hasPermi="['homework:homework:remove']"
            >上交情况</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改提交作业对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="提交内容" prop="submission">
          <file-upload v-model="form.submission"/>
        </el-form-item>
        <el-form-item label="备注1" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注1" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog :title="title" :visible.sync="opens" width="800px" append-to-body>
      <el-table v-loading="loading" :data="stuhomList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="学生姓名" align="center" prop="nickName" />
        <el-table-column label="提交内容" align="center" prop="submission">
          <template slot-scope="scope">
            <!-- 仅显示汉字部分，可以通过正则去除非汉字字符 -->
            <span>{{ filterChinese(scope.row.submission) }}</span>
          </template>
        </el-table-column>
        <el-table-column label="提交时间" align="center" prop="submissionTime" width="180">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.submissionTime, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['stuhom:stuhom:edit']"
            >修改</el-button>
            <el-button
              size="mini"
              type="text"
              @click="handleDelete(scope.row)"
              v-hasPermi="['stuhom:stuhom:remove']"
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
    </el-dialog>
  </div>
</template>

<script>
import { listStuhom, getStuhom, delStuhom, addStuhom, updateStuhom } from '@/api/stuhom/stuhom'
import { getHomework, listHomework,listHomeworkStu } from '@/api/homework/homework'
import { getDept, getDeptStu } from '@/api/system/dept'

export default {
  name: "Stuhom",
  data() {
    return {
      //添加作业id的数组
      formStu:[],
      pandaun:0,
      opens:false,
      homeworkList:[],
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
      // 提交作业表格数据
      stuhomList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        homeworkId: null,
        studentId: null,
        submission: null,
        submissionTime: null,
        graded: null,
        score: null,
        gradeTime: null,
        remark1: null,
        remark2: null,
        department: null,
        timeLimit: null
      },
      queryParamsHow: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        content: null,
        dueDate: null,
        teacherId: null,
        remark: null,
        remark1: null,
        remark2: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {}
    };
  },
  created() {
    // this.getList();
    // this.getListss();
    this.handleStu();
  },
  methods: {
    filterChinese(text) {
      // 正则匹配汉字
      return text.replace(/[^\u4e00-\u9fa5]/g, '');
    },
    isTitleSubmitted(title) {
      return this.stuhomList.some(item => item.title === title);
    },
    handleALLDate(row) {
      this.loading = true;
      this.queryParamsHow.title=row.title
      console.log(this.queryParamsHow.title)
      listStuhom(this.queryParamsHow).then(response => {
        this.stuhomList=response.rows;
        console.log(this.stuhomList)
        this.opens = true;
        this.total = response.total;
        this.loading = false;
      });
    },
    getListss() {
      this.loading = true;
      listHomework(this.queryParamsHow).then(response => {
        this.homeworkList = response.rows;
        console.log(this.homeworkList)
        this.total = response.total;
        this.loading = false;
      });
    },

    /** 通过子id获取父级id来实现查询自己老师发布的作业 */
    handleStu() {
      console.log('11')
      getDeptStu().then(response => {
        console.log("111")
        this.form = response.data;
        this.queryParamsHow.remark = this.form[0].parentId
        console.log(this.queryParamsHow.remark)
        this.loading = true;
        listHomeworkStu(this.queryParamsHow).then(response => {
          this.homeworkList = response.rows;
          console.log(this.homeworkList)
          this.total = response.total;
          this.loading = false;
        });
        // listDeptExcludeChild(row.deptId).then(response => {
        //   this.deptOptions = this.handleTree(response.data, "deptId");
        //   if (this.deptOptions.length == 0) {
        //     const noResultsOptions = { deptId: this.form.parentId, deptName: this.form.parentName, children: [] };
        //     this.deptOptions.push(noResultsOptions);
        //   }
        // });
      });
    },
    /** 查询提交作业列表 */
    getList() {
      this.loading = true;
      listStuhom(this.queryParams).then(response => {
        this.stuhomList = response.rows;
        console.log(this.stuhomList)
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
    reset(row) {
      this.form = {
        id: null,
        homeworkId: null,
        studentId: null,
        submission: null,
        submissionTime: null,
        graded: null,
        score: null,
        gradeTime: null,
        remark: null,
        remark1: null,
        remark2: null,
        department: null,
        timeLimit: null
      };
      this.form.homeworkId=row.id;
      console.log(this.form.homeworkId);
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
    handleAdd(row) {
      console.log(row)
      this.reset(row);
      this.open = true;
      this.title = "添加发布作业";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getStuhom(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改提交作业";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {

        if (valid) {
          if (this.form.id != null) {
            getDeptStu().then(response => {
              console.log("111")
              this.formStu = response.data;
              this.form.department=this.formStu[0].parentId
              console.log(this.queryParamsHow.remark)
            })
            updateStuhom(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            getDeptStu().then(response => {
              console.log("111")
              this.formStu = response.data;
              this.form.department=this.formStu[0].parentId
              console.log(this.formStu[0].parentId)
              console.log(this.form)
                addStuhom(this.form).then(response => {
                  this.$modal.msgSuccess("新增成功");
                  this.pandaun=1;
                  this.open = false;
                  this.getList();
                })
            })

          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除提交作业编号为"' + ids + '"的数据项？').then(function() {
        return delStuhom(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('stuhom/stuhom/export', {
        ...this.queryParams
      }, `stuhom_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
