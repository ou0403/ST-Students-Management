<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="教室名称" prop="roomName">
        <el-input
          v-model="queryParams.roomName"
          placeholder="请输入教室名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="教室描述" prop="roomDescribe">
        <el-input
          v-model="queryParams.roomDescribe"
          placeholder="请输入教室描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="教室长度" prop="roomHeight">
        <el-input
          v-model="queryParams.roomHeight"
          placeholder="请输入教室长度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="教室宽度" prop="roomWeight">
        <el-input
          v-model="queryParams.roomWeight"
          placeholder="请输入教室宽度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
      <el-form-item label="部门名称" prop="deptId">
        <el-input
          v-model="queryParams.deptId"
          placeholder="请输入部门名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="创建人id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入创建人id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预留_a" prop="roomReserveA">
        <el-input
          v-model="queryParams.roomReserveA"
          placeholder="请输入预留_a"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预留_b" prop="roomReserveB">
        <el-input
          v-model="queryParams.roomReserveB"
          placeholder="请输入预留_b"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
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
          v-hasPermi="['leave:room:add']"
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
          v-hasPermi="['leave:room:edit']"
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
          v-hasPermi="['leave:room:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['leave:room:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="roomList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="教室编号" align="center" prop="roomId" />
      <el-table-column label="教室名称" align="center" prop="roomName" />
      <el-table-column label="教室描述" align="center" prop="roomDescribe" />

      <el-table-column label="教室规格" align="center">
        <template slot-scope="scope">
          <span>{{scope.row.roomHeight}}✖{{scope.row.roomWeight}}  ️️</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="教室长度" align="center" prop="roomHeight" />-->
<!--      <el-table-column label="教室宽度" align="center" prop="roomWeight" />-->
      <el-table-column label="部门名称" align="center" prop="dept.deptName" />
      <el-table-column label="创建人" align="center" prop="user.nickName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">

          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['leave:room:edit']"
          >修改</el-button>

          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['leave:room:remove']"
          >删除</el-button>
          <el-dropdown size="mini" @command="(command) => seat(command, scope.row)">
            <el-button size="mini" type="text" icon="el-icon-d-arrow-right">教室</el-button>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="0" icon="el-icon-circle-check">分配教室</el-dropdown-item>
              <el-dropdown-item command="1" icon="el-icon-setting">查看教室</el-dropdown-item>
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

    <!-- 添加或修改教室管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="教室名称" prop="roomName">
          <el-input v-model="form.roomName" placeholder="请输入教室名称" />
        </el-form-item>
        <el-form-item label="教室描述" prop="roomDescribe">
          <el-input
            v-model="form.roomDescribe"
            placeholder="请输入教室描述"
            type="textarea"
            :autosize="{ minRows: 3, maxRows: 4}"
                    />
        </el-form-item>
<!--        <el-form-item label="教室数据" prop="room">
          <el-input v-model="form.room" type="textarea" placeholder="请输入内容" />
        </el-form-item>-->
        <el-row>
          <el-col :span="10">
            <el-form-item label="教室长宽" prop="roomHeight">
              <el-input-number v-model="form.roomHeight" placeholder="教室长度" style="width: 150px;"></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="10">
            <el-form-item label="" prop="roomWeight">
              <el-input-number v-model="form.roomWeight" placeholder="教室宽度" style="width: 150px;"></el-input-number>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="部门" prop="deptIdList" v-if=deptShow >
          <el-cascader v-model="form.deptIdList" :options="deptOptions" :props="selectProps" placeholder="请选择班级" clearable/>
        </el-form-item>

<!--        <el-form-item label="部门id" prop="deptId">
          <el-input v-model="form.deptId" placeholder="请输入部门id" />
        </el-form-item>
        <el-form-item label="创建人id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入创建人id" />
        </el-form-item>
        <el-form-item label="预留_a" prop="roomReserveA">
          <el-input v-model="form.roomReserveA" placeholder="请输入预留_a" />
        </el-form-item>
        <el-form-item label="预留_b" prop="roomReserveB">
          <el-input v-model="form.roomReserveB" placeholder="请输入预留_b" />
        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRoom, getRoom, delRoom, addRoom, updateRoom,deptTreeSelect } from "@/api/leave/room";

export default {
  name: "Room",
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
      // 教室管理表格数据
      roomList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      //是否展示部门树
      deptShow: true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        roomName: null,
        roomDescribe: null,
        room: null,
        roomHeight: null,
        roomWeight: null,
        deptId: null,
        userId: null,
        roomReserveA: null,
        roomReserveB: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        roomName: [
          { required: true, message: "教室名称不能为空", trigger: "blur" }
        ],
        roomDescribe: [
          { required: true, message: "教室描述不能为空", trigger: "blur" }
        ],
        roomHeight: [
          { required: true, message: "教室高度不能为空", trigger: "blur" }
        ],
        roomWeight: [
          { required: true, message: "教室宽度不能为空", trigger: "blur" }
          ],
        deptIdList:[
          { required: true, message: "请选择部门", trigger: "blur" }
        ]

      },
      deptOptions: undefined,
      selectProps: {
        "multiple": true,
        "value": "id"
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询教室管理列表 */
    getList() {
      this.loading = true;
      listRoom(this.queryParams).then(response => {
        console.log(response.rows);
        this.roomList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.reset();
    },
    // 表单重置
    reset() {
      this.deptShow = true;
      this.form = {
        roomId: null,
        roomName: null,
        roomDescribe: null,
        room: null,
        roomHeight: null,
        roomWeight: null,
        deptId: null,
        userId: null,
        roomReserveA: null,
        roomReserveB: null,
        deptIdList:null
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
      this.ids = selection.map(item => item.roomId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    async handleAdd() {
      this.reset();
      this.open = true;
      this.title = "创建教室";
      await this.getDeptTree()
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.deptShow = false;
      const roomId = row.roomId || this.ids
      getRoom(roomId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改教室";
        this.getDeptTree();
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.roomId != null) {
            updateRoom(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
              this.deptShow = true;
            });
          } else {
            console.log(this.form)
            addRoom(this.form).then(response => {
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
      const roomIds = row.roomId || this.ids;
      this.$modal.confirm('是否确认删除教室管理编号为"' + roomIds + '"的数据项？').then(function() {
        return delRoom(roomIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('leave/room/export', {
        ...this.queryParams
      }, `room_${new Date().getTime()}.xlsx`)
    },
    //获取部门信息
    getDeptTree() {
      deptTreeSelect().then(response => {
        console.log("1")
        console.log(response)
        this.deptOptions = response.data;
      });
    },

    //根据教室选项跳转相应页面
    seat(command,row){
      switch (command) {
        case "0":
          this.seatOpen(row)
          break;
        case "1":
          getRoom(row.roomId).then(e=>{
            console.log(e)
            if (e.data.room===null){
              this.roomChange()
            }else {
              this.$router.push({
                path:"/leave/seat",
                query:{
                  deptName: row.dept.deptName,
                  mId:row.roomId,
                  roomId:row.roomId
                }
              })
            }
          })
          break;
        default:
          break;
      }
    },
    //提示覆盖
    seatOpen(row) {
      this.$confirm('如果已经分配座位将会覆盖, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        getRoom(row.roomId).then(e=>{
          console.log(e)
          this.$router.push({
            path:"/leave/seat",
            query:{
              height:e.data.roomHeight,
              weight:e.data.roomWeight,
              deptId:e.data.deptId,
              meetingId:row.roomId,
              roomId:row.roomId
            }
          })
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    //提示未分配
    roomChange() {
      this.$notify({
        title: '警告',
        message: '教室未分配,请先分配教室',
        type: 'warning'
      });
    },
  }
};
</script>
