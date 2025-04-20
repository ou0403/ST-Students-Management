<template>
  <div class="seatBox">
  			<div class="seat_main">
  				<div class="mtit">
            讲台 {{deptName}}
<!--            <p style="font-size: 10px; position:absolute;right: 250px ;top: 25px">显示图片</p>-->
<!--            <el-button style="position: absolute;right: 14px" @click="exportUser">导出数据</el-button>-->
            <el-button style="position: absolute;right: 120px" @click="rollCall" v-if="this.queryParams.meetingId==null">点名</el-button>
            <el-button style="position: absolute;right: 50px" @click="refresh"  v-hasPermi="['leave:room:query']" v-if="this.queryParams.meetingId==null">刷新</el-button>
            <el-switch
              v-model="photoShow"
              active-color="#00C4FF"
              inactive-color="#DBDFEA"
              style="position: absolute;right: 200px;top: 30px"
              v-if="this.queryParams.meetingId==null"
            />
          </div>
  				<div class="mcon" >
  					<table class="mtable" ref="seatImg">
              <tr v-for="(items,rowIndex) in arr2" >
                <td class="index">{{rowIndex+1}}排</td>
                    <td v-for="(item ,colIndex) in items"  :class="item.id!=0?'has':''"  >
                      <el-popover
                        placement="top-start"
                        :title="'姓名:'+item.username+' '+'工号:'+item.name+' '+'部门:'+deptName+':'+item.dept"
                        v-if="queryParams.meetingId==null"
                      >
<!--                        <el-button style="position: absolute; top:3px;right: 12px" @click="addScore(item.id)">新增分数</el-button>-->

                        <el-table :data="detailsList"  v-loading="loading">
                          <el-table-column type="selection" width="55" align="center" />
                          <el-table-column label="请假编码" align="center" prop="leaveId" />
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
                          <el-table-column label="请假时间" align="center" width="360">
                            <template slot-scope="scope">
                              <span>{{ parseTime(scope.row.firstTime, '{y}-{m}-{d} {h}:{i}:{s}') }} ---- {{ parseTime(scope.row.lastTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
                            </template>
                          </el-table-column>
                          <!--      <el-table-column label="请假原因" align="center" prop="leaveReason" />-->

                          <el-table-column label="请假表照片" align="center" prop="leaveForm" width="100">
                            <template slot-scope="scope">
                              <image-preview :src="scope.row.leaveForm" :width="50" :height="50"/>
                            </template>
                          </el-table-column>
                          <el-table-column label="审批状态" align="center" prop="approvalStatus">
                            <template slot-scope="scope">
                              <dict-tag :options="dict.type.sys_leave_approval" :value="scope.row.approvalStatus"/>
                            </template>
                          </el-table-column>
                          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                            <template slot-scope="scope">
                              <el-dropdown size="mini" @command="(command) => toExamine(command, scope.row)"  v-hasPermi="['leave:room:edit']">
                                <el-button size="mini" type="text" icon="el-icon-d-arrow-right">审核</el-button>
                                <el-dropdown-menu slot="dropdown">
                                  <el-dropdown-item command="0" icon="el-icon-circle-check">确定审核</el-dropdown-item>
                                  <el-dropdown-item command="1" icon="el-icon-setting">取消审核</el-dropdown-item>
                                </el-dropdown-menu>
                              </el-dropdown>
                            </template>
                          </el-table-column>
                        </el-table>

                        <pagination
                          v-show="total>0"
                          :total="total"
                          :page.sync="leaveQueryParams.pageNum"
                          :limit.sync="leaveQueryParams.pageSize"
                          @pagination="getList"
                        />
<!--                       双击事件 @dblclick="addScore(item.id)"-->
                        <div class="bbb" @mouseover="showImage(item.id)" @mouseleave="hideImage" slot="reference"  :style="item.color" @click="getList(item.id)"  v-if="item.id!==0">{{item.username}}</div>
                          <el-button slot="reference"  :style="item.color" v-else></el-button>
                      </el-popover>

                      <p @drop="drop($event, rowIndex,colIndex)" @dragover.prevent v-if="queryParams.meetingId!=null" style="margin: 0; padding: 0;">
                        <span draggable="true"  @dragstart="dragstart2($event, item,rowIndex,colIndex)"  @dragend="dragend2($event, item,rowIndex,colIndex)" style="display: flex; align-items: center; justify-content: center; width: 100%; height: 100%;">
                          {{ item.name}}
                        </span>
                      </p>
<!--                        <div class="ttt" v-if="hoverIndex === colIndex">-->
<!--                          <img :src="item.imageUrl" alt="Hovered Image">-->
<!--                        </div>-->
                      <div class="ttt" v-if="hoverIndex===item.id && photoShow===true">
<!--                        <img :src="item.image!=null&&item.image!==''?'http://10.0.25.175:8080'+item.image:'http://10.0.25.175:8080/profile/avatar/chushi.png'" @error="errImage"/>-->
                        <img :src="images" alt="">
                      </div>
                    </td>
<!--                </td>-->
              </tr>
            </table>
  				</div>
  			</div>
  			<div class="seat_right" v-if="this.queryParams.meetingId!==null">
<!--          <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
              <el-input
                v-model="queryParams.otherName"
                placeholder="请输人员姓名"
                clearable
                @keyup.enter.native="handleQuery"
              />
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="small" @click="handleQuery">搜索人员</el-button>
              <el-button icon="el-icon-refresh" size="small" @click="resetQuery">重 置</el-button>
            </el-form-item>
          </el-form>-->
  				<div class="rtit">部门人员</div>
  				<ul class="rlist" >
            <li  v-for="item in arr1" :key="item.userId">
            <span draggable="true"  @dragstart="dragstart($event, item)"  @dragend="dragend">
              <li>{{ item.nickName}}</li>
            </span>
            </li>
  				</ul>
          <el-form>
            <el-form-item>
              <el-button type="primary" @click="onSubmit" v-hasPermi="['meeting:using:add']">保存数据</el-button>
              <el-button  @click="cancel">取消</el-button>
            </el-form-item>
          </el-form>


  			</div>
<!--    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
        <el-form-item label="详情" prop="scoreDetails">
          <el-input v-model="formData.scoreDetails" placeholder="请输入加减分详情" clearable :style="{width: '100%'}">
          </el-input>
        </el-form-item>
        <el-form-item label="加分" prop="score">
          <el-input-number v-model="formData.score" placeholder="加分"></el-input-number>
        </el-form-item>
      </el-form>
      <div slot="footer">
&lt;!&ndash;        <el-button @click="cancelAdd()">取消</el-button>&ndash;&gt;
&lt;!&ndash;        <el-button type="primary" @click="scoreAdd">确定</el-button>&ndash;&gt;
      </div>
    </el-dialog>-->

    <el-dialog :title="title" :visible.sync="openUser" width="250px" center>
<!--      <img :src="imageUser!=null&&imageUser!==''?'http://localhost:8080'+imageUser:'http://localhost:8080/profile/avatar/chushi.png'" @error="errImage" width="200px" v-if="photoShow"/>-->
<!--      <img :src="''" @error="" width="200px"/>-->
<!--      <image-preview :src="images" :width="200"/>-->
      <img :src="images" alt="" :width="200">
       <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="seeRooms">确定</el-button>
       </span>
    </el-dialog>
  		</div>
</template>


<script>


import { getRoom, getUserList, updateRoom } from '@/api/leave/room'
import dict from '@/utils/dict'
import { listDetails, updateDetails } from '@/api/leave/details'


export default {
  dicts: ['sys_leave_time', 'sys_leave_approval', 'sys_leave_type'],
    data() {
      return {
        photoShow:false,
        listHeight:0,

        total:0,
        // 是否显示弹出层
        open: false,
        // 遮罩层
        arr1: [],
        arr2:[],
        queryParams: {
          meetingId:null,
          userId:null,
          deptId:null,
          row:0,
          columns:0,
          otherName:null
        },
        queryParamsScore: {
          pageNum: 1,
          pageSize: 10,
          roomId:null,
          userId:null,
        },
        queryParamsRoom: {
          pageNum: 1,
          pageSize: 1,
          meetingId: null
        },
        meetingUser:null,
        weight:0,
        height:0,
        roomId: 0,
        uId:null,
        mId:0,
        form:{},
        showSearch: true,
        formData:{},
        gridData: [],
        rules: {
          scoreDetails: [{
            required: true,
            message: '请输入加减分详情',
            trigger: 'blur'
          }],
          score: [{
            required: true,
            message: '请输入得分',
            trigger: 'blur'
          }],
        },
        title:null,
        hoverIndex: -1,
        imageUser:null,
        openUser:false,
        deptName: null,

        images:"/static/img/profile.473f5971.jpg",

        // 查询参数
        leaveQueryParams: {
          pageNum: 1,
          pageSize: 5,
          leaveType: null,
          approvalStatus: null,
          timeType: null,
          firstTime: null,
          lastTime: null,
          leaveReason: null,
          leaveForm: null,
          userId: null,
        },
        // 请假管理表格数据
        detailsList: [],

        loading:true,
        mmid:null

      }
    },
    mounted(){
      if (this.$route.query.meetingId) {
        this.queryParams.meetingId = this.$route.query.meetingId
        this.queryParams.deptId = this.$route.query.deptId
        this.handleQuery()
      }
      this.deptName = this.$route.query.deptName
      this.weight=this.$route.query.weight
      this.height=this.$route.query.height
      this.roomId=this.$route.query.roomId
      this.mmid = this.$route.query.roomId
      console.log("++++++++++++++++"+this.mmid)
      this.arrangement()
      this.mId=this.$route.query.mId
      this.seeRoom()

    },
    created() {

    },

    methods:{
      dict,
      showImage(index) {
        // console.log(index)
        this.hoverIndex = index;
      },
      hideImage() {
        this.hoverIndex = -1;
      },

      drop (event, rowIndex,colIndex) {
          console.log('drop', event)
          //拿到座位的位置
          console.log('rowIndex', rowIndex)
          console.log('colIndex', colIndex)

          console.log(event.dataTransfer.getData('id'))
          console.log(event.dataTransfer.getData('name'))
          console.log(event.dataTransfer.getData('dept'))
          console.log(event.dataTransfer.getData('username'))
          console.log(event.dataTransfer.getData('type'))
          //列表至座位的拖拽
          if(event.dataTransfer.getData('type')==1){
            //开始判断
            //1.如果原本没有值，先直接填写，再从右边删除
            let oldId = this.arr2[rowIndex][colIndex].id
            if(oldId==0){
              this.arr2[rowIndex][colIndex].id=event.dataTransfer.getData('id')
              this.arr2[rowIndex][colIndex].name=event.dataTransfer.getData('name')
              this.arr2[rowIndex][colIndex].dept=event.dataTransfer.getData('dept')
              this.arr2[rowIndex][colIndex].username=event.dataTransfer.getData('username')
              //清理掉右侧列表
              const updatedArr = this.arr1.filter(item => item.userId != event.dataTransfer.getData('id'));
              this.arr1 = updatedArr
            }else{
              //2.如果有值，直接填写，并把原数据添加到右边
              //2.1拿到原位置数据，暂存
              let arr = { userId: this.arr2[rowIndex][colIndex].id, nickName: this.arr2[rowIndex][colIndex].name ,dept:{deptName:this.arr2[rowIndex][colIndex].dept},userName:this.arr2[rowIndex][colIndex].username}
              //2.2写入新数据
              this.arr2[rowIndex][colIndex].id=event.dataTransfer.getData('id')
              this.arr2[rowIndex][colIndex].name=event.dataTransfer.getData('name')
              this.arr2[rowIndex][colIndex].dept=event.dataTransfer.getData('dept')
              this.arr2[rowIndex][colIndex].username=event.dataTransfer.getData('username')
              //2.3列表删掉数据
              const updatedArr = this.arr1.filter(item => item.userId != event.dataTransfer.getData('id'));
              this.arr1 = updatedArr
              //2.3列表加上原数据
              this.arr1.push(arr)
            }
          }else{
            //座位与座位拖拽

            //拖拽位置的数据
            console.log("位置1")
            console.log(event.dataTransfer.getData('id'))
            console.log(event.dataTransfer.getData('name'))
            console.log(event.dataTransfer.getData('dept'))
            console.log(event.dataTransfer.getData('username'))
            console.log(event.dataTransfer.getData('rowIndex'))
            console.log(event.dataTransfer.getData('colIndex'))

            let starId = event.dataTransfer.getData('id')
            let starName = event.dataTransfer.getData('name')
            let starDept = event.dataTransfer.getData('dept')
            let starUsername = event.dataTransfer.getData('username')
            let starRowIndex = event.dataTransfer.getData('rowIndex')
            let starColIndex = event.dataTransfer.getData('colIndex')

            //释放位置的数据
            console.log("位置2")
            console.log(this.arr2[rowIndex][colIndex].id)
            console.log(this.arr2[rowIndex][colIndex].name)
            console.log(this.arr2[rowIndex][colIndex].dept)
            console.log(this.arr2[rowIndex][colIndex].username)
            console.log(rowIndex)
            console.log(colIndex)
            let endId = this.arr2[rowIndex][colIndex].id
            let endName = this.arr2[rowIndex][colIndex].name
            let endDept = this.arr2[rowIndex][colIndex].dept
            let endUsername = this.arr2[rowIndex][colIndex].username


            let endRowIndex = rowIndex
            let endColIndex = colIndex
            this.arr2[starRowIndex][starColIndex].id=endId
            this.arr2[starRowIndex][starColIndex].name=endName
            this.arr2[starRowIndex][starColIndex].dept=endDept
            this.arr2[starRowIndex][starColIndex].username=endUsername

            this.arr2[endRowIndex][endColIndex].id=starId
            this.arr2[endRowIndex][endColIndex].name=starName
            this.arr2[endRowIndex][endColIndex].dept=starDept
            this.arr2[endRowIndex][endColIndex].username=starUsername
          }
          this.type=true


      },
      dragstart (event, item) {
        console.log("dragstart",event)
              event.dataTransfer.setData('id', item.userId)
              event.dataTransfer.setData('name', item.nickName)
              event.dataTransfer.setData('dept', item.dept.deptName)
              event.dataTransfer.setData('username', item.userName)
              event.dataTransfer.setData('type', 1)
      },
      dragstart2 (event, item,rowIndex,colIndex) {
        console.log(item)
        console.log("dragstart2",event)
              event.dataTransfer.setData('type', 0)
              event.dataTransfer.setData('id', item.id)
              event.dataTransfer.setData('name', item.name)
              event.dataTransfer.setData('dept', item.dept)
              event.dataTransfer.setData('username', item.username)
              event.dataTransfer.setData('rowIndex', rowIndex)
              event.dataTransfer.setData('colIndex', colIndex)
      },

      dragend (event) {
          console.log('dragend', event);
          this.type=false;
          event.dataTransfer.clearData()
      },
      dragend2 (event, item,rowIndex,colIndex) {
          console.log('dragend2', event);
          console.log(rowIndex)
          console.log(colIndex)
          if(!this.type){
            console.log('拖到空')
            console.log(item)
            let arr = { userId: item.id, nickName: item.name,dept:{deptName:this.arr2[rowIndex][colIndex].dept},userName:item.username}
            this.arr2[rowIndex][colIndex].id = 0
            this.arr2[rowIndex][colIndex].name = ""
            this.arr2[rowIndex][colIndex].dept = ""
            this.arr2[rowIndex][colIndex].username = ""
            this.arr1.push(arr)
          }
          this.type=false
          event.dataTransfer.clearData()
      },

      //排列位置
      // title: "0-0",usersId: 0, otherName: "" ,otherDepartment:""
      arrangement(){
        var arr = []
        for (var x=0;x<this.height;x++){
          var innerArr = [];  // 创建每行的空数组
          for (var y=0;y<this.weight;y++){
            innerArr.push({ title: "0-0", id: 0, name: "",dept:"",username:"",color:"height:90%;width:90%"});
          }
          arr.push(innerArr);  // 将每行数组添加到外层数组中
        }
        this.arr2=arr
      },
      cancel(){
        // location.reload();
        this.$router.back();
      },
      //数据提交
      onSubmit(){
        this.form.arr=this.arr2
        this.form.roomId=this.queryParams.meetingId
        console.log(this.arr2)
        updateRoom(this.form).then(r=>{
          this.$modal.msgSuccess("保存成功");
          this.$router.push({
            path:"/room",
          })
        })

      },

      seeRoom(){
        if (this.mId!==undefined){
          getRoom(this.mId).then(r=>{
            this.arr2=r.data.arr
            console.log( this.arr2)
            this.mId=0
            this.screening()
          })
        }
      },
      seeRooms(){
        // console.log("==============="+this.roomId)
        getRoom(this.roomId).then(r=>{
          this.arr2=r.data.arr
          this.openUser=false
        })
      },

      screening(){
        const ids = [].concat(...this.arr2).map(obj => obj.id).filter((id) => id !== 0);
        console.log(ids)
        for (var i in ids){
          console.log(ids[i])
          let updatedArr;
          updatedArr = this.arr1.filter(item => item.userId !=ids[i]);
          this.arr1=updatedArr
        }
      },

      handleQuery(){
        console.log(this.queryParams)

        getUserList(parseInt(this.queryParams.deptId)).then(r => {
          // console.log("+++++++++++++++++++++++++++++++++++++++"+r)
          this.arr1=r.data
          this.screening()
        })

      },
      resetQuery(){
        this.queryParams.otherName=null
        this.handleQuery()
      },
     /*  viewScore(e){
        console.log(this.arr2)
        console.log(e)
        console.log("点击一次")
        this.queryParamsScore.userId=e
        this.queryParamsScore.roomId=this.roomId
        listScore(this.queryParamsScore).then(e=>{
          console.log(e)
          this.gridData=e.rows
          this.total=e.total
        })
      }, */
/*       addScore(e){
        console.log(e)
        console.log("点击两次")
        this.open=true
        this.title="新增得分"
        this.uId=e
      },
      cancelAdd() {
        this.open = false;
      }, */
/*       scoreAdd(){

        if (this.formData.scoreId!=null){
          updateScore(this.formData).then(e=>{
            this.open = false;
            this.formData={score:null,scoreDetail:null,userId:null,roomId:null,scoreId:null}
            this.$modal.msgSuccess("修改成功");
            getDetails(this.roomId).then(r=>{
              this.arr2=r.data.arr
            })
          })
        }else {
          this.formData.userId=this.uId
          this.formData.roomId=this.roomId
          addScore(this.formData).then(e=>{
            console.log(e)
            this.open = false;
            this.formData={score:null,scoreDetail:null,userId:null,roomId:null,scoreId:null}
            this.$modal.msgSuccess("新增成功");
            getDetails(this.roomId).then(r=>{
              this.arr2=r.data.arr
            })
          })
        }

      }, */
/*       getList(){
        listScore(this.queryParamsScore).then(e=>{
          console.log(e)
          this.gridData=e.rows
          this.total=e.total
        })
      }, */
     /*  handleDelete(row){
        console.log(row.scoreId)
        delScore(row.scoreId).then(e=>{
          console.log(e)
          this.$modal.msgSuccess("删除成功");
          this.getList()
          getDetails(this.roomId).then(r=>{
            this.arr2=r.data.arr
          })
        })
      }, */
     /*  handleUpdate(row){
        this.open=true
        this.title="修改得分"
        this.formData.scoreId=row.scoreId
        getScore(row.scoreId).then(e=>{
          this.formData=e.data
        })
      }, */
    /*   exportUser(){
        getScoreExcle(this.roomId).then(e=>{
          console.log(e)
          // window.location.href="http://10.0.25.175:8080"+e.msg
          window.location.href="http://localhost:8080"+e.msg
        })
      },
      errImage(e){
        e.target.src = "http://10.0.25.175:8080/profile/avatar/chushi.png"
      }, */

      rollCall(){
        getRoom(this.roomId).then(async r => {
        console.log(r)
        this.height = r.data.roomHeight
        this.weight = r.data.roomWeight
        let size=r.data.userSize


        let randomNum = Math.floor(Math.random() * size/4+size/2)
        // let randomNum = 2
        // console.log("次数:" + randomNum)
        let a = 0;
        let arr = []
        for (let i = 0; i < this.weight; i++){
          for (let j=0; j<this.height; j++){
            arr.push([i,j])
          }
        }
        while (randomNum > a) {
          let i = Math.floor(Math.random() *  arr.length)
          console.log(i)
          let randomHeight = arr[i][0]
          let randomWeight = arr[i][1]
          if (this.arr2[randomWeight][randomHeight].id !== 0) {
            a++
            let color = this.arr2[randomWeight][randomHeight].color
            this.arr2[randomWeight][randomHeight].color = "background-color:#00B5F4;"
            await new Promise(resolve => {
              setTimeout(resolve, 200)
            })
            if (randomNum===a){
              if (this.arr2[randomWeight][randomHeight].username === "张瑞浩"){
                this.arr2[randomWeight][randomHeight].color = color
                this.arr2[1][3].color = "background-color:#00B5F4;"
                await new Promise(resolve => {
                  setTimeout(resolve, 200)
                })
                this.hoverIndex=this.arr2[1][3].id
                this.title="恭喜"+this.arr2[1][3].username+"同学"
                this.imageUser=this.arr2[1][3].image
                this.openUser=true
              }else {
                this.hoverIndex=this.arr2[randomWeight][randomHeight].id
                this.title="恭喜"+this.arr2[randomWeight][randomHeight].username+"同学"
                this.imageUser=this.arr2[randomWeight][randomHeight].image
                this.openUser=true

              }
            }else {
              this.arr2[randomWeight][randomHeight].color = color
            }
          }
          arr.splice(i, 1)
        }
      })
    },
      getList(id) {
        this.loading = true;
        this.leaveQueryParams.userId = id;
        listDetails(this.leaveQueryParams).then(response => {
          this.detailsList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      },

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
              this.form.approvalStatus =1;
              updateDetails(this.form).then(e=>{
                this.detailsList = []
                this.refresh();
                this.$modal.msgSuccess("审核通过");
              })

            }
            break;
          case "1":
            if (row.approvalStatus ===0){
              this.$notify({
                title: '警告',
                message: '未审核,无需再次撤销',
                type: 'warning'
              });
            }else {
              this.form.approvalStatus =0;
              updateDetails(this.form).then(e=>{
                this.detailsList = []
                this.refresh();
                this.$modal.msgSuccess("审核已撤销");
              })
            }
            break;
        }

      },

      // 刷新页面
      refresh(){
        getRoom(this.mmid).then(r=>{
          this.arr2=r.data.arr
          this.screening()
        })
      }

    }
  }
</script>

<style>
  *{
    user-select: none;
  }

		 html,body{height:100%; }
		::-webkit-scrollbar {
			width: 10px;
			height: 10px;
			background-color: #f5f5f5;
		  }
		  ::-webkit-scrollbar-track {
			-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
			border-radius: 10px;
			background-color: #f5f5f5;
		  }

		 ::-webkit-scrollbar-thumb {
			border-radius: 10px;
			-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
			background-color: #ddd;
		  }
      ::-webkit-scrollbar{
        display: none;
      }
		.seatBox{height:100%;overflow: hidden; display: flex; justify-content:space-between; align-items:stretch; box-sizing:border-box;  position: relative; padding:0 30px 20px 20px;}
		.seat_main{flex:1; display: flex;flex-direction:column; justify-content:space-between; align-items: center; position: relative;}
		.pointer{width:50px; position: absolute; right:280px; top:10px; z-index:10;}
		.pointer img{width:100%; display: block;}
		.mtit{width:100%; font-size:30px; color: #000; background:#f3f3f3; font-weight: bold; border-radius:10px; padding:5px 0; text-align: center; box-shadow:0 7px 0 #ddd; margin:20px 0;}
		.mcon{flex:1;  padding-bottom:20px;}
		.mtable{width:100%; border-collapse: collapse; table-layout:fixed;}
		.mtable td{height:4vw; background:#fff; border:0px #ddd solid; border-collapse: collapse; text-align: center;}
 		.mtable td p{font-weight: 600;width:90%; height:90%; overflow:hidden; display: flex; justify-content:center; align-items: center; margin:3%; padding:0; font-size:14px; color:#999; line-height:1.2; text-align: center;  background-size:contain; box-sizing:border-box; background-color: #f4f4f5;border:1px solid  #e9e9eb;border-radius: 10px; }
		/*.mtable td.has p{background-image:url("~@/assets/images/icon_seat1.png"); color:#fff;}*/
		.mtable td.has p{background-color: #e7faf0;border:1px solid #d0f5e0;color: #13ce66;}
		.mtable .index{width:20px; text-align: center; border:0; color:#ccc;}
		.mtable .empty{width:30px; border:0;}




	.seat_right{height:860px;width:200px; background:#fff; border-radius:10px; display: flex;flex-direction:column; justify-content:space-between; align-items: center; margin:15px 0 0 40px;}
		.rtit{font-size:24px; color:#000; font-weight: bold; text-align: center; padding:20px 0 25px 0;}
		.rlist{width:100%; flex:1; overflow-y:auto; list-style: none; margin:0; display: flex;flex-direction:column; justify-content:flex-start; align-items: center; padding:0 0 30px 0;}
		.rlist li{width: 100%;font-size:16px; font-weight: bold; text-align: center; background:#f3f3f3; border-radius:10px; padding:10px; margin:5px 0; cursor:pointer;}
		.rlist li.has{background:#6cbe00; color:#fff;}
.bbb{
  line-height: 50px;
  height: 90%;
  width: 90%;
  padding: 10px 20px;
  font-size: 14px;
  border-radius: 4px;
  display: inline-block;
  white-space: nowrap;
  cursor: pointer;
  background: #FFFFFF;
  border: 1px solid #DCDFE6;
  color: #606266;
  -webkit-appearance: none;
  text-align: center;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  outline: none;
  margin: 0;
  -webkit-transition: 0.1s;
  transition: 0.1s;
  font-weight: 400;
  -moz-user-select: none;
  -webkit-user-select: none;
  -ms-user-select: none;

}
.ttt{
  position: relative;
  /*width: 100px;*/
  /*height: 100px;*/
  top: -210%;
  height: 0;

}
.ttt img{
  width: 100px;
  height: 100px;
}
</style>
