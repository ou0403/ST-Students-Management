<template>
  <div class="app-container">
    <el-container style="height: 100vh;">
      <el-container class="h-screen">
        <el-container>
          <!-- 侧边竖条操作栏 -->
          <el-aside width="350px">

            <!-- 排名卡片 -->
            <el-card class="box-card">
              <!--卡片标题-->
              <div slot="header">
                <span>优秀周记排名</span>
                <!--                <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-more"></el-button>--> <!--三点折叠-->
              </div>
              <!--  卡片功能表单 -->
              <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch"
                       label-width="68px">

                <!-- 搜索框 -->
                <el-form-item label="周记标题" prop="title">
                  <el-input v-model="queryParams.title" placeholder="请输入周记标题" clearable
                            @keyup.enter.native="handleQuery"></el-input>
                </el-form-item>
                <!--                 搜索栏功能按钮-->
                <el-form-item>
                  <el-button class="bg-primary text-white hover:bg-primary-dark" type="primary"
                             icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
                  <el-button class="border border-gray-300 hover:bg-gray-100" icon="el-icon-refresh"
                             size="mini" @click="resetQuery">重置</el-button>
                </el-form-item>
              </el-form>

              <!-- 搜索回显列表 -->
              <el-table v-loading="loading" :data="WeeklyDiaryList" @selection-change="handleSelectionChange">
                <el-table-column label="周记标题" align="center" prop="title"></el-table-column>
                <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                  <template slot-scope="scope">
                    <el-button size="mini" type="text" @click="handleALLDate(scope.row)"
                               v-hasPermi="['homework:homework:remove']">上交详情</el-button>
                  </template>
                </el-table-column>
              </el-table>
              <!-- 搜索分页页码 -->
              <el-pagination layout="prev, pager, next" :total="total"></el-pagination>
            </el-card><!-- 功能卡end -->





            <!-- 左侧列表卡片 -->
            <el-card class="box-card">
              <!--卡片标题-->
              <div slot="header">
                <span>历史周记</span>
<!--                <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-more"></el-button>-->
<!--                三点折叠-->
              </div>
              <!--  卡片功能表单 -->
              <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch"
                       label-width="68px">

                <!-- 搜索框 -->
                <el-form-item label="周记标题" prop="title">
                  <el-input v-model="queryParams.title" placeholder="请输入周记标题" clearable
                            @keyup.enter.native="handleQuery"></el-input>
                </el-form-item>
<!--                 搜索栏功能按钮-->
                <el-form-item>
                  <el-button class="bg-primary text-white hover:bg-primary-dark" type="primary"
                             icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
                  <el-button class="border border-gray-300 hover:bg-gray-100" icon="el-icon-refresh"
                             size="mini" @click="resetQuery">重置</el-button>
                </el-form-item>
              </el-form>

              <!-- 搜索回显列表 -->
              <el-table v-loading="loading" :data="WeeklyDiaryList" @selection-change="handleSelectionChange">
                <el-table-column label="周记标题" align="center" prop="title"></el-table-column>
                <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                  <template slot-scope="scope">
                    <el-button size="mini" type="text" @click="handleALLDate(scope.row)"
                               v-hasPermi="['homework:homework:remove']">上交详情</el-button>
                  </template>
                </el-table-column>
              </el-table>
              <!-- 搜索分页页码 -->
              <el-pagination layout="prev, pager, next" :total="total"></el-pagination>
            </el-card><!-- 功能卡end -->









          </el-aside><!--  侧栏end -->











































          <!-- 主内容区 -->
        </el-container>



















      </el-container>
    </el-container>
  </div>
</template>

<script>


//生成时会自动带着
import {
  listWeeklyDiary, getWeeklyDiary, delWeeklyDiary, addWeeklyDiary, updateWeeklyDiary
}from "@/api/WeeklyDiary/WeeklyDiary";


export default {
  name: "WeeklyDiary",
  data() {
    return {
      // 遮罩层   页面加载过程中的过渡页面动画
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
      // 周记任务发布表格数据
      WeeklyDiaryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数

      queryParams: {
        pageNum: 1,
        pageSize: 10,
        studentId: null,
        teacherId: null,
        departmentId: null,
        dept: null,
        title: null,
        text: null,
        countent: null,
        isnice: null,
        uploadTime: null,
        remarks1: null,
        remarks2: null,
        remarks3: null
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
    /** 查询周记任务发布列表 */
    getList() {
      this.loading = true;
      listWeeklyDiary(this.queryParams).then(response => {
        this.WeeklyDiaryList = response.rows;
        console.log(this.WeeklyDiaryList)
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
        weeklydiaryId: null,
        studentId: null,
        teacherId: null,
        departmentId: null,
        dept: null,
        title: null,
        text: null,
        countent: null,
        isnice: null,
        uploadTime: null,
        remarks1: null,
        remarks2: null,
        remarks3: null
      };
      this.resetForm("form");
    },



    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;  //重置初始页数
      this.getList();                //获取分页内容列表
    },


    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");   //重置表单
      this.handleQuery();            //再次重新搜索表单里的内容（这两个下来类似于刷新），就可以完成按钮的重置
    },




    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.weeklydiaryId)
      this.single = selection.length!==1
      this.multiple = !selection.length                      //
    },



    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加周记任务发布";
    },


    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const weeklydiaryId = row.weeklydiaryId || this.ids
      getWeeklyDiary(weeklydiaryId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改周记任务发布";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.weeklydiaryId != null) {
            updateWeeklyDiary(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addWeeklyDiary(this.form).then(response => {
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
      const weeklydiaryIds = row.weeklydiaryId || this.ids;
      this.$modal.confirm('是否确认删除周记任务发布编号为"' + weeklydiaryIds + '"的数据项？').then(function() {
        return delWeeklyDiary(weeklydiaryIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('WeeklyDiary/WeeklyDiary/export', {
        ...this.queryParams
      }, `WeeklyDiary_${new Date().getTime()}.xlsx`)
    }
  }
};
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
