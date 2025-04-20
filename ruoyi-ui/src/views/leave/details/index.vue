<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="请假类型" prop="leaveType">
        <el-select v-model="queryParams.leaveType" placeholder="请选择请假类型" clearable>
          <el-option
            v-for="dict in dict.type.sys_leave_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审批状态" prop="approvalStatus">
        <el-select v-model="queryParams.approvalStatus" placeholder="请选择审批状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_leave_approval"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="时间类型" prop="timeType">
        <el-select v-model="queryParams.timeType" placeholder="请选择时间类型" clearable>
          <el-option
            v-for="dict in dict.type.sys_leave_time"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="初始时间" prop="firstTime">
        <el-date-picker clearable
          v-model="queryParams.firstTime"
          type="date"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择初始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结束时间" prop="lastTime">
        <el-date-picker clearable
          v-model="queryParams.lastTime"
          type="date"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择结束时间">
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
          v-hasPermi="['leave:details:add']"
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
          v-hasPermi="['leave:details:edit']"
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
          v-hasPermi="['leave:details:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['leave:details:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="detailsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="请假编码" align="center" prop="leaveId" />
      <el-table-column label="请假人" align="center" prop="user.nickName" />
      <el-table-column label="请假类型" align="center" prop="leaveType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_leave_type" :value="scope.row.leaveType"/>
        </template>
      </el-table-column>

      <el-table-column label="时间类型" align="center" prop="timeType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_leave_time" :value="scope.row.timeType"/>
        </template>
      </el-table-column>
      <el-table-column label="时间" align="center" width="360">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.firstTime, '{y}-{m}-{d} {h}:{i}:{s}') }} ---- {{ parseTime(scope.row.lastTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="请假原因" align="center" prop="leaveReason" />-->
      <el-table-column label="审批状态" align="center" prop="approvalStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_leave_approval" :value="scope.row.approvalStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="提交者" align="center" prop="leaveReserveA" />
<!--      <el-table-column label="部门" align="center" prop="leaveReserveB" />-->

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">

          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['leave:details:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['leave:details:remove']"
          >取消</el-button>
<!--          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="toExamine(scope.row)"
            v-hasPermi="['leave:details:remove']"
          >审批详情</el-button>-->

          <el-dropdown size="mini" @command="(command) => toExamine(command, scope.row)">
            <el-button size="mini" type="text" icon="el-icon-d-arrow-right">审核</el-button>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="0" icon="el-icon-circle-check">确定审核</el-dropdown-item>
              <el-dropdown-item command="1" icon="el-icon-setting">拒绝审核</el-dropdown-item>
              <el-dropdown-item command="2" icon="el-icon-more">审核进度</el-dropdown-item>
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

    <!-- 添加或修改请假管理对话框 -->
    <el-dialog title="审核进度" :visible.sync="openReview" width="700px" append-to-body>
      <div style="display: flex;">
        <div>
          <el-form ref="form" :model="forms"  label-width="80px" :disabled="true" style="width: 350px">
            <el-form-item label="请假用户">
              <span>{{forms.user.nickName}}</span>
            </el-form-item>
            <el-form-item label="请假类型" prop="leaveType">
              <el-select v-model="forms.leaveType" placeholder="请选择请假类型">
                <el-option
                  v-for="dict in dict.type.sys_leave_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="时间类型" prop="timeType">
              <el-select v-model="forms.timeType" placeholder="请选择时间类型">
                <el-option
                  v-for="dict in dict.type.sys_leave_time"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="开始时间" prop="totalTime">
                <span>{{ parseTime(forms.firstTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
            </el-form-item>
            <el-form-item label="结束时间" prop="totalTime">
              <span>{{ parseTime(forms.lastTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
            </el-form-item>

            <el-form-item label="请假原因"  prop="leaveReason">
              <span>
                {{forms.leaveReason}}
              </span>
            </el-form-item>
            <el-form-item label="提交时间" prop="totalTime">
              <span>{{ parseTime(forms.creatTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
            </el-form-item>
            <el-form-item label="附件展示" prop="leaveForm">
              <span v-if="forms.leaveForm===null">
                无
              </span>
              <FileUploads v-model="forms.leaveForm"></FileUploads>

            </el-form-item>
          </el-form>
        </div>
        <div class="block">
          <el-timeline>
            <el-timeline-item
              v-for="(item, index) in timelineItems"
              :key="index"
              placement="top"
            >
              <div :style="{ color: item.approvalColor }">
                {{item.approvalStatus}}
              </div>
              <el-card>
                <h4>审核人:{{ item.userName }}</h4>
                <p v-if="item.approvalTime!==null">审核时间: {{ item.approvalTime }}</p>
              </el-card>
            </el-timeline-item>
          </el-timeline>
        </div>
      </div>
    </el-dialog>

    <el-dialog :title="title" :visible.sync="open" width="520px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="请假用户" v-if="userList"  v-hasPermi="['leave:details:user']">
          <el-autocomplete
            v-model="form.userName"
            :fetch-suggestions="querySearchAsync"
            placeholder="不选择默认当前登录人"
            @select="handleSelect"
          ></el-autocomplete>
        </el-form-item>
        <el-form-item label="请假类型" prop="leaveType">
          <el-select v-model="form.leaveType" placeholder="请选择请假类型">
            <el-option
              v-for="dict in dict.type.sys_leave_type"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="时间类型" prop="timeType">
          <el-select v-model="form.timeType" placeholder="请选择时间类型" @change="changeTimeType">
            <el-option
              v-for="dict in dict.type.sys_leave_time"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"

            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="请假时间" prop="totalTime">
          <el-date-picker clearable
                          v-model="form.totalTime"
                          type="datetimerange"
                          range-separator="至"
                          start-placeholder="开始日期"
                          end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item>

        <el-form-item label="请假原因"  prop="leaveReason">
          <el-input
            type="textarea"
            :autosize="{ minRows: 3, maxRows: 4}"
            placeholder="请输入内容"
            v-model="form.leaveReason">
          </el-input>
        </el-form-item>
        <el-form-item label="附件上传" prop="leaveForm">
          <file-upload v-model="form.leaveForm"/>
        </el-form-item>
        <el-form-item label="学院老师" v-if="collegeTeacher" prop="selectUser" >
          <el-autocomplete
            v-model="form.teacherName"
            :fetch-suggestions="querySearchAsync1"
            placeholder="请输入内容"
            @select="handleSelectTeacher"
          ></el-autocomplete>
        </el-form-item>
        <el-form-item label="学院经理" v-if="collegeManager" >
          <el-autocomplete
            prop="selectUser"
            v-model="form.managerName"
            :fetch-suggestions="querySearchAsync2"
            placeholder="请输入内容"
            @select="handleSelectMangager"
          ></el-autocomplete>
        </el-form-item>
        <el-form-item label="院长" v-if="collegeDean" >
          <el-autocomplete
            prop="selectUser"
            v-model="form.deanName"
            :fetch-suggestions="querySearchAsync3"
            placeholder="请输入内容"
            @select="handleSelectDean"
          ></el-autocomplete>
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
import {
  addDetails,
  delDetails,
  getDetails,
  listDetails,
  updateDetails,
  listUser,
  listUserTeacher, updateDetailsToExamine, updateDetailsRefuse
} from '@/api/leave/details'
// import FileUploads from "@/components/FileUpload/indexView";
import FileUploads from "@/components/FileUpload/indexView.vue";
import {listApproval} from "@/api/leave/approval";

export default {
  name: "Details",
  components: {FileUploads},
  dicts: ['sys_leave_time', 'sys_leave_approval', 'sys_leave_type'],
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
      // 请假管理表格数据
      detailsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openReview:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        leaveType: null,
        approvalStatus: null,
        timeType: null,
        firstTime: null,
        lastTime: null,
        leaveReason: null,
        leaveForm: null,
        userId: null,

      },
      // 表单参数
      form: {

      },
      forms:{
        user:{
          nickName:null
        }
      },
      // 表单校验
      rules: {
        leaveType: [
          { required: true, message: "请假类型不能为空", trigger: "blur" }
        ],
        timeType: [
          { required: true, message: "时间类型不能为空", trigger: "blur" }
        ],
        totalTime: [
          { required: true, message: "请假时间不能为空", trigger: "blur" }
        ],
        leaveReason:[
          { required: true, message: "请假原因不能为空", trigger: "blur"}
        ],

      },
      restaurants: [],
      restaurantss: [],
      state: '',
      timeout:  null,
      userList: false,
      collegeTeacher: false,
      collegeManager: false,
      collegeDean: false,

      timelineItems: [

      ],
      sys_leave_type:null


    };
  },
  created() {
    this.getList();
    this.sys_leave_type = dict.type.sys_leave_type
  },
  mounted() {

  },
  methods: {
    /** 查询请假管理列表 */
    getList() {
      this.loading = true;
      listDetails(this.queryParams).then(response => {
        this.detailsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.userList =false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.collegeDean = false;
      this.collegeManager = false;
      this.collegeTeacher = false;
      this.form = {};
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
      this.ids = selection.map(item => item.leaveId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.loadAll();
      this.open = true;
      this.userList =true;
      this.title = "提交请假";
    },
    /** 修改按钮操作 */
    handleUpdate(row,i) {
      this.reset();
      this.userList = false;
      const leaveId = row.leaveId || this.ids
      getDetails(leaveId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改请假";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.leaveId != null) {
            updateDetails(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            console.log(this.form)
            addDetails(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.userList=false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const leaveIds = row.leaveId || this.ids;
      this.$modal.confirm('是否确认删除请假管理编号为"' + leaveIds + '"的数据项？').then(function() {
        return delDetails(leaveIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },

    /** 导出按钮操作 */
    handleExport() {
      this.download('leave/details/export', {
        ...this.queryParams
      }, `details_${new Date().getTime()}.xlsx`)
    },
/*    toExamine(row,i){

    },*/

    // 审核
    toExamine(command,row){
      this.form.leaveId = row.leaveId
      switch (command){
        case "0":
          // console.log(row)
          if (row.approvalStatus ===1){
            this.$notify({
              title: '警告',
              message: '已通过,无需再次通过',
              type: 'warning'
            });
          }else {
            // this.form.approvalStatus =1;
            this.form.timeType=row.timeType;
            updateDetailsToExamine(this.form).then(
              response => {
                this.$modal.msgSuccess("审核通过");
                this.getList();
              }
            )
          }
          break;
        case "1":

            // this.form.approvalStatus =0;
            this.form.timeType=row.timeType;
            updateDetailsRefuse(this.form).then(
              response => {
                this.$modal.msgSuccess("审核已拒绝");
                this.getList();
              }
            )
          break;
        case "2":
          this.reset();
          const leaveId = row.leaveId || this.ids
          getDetails(leaveId).then(response => {
            this.forms = response.data;
            this.openReview = true;
          });
          this.timelineItems.leaveId = leaveId;
          listApproval(leaveId).then(response => {
            console.log(response.rows)
            this.timelineItems = response.rows;
            console.log(this.timelineItems)
          })
          break;
      }

    },


    querySearchAsync(queryString, cb) {
      var restaurants = this.restaurants;
      var results = queryString ? restaurants.filter(this.createStateFilter(queryString)) : restaurants;
      console.log("results"+results)
      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => {
        cb(results);
      }, 1000 * Math.random());
    },
    querySearchAsync1(queryString, cb) {
      var restaurants = this.restaurantss;
      var results = queryString ? restaurants.filter(this.createStateFilter(queryString)) : restaurants;
      console.log("results"+results)
      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => {
        cb(results);
      }, 1000 * Math.random());
    },
    querySearchAsync2(queryString, cb) {
      var restaurants = this.restaurantss;
      var results = queryString ? restaurants.filter(this.createStateFilter(queryString)) : restaurants;
      console.log("results"+results)
      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => {
        cb(results);
      }, 1000 * Math.random());
    },
    querySearchAsync3(queryString, cb) {
      var restaurants = this.restaurantss;
      var results = queryString ? restaurants.filter(this.createStateFilter(queryString)) : restaurants;
      console.log("results"+results)
      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => {
        cb(results);
      }, 1000 * Math.random());
    },
    createStateFilter(queryString) {
      return (state) => {
        return (state.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
      };
    },
    handleSelect(item) {
      // console.log("测试"+item.address);
      this.form.userId = item.address;
    },

    handleSelectTeacher(item) {
      // console.log("测试"+item.address);
      this.form.teacher = item.address;
    },
    handleSelectMangager(item) {
      // console.log("测试"+item.address);
      this.form.manager = item.address;
    },
    handleSelectDean(item) {
      // console.log("测试"+item.address);
      this.form.dean = item.address;
    },
    loadAll(){
      listUser().then(response => {
        console.log(response)
        this.restaurants = response.data;
      })
      listUserTeacher().then(
        response => {
          console.log(response)
          this.restaurantss = response.data;
        }
      )
    },
    changeTimeType(){
      // console.log("---------"+this.form.timeType)
      if (this.form.timeType === 1){
        this.collegeTeacher = true;
        this.collegeManager = false;
        this.collegeDean = false;
      }else if (this.form.timeType === 2){
        this.collegeTeacher = true;
        this.collegeManager = true;
        this.collegeDean = false;
      }else if (this.form.timeType === 3) {
        this.collegeTeacher = true;
        this.collegeManager = true;
        this.collegeDean = true;
      }
    }
  }
};
</script>

<style lang="scss">
.el-timeline-item__timestamp{
  display: none;
}

</style>


