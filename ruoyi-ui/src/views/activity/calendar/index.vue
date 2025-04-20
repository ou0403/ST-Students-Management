<template>
  <div class="calendar-container">
    <!-- 日历头部 -->
    <div class="calendar-header">
      <div class="header-item">
<!--        <el-button type="primary" @click="prevMonth">上一周</el-button>-->
        <el-button type="primary" @click="getAllEvent">返回本周</el-button>
      </div>
      <div class="header-item" style="font-size: 30px">
        <span>第{{eventWeeks}}周</span>

      </div>
<!--      <div class="header-item">
        <el-button type="primary" @click="nextMonth">下一周</el-button>
      </div>-->
<!--      <el-input-number v-model="works" @change="handleChange" :min="1" :max="16" style="margin-right: 20px "></el-input-number>-->
      <div class="week-navigator">
        <button @click="prevWeek" class="nav-button">上一周</button>
        <input
          v-model="tempWeekNumber"
          min="1"
          max="16"
          @change="changeWeekNumber"
          @blur="saveWeekNumber"
          @keydown.enter="saveWeekNumber"
          class="nav-input"
        />
        <button @click="nextWeek" class="nav-button">下一周</button>
      </div>
    </div>
    <!-- 日历主体 -->
    <el-calendar v-model="selectedDate" :range="[mondayDate, sundayDate]">
      <!-- 自定义每日内容插槽 -->
      <template #dateCell="{ date, isSelected, isOtherMonth }" >
        <!--          v-if="!isOtherMonth"-->
        <div
          class="day-schedule"
          :class="{ 'is-other-month': isOtherMonth }"
        >
          <div class="day">{{date.getMonth()+1}}月{{date.getDate()}}日</div>
<!--          <div class="day">{{date.getMonth()+1}}</div>-->
          <!-- 动态渲染时间段 -->
<!--          v-if="date.getMonth() === selectedDate.getMonth()"-->
          <div
            v-for="(slot, index) in timeSlots"
            :key="slot.id"
            class="time-slot"
            @click="openDialog(date, slot)"
          >
<!--            <div class="slot-header">{{ slot.name  }} ({{ slot.start  }} - {{ slot.end  }})</div>-->
            <div class="slot-header">{{ slot.name }}</div>
            <!-- 已添加的事件 -->
            <div
              v-for="(event, i) in getEvents(date, slot.id)"
              :key="i"
              class="event-item"
              :style="{ backgroundColor: event.color  }"
            >
              {{ event.text }}
              <el-button
                type="text"
                icon="el-icon-close"
                @click.stop="deleteEvent(date,  slot.id,  i,event.id)"
              />
            </div>
          </div>
        </div>
      </template>
    </el-calendar>
<!--    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page.sync="currentPage3"
      :page-size="100"
      layout="prev, pager, next, jumper"
      :total="1000">
    </el-pagination>-->

    <!-- 事件添加对话框 -->
    <el-dialog
      title="添加活动"
      :visible.sync="dialogVisible"
      width="30%"
    >
      <el-form label-width="80px">
        <el-form-item label="活动内容">
          <el-input v-model="newEvent.text"  />
        </el-form-item>
        <el-form-item label="标记颜色">
          <el-select v-model="newEvent.color">
            <el-option
              v-for="item in colorList"
              :key="item.departmentColor"
              :label="item.departmentName"
              :value="item.departmentColor"
              >
              <span style="float: left">{{ item.departmentName }}</span>
              <span :style="{'float': 'right','background-color': item.departmentColor,'font-size': '13px'}">{{ item.departmentColor }}</span>
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <span slot="footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="addEvent">确认</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import {addEvent, delEvent, listEventCalendar} from '@/api/activity/event'
import WeekNavigator from './WeekNavigator.vue'
import {getWeeks, listTime} from "@/api/activity/time";
import {listColor} from "@/api/activity/color";

export default {
  data() {
    return {
      selectedDate: new Date(), // 默认选中2025年3月14日

      timeSlots: [
        { id: 1, name: '上午' },
        { id: 2, name: '下午'},
        { id: 3, name: '晚上' },
      ], // 默认时间段配置
      events: {
/*       "2025-03-08": {
      1: [
        {
          "id":1,
          "text": "11",
          "color": "#409EFF",
          "timestamp": 1742007943486
        },
        {
          "id":2,
          "text": "12",
          "color": "#409EFF",
          "timestamp": 1742007943486
        },
      ],
      2:[
        {
          "id":3,
          "text": "23",
          "color": "#409EFF",
          "timestamp": 1742007943486
        },
        {
          "id":4,
          "text": "24",
          "color": "#409EFF",
          "timestamp": 1742007943486
        },
      ]
    },
      "2025-03-09": {
      1: [
        {
          "id":5,
          "text": "15",
          "color": "#409EFF",
          "timestamp": 1742008550707
        }
      ]
    } */
      }, // 事件数据
      dialogVisible: false,
      currentDate: null,
      currentSlot: null,
      newEvent: { text: '', color: '' },

      form:{},
      eventWeeks:1,
      mondayDate: '2025-04-7',
      sundayDate:'2025-04-13',
      numberId:null,
      // 周数相关
      currentWeek: 1,
      tempWeekNumber: 1,
      numberWeeks: 16,
      colorList: [],
    };
  },
  components: {
    WeekNavigator
  },
  beforeCreate() {

  },
  mounted() {

  },

  created(){
    this.getAllEvent();
  },
  methods: {
    // 转换日期为YYYY-MM-DD格式
    formatDate(date) {
      return date.toISOString().split('T')[0];
    },
    // 打开事件添加对话框
    openDialog(date, slot) {
      this.currentDate  = this.formatDate(date);
      this.currentSlot  = slot.id;
      this.dialogVisible  = true;
    },
    // 添加新事件
    addEvent() {
      if (!this.events[this.currentDate])  {
        this.$set(this.events,  this.currentDate,  {});
      }
      if (!this.events[this.currentDate][this.currentSlot])  {
        this.$set(this.events[this.currentDate],  this.currentSlot,  []);
      }
      this.events[this.currentDate][this.currentSlot].push({
        ...this.newEvent,
        timestamp: new Date().getTime()
      });
      // console.log(this.currentDate)
      // console.log(this.currentSlot)
      // console.log(this.newEvent)
      console.log(this.events[this.currentDate][this.currentSlot])
      let eventElement = this.events[this.currentDate][this.currentSlot].at(-1)
      this.form.eventDate = this.currentDate
      this.form.slotId = this.currentSlot
      this.form.eventText = eventElement.text
      this.form.eventColor = eventElement.color
      this.form.eventTimestamp = eventElement.timestamp
      this.form.numberId=this.numberId
      this.form.eventWeeks=this.eventWeeks
      addEvent(this.form).then(response => {
        this.$modal.msgSuccess("新增成功");
        this.dialogVisible  = false;
        this.newEvent  = { text: '', color: '#409EFF' };
        this.getCalendar();
      });


    },
    // 删除事件
    deleteEvent(date, slot, index,id) {
      const formattedDate = this.formatDate(date);
      this.events[formattedDate][slot].splice(index,  1);
      console.log(id)
      delEvent(id).then(response => {
        this.$modal.msgSuccess("删除成功");
        this.getCalendar();
      });
    },
    // 获取指定日期和时间段的事件
    getEvents(date, slotId) {
      const formattedDate = this.formatDate(date);
      return this.events[formattedDate]?.[slotId]  || [];
    },
    getCalendar(){
      this.form={}
      this.form.numberId = this.numberId
      this.form.eventWeeks = this.eventWeeks
      console.log(this.form)
      listEventCalendar(this.form).then(r =>{
        console.log(r.data)
        this.events = r.data
      })
    },
    //获取当前时间的行事历
    getAllEvent(){
      // this.form.numberId = 12
      const currentDate = new Date();
      this.selectedDate = currentDate
      const year = currentDate.getFullYear();
      const month = String(currentDate.getMonth() + 1).padStart(2, '0');
      const day = String(currentDate.getDate()).padStart(2, '0');
      const hours = String(currentDate.getHours()).padStart(2, '0');
      const minutes = String(currentDate.getMinutes()).padStart(2, '0');
      const seconds = String(currentDate.getSeconds()).padStart(2, '0');
      this.form.creatTime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`
      getWeeks(this.form).then(r =>{
        console.log(r.data)
        this.tempWeekNumber = r.data.eventWeeks
        this.currentWeek = r.data.eventWeeks
        this.numberWeeks = r.data.number.numberWeeks

        this.eventWeeks = r.data.eventWeeks
        this.mondayDate = r.data.mondayDate
        this.sundayDate = r.data.sundayDate
        this.numberId = r.data.numberId

        this.form={}
        this.form.numberId = this.numberId
        this.form.eventWeeks = this.eventWeeks
        console.log(this.form)
        listEventCalendar(this.form).then(r =>{
          console.log(r.data)
          this.events = r.data
        })
        this.form={}
        this.form.numberId = this.numberId
        listColor(this.form).then(r =>{
          console.log(r.rows)
          this.colorList=r.rows
        })
      })

    },

    prevWeek() {
      this.currentWeek = Math.max(1, this.currentWeek - 1);
      this.tempWeekNumber = this.currentWeek;
      this.changeWeekNumber()
    },
    nextWeek() {
      this.currentWeek = Math.min(this.numberWeeks, this.currentWeek + 1);
      this.tempWeekNumber = this.currentWeek;
      this.changeWeekNumber()
    },
    saveWeekNumber() {
      const num = parseInt(this.tempWeekNumber);
      if (!isNaN(num) && num > 0) {
        this.currentWeek = num;
      } else {
        this.tempWeekNumber = this.currentWeek;
      }
    },
    changeWeekNumber(){
      console.log(this.tempWeekNumber)
      this.form={}
      this.form.numberId = this.numberId
      this.form.eventWeeks = this.tempWeekNumber
      console.log(this.form)
      listTime(this.form).then(r =>{
        console.log(r.rows[0].eventWeeks)
        this.eventWeeks = r.rows[0].eventWeeks
        this.mondayDate = r.rows[0].mondayDate
        this.sundayDate = r.rows[0].sundayDate
        this.getCalendar()
      })
    }
  }
};
</script>

<style lang="scss" >
.el-calendar-table .el-calendar-day {
  height: auto;
}
.calendar-container {
  max-width: 1800px;
  margin: 20px auto;

  // 隐藏非本月的日期
  .el-calendar-table .el-calendar-day.is-other-month  {
    display: none; // 隐藏单元格
  }

  .day-schedule {
    display: flex;
    flex-direction: column; // 垂直排列时间段块
    gap: 10px; // 块之间的间距
    padding: 10px;
    height: auto; // 高度自适应
  }
  .day{
    text-align: center;
  }

  .time-slot {
    width: 100%; // 宽度撑满外部容器
    //min-height: 100px; // 最小高度，避免内容过少时太矮
    height: 200px; // 高度自适应
    padding: 15px;
    border: 1px solid #ebeef5;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); // 添加阴影效果
    overflow-y: auto; // 内容过多时滚动

    &:hover {
      background-color: #f5f7fa;
      transform: translateY(-2px); // 悬停时轻微上移
    }

    .slot-header {
      text-align: center;
      font-weight: bold;
      color: #606266;
      margin-bottom: 10px;
      font-size: 14px;
    }

    .event-item {
      padding: 6px 10px;
      margin: 5px 0;
      border-radius: 4px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      color: white;
      font-size: 12px;
      background-color: rgba(0, 0, 0, 0.7); // 事件背景色
      transition: background-color 0.3s;

      &:hover {
        background-color: rgba(0, 0, 0, 0.9); // 悬停时加深背景色
      }

      .el-icon-close {
        color: white;
        font-size: 12px;
        cursor: pointer;
      }
    }
  }
}
.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.header-item {
  margin: 0 20px 0 20px;
}
/*选择日期，年份的隐藏 */
.el-calendar__header {
  display: none;

}

.week-navigator {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  background-color: #f4f4f4;
  padding: 10px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.nav-button {
  padding: 8px 16px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.nav-button:hover {
  background-color: #0056b3;
}

.nav-input {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 100px;
  text-align: center;
}

.nav-input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
}
</style>
