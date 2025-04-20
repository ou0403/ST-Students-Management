<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学生id" prop="stuId">
        <el-input
          v-model="queryParams.stuId"
          placeholder="请输入学生id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="简历类型" prop="resumeSummary">
        <el-select v-model="queryParams.resumeSummary" placeholder="请选择简历类型" clearable>
          <el-option
            v-for="dict in dict.type.resume"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['Resume:Resume:add']"
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
          v-hasPermi="['Resume:Resume:edit']"
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
          v-hasPermi="['Resume:Resume:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['Resume:Resume:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ResumeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学生姓名" align="center" prop="userName" />
      <el-table-column label="简历名称" align="center" prop="notes">
        <template slot-scope="scope">
          <span>{{ filterChinese(scope.row.notes) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="简历类型" align="center" prop="resumeSummary">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.resume" :value="scope.row.resumeSummary"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['Resume:Resume:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['Resume:Resume:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-folder"
            @click="handleViewResume(scope.row)"
            v-hasPermi="['Resume:Resume:remove']"
          >查看简历</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-folder"
            @click="handleWork(scope.row)"
            v-hasPermi="['Resume:Resume:remove']"
          >简历投递</el-button>
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

    <el-dialog :title="title" :visible.sync="openWork" width="1200px" append-to-body>
      <el-form :model="queryParams" ref="queryFormWork" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="公司名称" prop="homeworkName">
          <el-input
            v-model="queryParams.homeworkName"
            placeholder="请输入公司名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="简历状态" prop="homeworkStatic">
          <el-input
            v-model="queryParams.homeworkStatic"
            placeholder="请输入简历状态"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="工作岗位" prop="workPost">
          <el-input
            v-model="queryParams.workPost"
            placeholder="请输入工作岗位"
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
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAddwork"
            v-hasPermi="['ResumeWork:work:add']"
          >新增</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdatework"
            v-hasPermi="['ResumeWork:work:edit']"
          >修改</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDeletework"
            v-hasPermi="['ResumeWork:work:remove']"
          >删除</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExportwork"
            v-hasPermi="['ResumeWork:work:export']"
          >导出</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>

      <el-table v-loading="loading" :data="workList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="公司名称" align="center" prop="homeworkName" />
        <el-table-column label="简历状态" align="center" prop="homeworkStatic" />
        <el-table-column label="工作岗位" align="center" prop="workPost" />
        <el-table-column label="备注" align="center" prop="remark" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdatework(scope.row)"
              v-hasPermi="['ResumeWork:work:edit']"
            >修改</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDeletework(scope.row)"
              v-hasPermi="['ResumeWork:work:remove']"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
    <!-- 添加或修改简历投递对话框 -->
    <el-dialog :title="title" :visible.sync="openworkAddUpadte" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="公司名称" prop="homeworkName">
          <el-input v-model="form.homeworkName" placeholder="请输入公司名称" />
        </el-form-item>
        <el-form-item label="简历状态" prop="homeworkStatic">
          <el-input v-model="form.homeworkStatic" placeholder="请输入简历状态" />
        </el-form-item>
        <el-form-item label="工作岗位" prop="workPost">
          <el-input v-model="form.workPost" placeholder="请输入工作岗位" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormWork">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改简历管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="简历" prop="notes">
          <file-upload v-model="form.notes"/>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="简历类型" prop="resumeSummary">
          <el-select v-model="form.resumeSummary" placeholder="请选择简历类型">
            <el-option
              v-for="dict in dict.type.resume"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 查看简历对话框 -->
    <el-dialog :title="viewResumeTitle" :visible.sync="viewResumeDialogVisible" width="80%">
      <div v-if="isPdfFile">
        <div v-if="pdfLoading">加载中...</div>
        <vue-pdf
          :src="pdfSrc"
          :page="currentPage"
          @num-pages="onNumPages"
          @loaded="onPdfLoaded"
        ></vue-pdf>
        <div>
          <button @click="prevPage" :disabled="currentPage === 1">上一页</button>
          <span>{{ currentPage }} / {{ totalPages }}</span>
          <button @click="nextPage" :disabled="currentPage === totalPages">下一页</button>
        </div>
      </div>
      <vue-word :src="viewResumeUrl" v-if="isWordFile" :config="wordConfig"></vue-word>
    </el-dialog>
  </div>
</template>

<script>
import { listResume, getResume, delResume, addResume, updateResume } from "@/api/Resume/Resume";
import { getDeptStu } from '@/api/system/dept';
import { listUserOn } from '@/api/system/user';
import { addWork, delWork, getWork, listWork, updateWork } from '@/api/ResumeWork/work';
import pdf from 'vue-pdf';

export default {
  name: "Resume",
  dicts: ['resume'],
  components: {
    'vue-pdf': pdf
  },
  data() {
    return {
      //
      pdfSrc: null,
      currentPage: 1,
      totalPages: 0,
      pdfLoading: true,
      // 简历投递表格数据
      workList: [],
      // 投递简历弹框
      openworkAddUpadte: false,
      // 简历投递弹框
      openWork: false,
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
      // 简历管理表格数据
      ResumeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 当前账号信息
      formUserOn: [],
      // 查询参数
      queryParams: {
        id: null,
        pageNum: 1,
        pageSize: 10,
        stuId: null,
        notes: null,
        resumeSummary: null,
        deptId: null,
        stuDeptId: null,
        qufen: null,
      },
      //
      queryParamsStu: {
        deptId: null,
        stuDeptId: null
      },
      // 查询参数简历投递查询参数
      queryParamsWork: {
        pageNum: 1,
        pageSize: 10,
        homeworkName: null,
        homeworkStatic: null,
        workPost: null,
        remark1: null,
        remark2: null
      },

      formTer: [],
      // 表单参数
      form: {},
      forms: {},
      rules: {
        stuId: [
          { required: true, message: "学生id不能为空", trigger: "blur" }
        ],
      },
      viewResumeDialogVisible: false,
      viewResumeTitle: '',
      viewResumeUrl: '',
      isWordFile: false,
      isPdfFile: false,
      wordConfig: {
        toolbar: false,
        mode: 'view'
      },
      pdfConfig: {
        download: false
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 提交按钮 */
    submitFormWork() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateWork(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addWork(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 查询简历投递列表 */
    getListWork(row) {
      this.loading = true;
      this.queryParamsWork.remark1 = row.stuDeptId
      listWork(this.queryParamsWork).then(response => {
        this.workList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    /** 导出简历投递按钮操作 */
    handleExportwork() {
      this.download('ResumeWork/work/export', {
        ...this.queryParamsWork
      }, `work_${new Date().getTime()}.xlsx`)
    },
    /** 删除简历投递按钮操作 */
    handleDeletework(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除简历投递编号为"' + ids + '"的数据项？').then(function() {
        return delWork(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 修改简历投递按钮操作 */
    handleUpdatework(row) {
      this.reset();
      const id = row.id || this.ids
      getWork(id).then(response => {
        this.form = response.data;
        this.openworkAddUpadte = true;
        this.title = "修改简历投递";
      });
    },
    /** 新增按钮操作 */
    handleAddwork() {
      this.reset();
      this.openworkAddUpadte = true;
      this.title = "添加简历投递";
    },
    // 控制投递简历的弹框
    handleWork(row) {
      this.openWork = true;
      this.getListWork(row);
    },
    // 显示汉字
    filterChinese(text) {
      // 正则匹配汉字
      return text.replace(/[^\u4e00-\u9fa5]/g, '');
    },
    /** 查询简历管理列表 */
    getList() {
      getDeptStu().then(response => {
        console.log("111")
        this.forms = response.data;
        console.log(this.forms)
        this.queryParamsStu.deptId = this.forms[0].parentId
        this.queryParamsStu.stuDeptId = this.forms[0].deptId
        this.loading = true;
        listUserOn().then(responseUser => {
          this.formUserOn = responseUser.rows;
          console.log(responseUser.rows)
          this.queryParams.qufen = this.formUserOn[0].qufen
          listResume(this.queryParams).then(response => {
            this.ResumeList = response.rows;
            console.log(this.ResumeList)
            this.total = response.total;
            this.loading = false;
          });
        });
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
        stuId: null,
        notes: null,
        remark: null,
        resumeSummary: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
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
      this.single = selection.length!== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加简历管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getResume(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改简历管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateResume(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            this.form.deptId = this.forms[0].parentId
            console.log(this.form.deptId)
            addResume(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            })
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除简历管理编号为"' + ids + '"的数据项？').then(function() {
        return delResume(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('Resume/Resume/export', {
        ...this.queryParams
      }, `Resume_${new Date().getTime()}.xlsx`)
    },
    handleExportStuRes(row) {
      console.log(row.id)
      this.queryParams.id = row.id;
      this.download('Resume/Resume/exportStuRes', {
        ...this.queryParams
      }, `Resume_${new Date().getTime()}.zip`)
    },
    handleViewResume(row) {
      this.viewResumeTitle = `查看 ${row.userName} 的简历`;
      this.viewResumeUrl = row.notes;
      this.isWordFile = row.notes.endsWith('.docx') || row.notes.endsWith('.doc');
      this.isPdfFile = row.notes.endsWith('.pdf');
      if (this.isPdfFile) {
        this.pdfSrc = 'http://localhost/dev-api/'+row.notes;
        this.currentPage = 1;
        this.pdfLoading = true;
      }
      this.viewResumeDialogVisible = true;
    },
    onNumPages(numPages) {
      this.totalPages = numPages;
    },
    onPdfLoaded() {
      this.pdfLoading = false;
    },
    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
    },
    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.currentPage++;
      }
    }
  }
};
</script>

<style scoped>
/* 样式可以根据需要进行调整 */
</style>
