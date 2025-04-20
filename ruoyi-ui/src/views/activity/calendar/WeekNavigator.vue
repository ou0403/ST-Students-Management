<template>
  <div class="week-navigator">
    <button @click="prevWeek" class="nav-button">上一周</button>
    <input
      v-model="tempWeekNumber"
      min="1"
      max="16"
      @blur="saveWeekNumber"
      @keydown.enter="saveWeekNumber"
      class="nav-input"
    />
    <button @click="nextWeek" class="nav-button">下一周</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentWeek: 1,
      tempWeekNumber: 1
    };
  },
  methods: {
    prevWeek() {
      this.currentWeek = Math.max(1, this.currentWeek - 1);
      this.tempWeekNumber = this.currentWeek;
    },
    nextWeek() {
      this.currentWeek++;
      this.tempWeekNumber = this.currentWeek;
    },
    saveWeekNumber() {
      const num = parseInt(this.tempWeekNumber);
      if (!isNaN(num) && num > 0) {
        this.currentWeek = num;
      } else {
        this.tempWeekNumber = this.currentWeek;
      }
    }
  }
};
</script>

<style scoped>
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
