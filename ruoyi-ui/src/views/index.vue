<template>
  <div class="app-container home">
    <el-row :gutter="24" class="main-row">
      <!-- 左侧学院介绍 -->
      <el-col :sm="24" :lg="24" class="left-col">
        <div class="intro-card">
          <h2 class="title-gradient">双体软件精英产业学院</h2>
          <p class="subtitle">泰山科技学院首个荣誉学院</p>
          <div class="content-box">
            <p class="description">
              双体学院是泰科首个荣誉学院，是以一线大厂高薪就业和高质量就业为特色的教学部门。双体学院以软件技术实战＋职场关键能力为两条培养路径，力求打造精技术、有经验、明职场的职场新秀。
            </p>
            <div class="current-period">
              <span class="period-label">当前期数</span>
              <span class="period-number">第八期</span>
            </div>
          </div>
        </div>
      </el-col>

      <!-- 右侧课程内容 -->
      <el-col :sm="24" :lg="24" class="right-col">
        <div class="tech-section">
          <h3 class="section-title">核心技术栈</h3>
          <el-row :gutter="20">
            <el-col :span="12">
              <div class="tech-card backend">
                <div class="card-header">
                  <i class="el-icon-cpu"></i>
                  <h4>后端技术</h4>
                </div>
                <ul class="tech-list">
                  <li><i class="el-icon-check"></i>SpringBoot</li>
                  <li><i class="el-icon-check"></i>SpringMVC</li>
                  <li><i class="el-icon-check"></i>MyBatis</li>
                  <li><i class="el-icon-check"></i>JWT</li>
                  <li><i class="el-icon-check"></i>Druid</li>
                  <li><i class="el-icon-check"></i>Fastjson</li>
                </ul>
              </div>
            </el-col>
            <el-col :span="12">
              <div class="tech-card frontend">
                <div class="card-header">
                  <i class="el-icon-monitor"></i>
                  <h4>前端技术</h4>
                </div>
                <ul class="tech-list">
                  <li><i class="el-icon-check"></i>HTML</li>
                  <li><i class="el-icon-check"></i>CSS</li>
                  <li><i class="el-icon-check"></i>jQuery</li>
                  <li><i class="el-icon-check"></i>Axios</i></li>
                  <li><i class="el-icon-check"></i>Sass</i></li>
                  <li><i class="el-icon-check"></i>Quill</i></li>
                </ul>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return { version: "3.8.9" };
  }
};
</script>

<style scoped lang="scss">
.home {
  background: #f8f9fa;
  min-height: calc(100vh - 84px);
  padding: 20px;

  .main-row {
    max-width: 1200px;
    margin: 0 auto;
  }

  .left-col {
    .intro-card {
      background: white;
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);

      .title-gradient {
        background: linear-gradient(45deg, #2c3e50, #3498db);
        -webkit-background-clip: text;
        color: transparent;
        font-size: 32px;
        font-weight: 600;
        margin-bottom: 8px;
      }

      .subtitle {
        color: #7f8c8d;
        font-size: 16px;
        margin-bottom: 25px;
      }

      .content-box {
        border-left: 3px solid #3498db;
        padding-left: 20px;

        .description {
          color: #666;
          line-height: 1.8;
          font-size: 15px;
          margin-bottom: 25px;
        }

        .current-period {
          background: #f8f9fa;
          padding: 12px;
          border-radius: 8px;
          display: inline-flex;
          align-items: center;

          .period-label {
            background: #3498db;
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            margin-right: 12px;
            font-size: 14px;
          }

          .period-number {
            font-weight: bold;
            color: #2c3e50;
            font-size: 18px;
          }
        }
      }
    }
  }

  .right-col {
    margin-top: 20px; // 添加上下间距
    .tech-section {
      background: white;
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
      height: 100%;

      .section-title {
        color: #2c3e50;
        font-size: 24px;
        margin-bottom: 30px;
        text-align: center;
        position: relative;

        &::after {
          content: '';
          display: block;
          width: 50px;
          height: 3px;
          background: #3498db;
          margin: 10px auto;
        }
      }

      .tech-card {
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 20px;
        transition: transform 0.3s ease;

        &:hover {
          transform: translateY(-5px);
        }

        &.backend {
          background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
          border: 1px solid #dee2e6;
        }

        &.frontend {
          background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
          border: 1px solid #dee2e6;
        }

        .card-header {
          display: flex;
          align-items: center;
          margin-bottom: 15px;

          i {
            font-size: 24px;
            margin-right: 10px;
            color: #3498db;
          }

          h4 {
            color: #2c3e50;
            font-size: 18px;
            margin: 0;
          }
        }

        .tech-list {
          list-style: none;
          padding: 0;
          margin: 0;

          li {
            padding: 8px 0;
            color: #34495e;
            display: flex;
            align-items: center;
            font-size: 14px;

            i {
              color: #27ae60;
              margin-right: 8px;
              font-size: 16px;
            }

            &:hover {
              color: #3498db;
              cursor: default;
            }
          }
        }
      }
    }
  }
}
</style>
