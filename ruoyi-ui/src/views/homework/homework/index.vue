<template>
  <div class="app-container">
    <el-container style="height: 100vh;">
      <el-container class="h-screen">
        <el-container>
          <!-- 侧边栏 -->
          <el-aside width="350px">
            <!-- 主要内容卡片 -->
            <el-card class="box-card">
              <div slot="header">
                <span>作业列表</span>
                <el-dropdown style="float: right; padding: 3px 0">
                <el-button  type="text" icon="el-icon-more"></el-button>
                  <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item>
                      <el-button
                        size="mini"
                        @click="handleAdd"
                        v-hasPermi="['homework:homework:add']"
                      >新增作业</el-button>
                    </el-dropdown-item>
                  </el-dropdown-menu>
                </el-dropdown>
              </div>
              <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch"
                       label-width="68px">
                <el-form-item label="作业标题" prop="title">
                  <el-input v-model="queryParams.title" placeholder="请输入作业标题" clearable
                            @keyup.enter.native="handleQuery"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button class="bg-primary text-white hover:bg-primary-dark" type="primary"
                             icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
                  <el-button class="border border-gray-300 hover:bg-gray-100" icon="el-icon-refresh"
                             size="mini" @click="resetQuery">重置</el-button>
                </el-form-item>
              </el-form>
              <el-table v-loading="loading" :data="homeworkList"
                        @selection-change="handleSelectionChange">
                <el-table-column label="作业标题" align="center" prop="title"></el-table-column>
                <el-table-column label="作业内容" align="center" prop="content">
                  <template slot-scope="scope">
                    <!-- 仅显示汉字部分，可以通过正则去除非汉字字符 -->
                    <span>{{ filterChinese(scope.row.content) }}</span>
                  </template>
                </el-table-column>
                <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                  <template slot-scope="scope">
                    <el-button size="mini" type="text" @click="handleALLDate(scope.row)"
                               v-hasPermi="['homework:homework:remove']">上交详情</el-button>
                    <el-button size="mini" type="text" @click="handleUpdate(scope.row)"
                               v-hasPermi="['homework:homework:remove']">修改</el-button>
                  </template>
                </el-table-column>
              </el-table>

              <el-pagination
                layout="prev, pager, next"
                :total="total">
              </el-pagination>
            </el-card>
          </el-aside>

          <!-- 主内容区 -->
          <el-main>
            <div class="dashboard-header">
              <h1 class="dashboard-title">作业控制面板</h1>
              <el-button-group>
                <el-button class="bg-primary text-white hover:bg-primary-dark" type="primary"
                           icon="el-icon-refresh" @click="resetQueryET">刷新</el-button>
                <el-button class="bg-primary text-white hover:bg-primary-dark" type="primary"
                           icon="el-icon-download" @click="handleExportTer">导出</el-button>
              </el-button-group>
            </div>

            <!-- 统计卡片 -->
            <el-row :gutter="20">
              <el-col :span="6">
                <div class="stat-card card-blue">
                  <i class="fas fa-user"></i>
                  <div class="info">
                    <h3>{{ StuNum }}</h3>
                    <p>全班人数</p>
                  </div>
                </div>
              </el-col>
              <el-col :span="6">
                <div class="stat-card card-green">
                  <i class="fas fa-shopping-cart"></i>
                  <div class="info">
                    <h3>{{ YesStuNum }}</h3>
                    <p>已交人数</p>
                  </div>
                </div>
              </el-col>
              <el-col :span="6">
                <div class="stat-card card-purple">
                  <i class="fas fa-yen-sign"></i>
                  <div class="info">
                    <h3>{{ NOStuNum }}</h3>
                    <p>未交人数</p>
                  </div>
                </div>
              </el-col>
            </el-row>
            <el-row :gutter="20">
              <el-col :span="15">
              <!-- 统计人数的条形图 -->
              <div id="chart" style="width: 100%; height: 400px; "  v-if="chartVisible"></div>
              </el-col>
              <el-col :span="3.8">
                  <el-table
                    v-if="chartVisible"
                    :data="tableData"
                    empty-text="无"
                    style="width: 100%">
                    <el-table-column
                      prop="7"
                      label="未交作业名单"
                      width="180">
                    </el-table-column>
                  </el-table>
              </el-col>
            </el-row>

            <!-- 上交详情卡片 -->
            <el-card v-show="opens" class="box-card">
              <div slot="header" class="clearfix">
                <span>作业上交详情</span>
                <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-more"></el-button>
              </div>
              <el-table v-loading="loading" :data="stuhomList"
                        @selection-change="handleSelectionChange">
                <el-table-column type="selection" width="55" align="center"></el-table-column>
                <el-table-column label="学生姓名" align="center" prop="nickName"></el-table-column>
                <el-table-column label="提交内容" align="center" prop="submission">
                  <template slot-scope="scope">
                    <span> {{ scope.row.submission ? scope.row.submission.split('/').pop() : '无文件' }}</span>
                  </template>
                </el-table-column>
                <el-table-column label="提交时间" align="center" prop="submissionTime" width="180">
                  <template slot-scope="scope">
                    <span>{{ parseTime(scope.row.submissionTime, '{y}-{m}-{d}') }}</span>
                  </template>
                </el-table-column>
                <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                  <template slot-scope="scope">
<!--                    <el-button size="mini" type="text" icon="el-icon-edit"-->
<!--                               @click="handleUpdate(scope.row)"-->
<!--                               v-hasPermi="['stuhom:stuhom:edit']">修改</el-button>-->
                    <el-button
                      size="mini"
                      type="text"
                      icon="el-icon-folder"
                      @click="handleViewResume(scope.row)"
                      v-hasPermi="['Resume:Resume:remove']"
                    >查看作业</el-button>
                    <el-button size="mini" type="text" @click="handleDelete(scope.row)"
                               v-hasPermi="['stuhom:stuhom:remove']">删除</el-button>
                    <el-button type="text" plain icon="el-icon-download" size="mini"
                               @click="handleExportTers(scope.row)"
                               v-hasPermi="['homework:homework:export']">导出</el-button>
                  </template>
                </el-table-column>
              </el-table>

              <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum"
                          :limit.sync="queryParams.pageSize" @pagination="getList"
                          class="max-w-xs mx-auto mt-5 flex justify-center p-0 text-sm">
              </pagination>

            </el-card>

            <!-- 添加或修改发布作业对话框 -->
            <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
              <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                <el-form-item label="作业标题" prop="title">
                  <el-input v-model="form.title" placeholder="请输入作业标题"></el-input>
                </el-form-item>
                <el-form-item label="作业内容" prop="content">
                  <file-upload v-model="form.content"></file-upload>
                </el-form-item>

                <el-form-item label="截止日期" prop="dueDate">
                  <el-date-picker clearable v-model="form.dueDate" type="date"
                                  value-format="yyyy-MM-dd" placeholder="请选择截止日期">
                  </el-date-picker>
                </el-form-item>
              </el-form>
              <div slot="footer" class="dialog-footer">
                <el-button class="bg-primary text-white hover:bg-primary-dark" type="primary"
                           @click="submitForm">确 定</el-button>
                <el-button class="border border-gray-300 hover:bg-gray-100" @click="cancel">取 消</el-button>
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
          </el-main>
        </el-container>
      </el-container>
    </el-container>
  </div>
</template>

<script>
const wordUrl = '/path/to/word.docx';
import { listHomework, getHomework, delHomework, addHomework, updateHomework } from "@/api/homework/homework";
import { listStuhom,listStuhomTer,ListStuNum} from '@/api/stuhom/stuhom'
import { getDept, getDeptStu, getDeptTer, listDept } from '@/api/system/dept'
import { listUser,listUserOnStu } from '@/api/system/user'
import echarts from 'echarts'
import mammoth from 'mammoth'; // 用于将docx转换为HTML
import axios from 'axios';
import pdf from 'vue-pdf';
import word from '@vue-office/docx'
export default {
  name: "Homework",
  components: {
    'vue-pdf': pdf,
    'vue-word':word,
  },
  data() {
    return {
      //vue-office预览
      pdfSrc: null,
      currentPage: 1,
      totalPages: 0,
      pdfLoading: true,
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
      },
      //未交作业名单
      tableData: [],
      //html预览
      showPreview: false,
      loadings: false,
      error: false,
      errorMessage: '',
      previewHtml: '',
      //优秀作业
      ExcellentStuNum: "",
      //全部学生数量
      StuNum: "",
      //已交数量
      YesStuNum: "",
      //未交数量
      NOStuNum: "",
      // 日期范围
      dateRange: [],
      //作业情况
      stuhomList: [],
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
      // 发布作业表格数据
      homeworkList: [],
      //全班学生
      homeworkListStu: [],
      // 老师dept id 数据
      deptTer: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      opens: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        content: null,
        dueDate: null,
        teacherId: null,
        remark1: null,
        remark2: null,
      },
      queryParamsTer: {
        nickName: null,
        pageNum: 1,
        pageSize: 10,
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
      },
      queryParamStu: {
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
        timeLimit: null,
        deptId: null,
      },
      queryParamsDept: {
        deptName: undefined,
        status: undefined
      },
      chartVisible: false,
      myChart: null,
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        title: [
          { required: true, message: "作业标题不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getListStuNum();
    this.getList();

  },
  mounted() {
    this.updateChart();
    this.previewContainer = this.$refs.previewContainer;
    console.log('previewContainer:', this.previewContainer); // 添加调试信息
  },

  methods: {
    //html显示预览
    // async handlePreview(a) {
    //   const filePath = 'http://localhost/'+'dev-api'+a
    //   if (!filePath) {
    //     this.errorMessage = '文件路径为空';
    //     this.error = true;
    //     return;
    //   }
    //
    //   try {
    //     this.loading = true;
    //     this.error = false;
    //     this.previewHtml = '';
    //
    //     // 检查文件类型
    //     const isDocx = filePath.endsWith('.docx');
    //     if (!isDocx) {
    //       this.errorMessage = '仅支持.docx格式文件预览';
    //       this.error = true;
    //       return;
    //     }
    //
    //     // 下载文件内容
    //     const response = await axios.get(filePath, { responseType: 'arraybuffer' });
    //     const blob = new Blob([response.data], { type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' });
    //
    //     // 使用mammoth转换为HTML
    //     const result = await mammoth.convertToHtml({ arrayBuffer: response.data });
    //     this.previewHtml = result.value; // 转换后的HTML内容
    //     this.showPreview = true;
    //
    //   } catch (error) {
    //     console.error('文件转换失败', error);
    //     this.errorMessage = '文件预览失败，请检查路径或文件格式';
    //     this.error = true;
    //   } finally {
    //     this.loadings = false;
    //   }
    // },
    handleClose() {
      if (this.previewContainer) {
        // 关闭时清除预览内容
        this.previewContainer.innerHTML = '';
      }
      this.error = false;
      this.loadings = false;
      this.showPreview = false; // 确保对话框关闭
      this.resetQuery();
    },
    //查看当前老师所在的班级计算所交人数与全班人数的差距
    getListOnStu() {
      this.loading = true;
      return listUserOnStu(this.queryParams).then(response => {
        this.homeworkListStu = response.rows;
        console.log(this.homeworkListStu.length);
        console.log(this.homeworkListStu.length + "总人数");
        console.log(this.stuhomList.length + "交作业人数");
        // 相差人数
        this.NOStuNum = (this.homeworkListStu.length - 1) - this.stuhomList.length;
        // 已交作业人数
        this.YesStuNum = this.stuhomList.length;
        // 全部人数
        this.StuNum = this.homeworkListStu.length - 1;
        console.log(this.StuNum + "相差人数");
        this.total = response.total;
        // 提取 stuhomList 中的 nickName
        const stuhomNickNames =this.stuhomList.map(item => item.nickName);
        // 提取 homeworkListStu 中的 nickName
        const homeworkNickNames = this.homeworkListStu.map(item => item.nickName);
        // 找出在 homeworkListStu 中存在但在 stuhomList 中不存在的 nickName
        const missingInStuhom = homeworkNickNames.filter(nickName => !stuhomNickNames.includes(nickName));
        this.tableData = missingInStuhom.map(nickName => ({ '7': nickName }));
        console.log('缺少的 nickName:', this.tableData);
        this.loading = false;
      });
    },
    filterChinese(text) {
      // 正则匹配汉字
      return text.replace(/[^\u4e00-\u9fa5]/g, '');
    },
    // 重新初始化 ECharts 实例
    reInitChart() {
      const chartDom = document.getElementById('chart');
      if (chartDom) {
        this.myChart = echarts.init(chartDom);
      }
    },
    //上交详情
    handleALLDate(row) {
      this.loading = true;
      getDeptStu().then(response => {
        console.log("111");
        this.form = response.data;
        this.queryParamsTer.department = this.form[0].deptId;
        console.log("this.chartVisible===" + this.chartVisible);
        this.loading = true;
        listStuhomTer(this.queryParamsTer).then(response => {
          this.opens = true;
          this.stuhomList = response.rows;
          this.total = response.total;
          this.loading = false;
          this.chartVisible = true; // 显示图表
          this.getListOnStu().then(() => {
            this.$nextTick(() => {
              // 确保 DOM 更新后重新初始化图表
              this.reInitChart();
              this.updateChart(); // 更新图表数据
            });

          });
        });
      });
    },
    hideChart() {
      this.chartVisible = false; // 隐藏图表
    },

    getListStuNum() {
      this.loading = true;
      getDeptStu().then(response => {
        console.log("111")
        this.form = response.data;
        console.log(this.form)
        this.queryParamStu.deptId = this.form[0].deptId
        listUser(this.queryParamStu, this.dateRange).then(response => {
            this.userList = response.rows;
            console.log(this.userList.length)
            this.total = response.total;
            this.loading = false;
          }
        )
      });
    },
    /** 查询发布作业列表 */
    getList() {
      this.loading = true;
      listHomework(this.queryParams).then(response => {
        this.homeworkList = response.rows;
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
        title: null,
        content: null,
        dueDate: null,
        teacherId: null,
        createTime: null,
        updateTime: null,
        remark: null,
        remark1: null,
        remark2: null
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
    resetQueryET() {
      this.hideChart();
      this.opens = false;
      this.StuNum = ""
      this.YesStuNum = ""
      this.NOStuNum = ""
      this.ExcellentStuNum = ""
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加发布作业";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getHomework(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改发布作业";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateHomework(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addHomework(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除发布作业编号为"' + ids + '"的数据项？').then(function() {
        return delHomework(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport(row) {
      this.download('homework/homework/export', {
        ...this.queryParams.title = row.title
      }, `homework_${new Date().getTime()}.xlsx`)
    },

    handleExportTer() {
      this.download('stuhom/stuhom/export', {
        ...this.queryParamsTer
      }, `stuhom_${new Date().getTime()}.zip`)
    },

    handleExportTers(row) {
      console.log(row)
      this.download('stuhom/stuhom/export', {
        ...this.queryParamsTer.nickName = row.nickName
      }, `stuhom_${new Date().getTime()}.zip`)
    },
    updateChart() {
      const chartDom = document.getElementById('chart');
      if (!chartDom) {
        console.error('未找到图表 DOM 元素');
        return;
      }
      const xData = ['全部人数', '已交人数', '未交人数'];
      const data = [this.StuNum, this.YesStuNum, this.NOStuNum, this.ExcellentStuNum];
      if (data.some(item => isNaN(Number(item)))) {
        console.error('图表数据包含无效值', data);
        return;
      }
      if (!this.myChart) {
        this.myChart = echarts.init(chartDom);
      }
      const option = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        xAxis: {
          type: 'category',
          data: xData
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            data: data.map(Number),
            type: 'bar'
          }
        ]
      };
      console.log(this.myChart);
      this.myChart.setOption(option);
      this.myChart.resize();
    },

    handleViewResume(row) {
      console.log("123")
      this.viewResumeTitle = `查看 ${row.nickName} 的简历`;
      this.viewResumeUrl =  row.submission;
      this.isWordFile = row.submission.endsWith('.docx') || row.submission.endsWith('.doc');
      this.isPdfFile = row.submission.endsWith('.pdf');
      if (this.isPdfFile) {
        this.pdfSrc = 'http://localhost/dev-api'+row.submission;
        this.currentPage = 1;
        this.pdfLoading = true;
      }else {
        this.viewResumeUrl = 'http://localhost/dev-api'+row.submission;
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
}
</script>
<style>



/* 自定义样式 */
:root {
  --primary-color: #409EFF;
  --secondary-color: #67C23A;
  --dark-color: #303133;
  --light-color: #f5f7fa;
  --border-radius: 6px;
}

body {
  margin: 0;
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", Arial, sans-serif;
  background-color: #f0f2f5;
}

.el-header {
  padding: 0;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  z-index: 10;
}

.el-aside {
  background: white;
  box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
  transition: all 0.3s;
}

.el-main {
  padding: 20px;
  background-color: var(--light-color);
}

.box-card {
  border-radius: var(--border-radius);
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.08);
  border: none;
  margin-bottom: 20px;
}

.box-card .el-card__header {
  border-bottom: 1px solid #ebeef5;
  font-size: 16px;
  font-weight: 500;
  color: var(--dark-color);
}

.dashboard-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.dashboard-title {
  font-size: 24px;
  font-weight: 600;
  color: var(--dark-color);
}

.stat-card {
  border-radius: var(--border-radius);
  padding: 20px;
  margin-bottom: 20px;
  color: white;
  display: flex;
  align-items: center;
}

.stat-card i {
  font-size: 36px;
  margin-right: 15px;
}

.stat-card .info h3 {
  margin: 0;
  font-size: 24px;
}

.stat-card .info p {
  margin: 5px 0 0;
  opacity: 0.9;
}

.card-blue {
  background: linear-gradient(135deg, #409EFF, #66b1ff);
}

.card-green {
  background: linear-gradient(135deg, #67C23A, #85ce61);
}

.card-purple {
  background: linear-gradient(135deg, #9c27b0, #b668d9);
}

.card-orange {
  background: linear-gradient(135deg, #E6A23C, #ebb563);
}

.el-table {
  border-radius: var(--border-radius);
  overflow: hidden;
}

.el-table th {
  background-color: #f5f7fa !important;
}

.el-menu {
  border-right: none;
}

.top-menu {
  padding-left: 20px;
}

.user-info {
  display: flex;
  align-items: center;
  padding-right: 20px;
}

.user-avatar {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  margin-right: 10px;
}

.el-col {
  padding: 0 10px;
}
</style>
