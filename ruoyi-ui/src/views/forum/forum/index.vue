<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px" class="query-form">
      <h2>查询帖子</h2>
      <el-form-item label="用户名" prop="username">
        <el-input
          v-model="queryParams.username"
          placeholder="请输入用户名"
          able clear
          @keyup.enter.native="handleQuery"
          class="search-input"
        />
      </el-form-item>
      <el-form-item label="标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入标题"
          clearable
          @keyup.enter.native="handleQuery"
          class="search-input"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery" class="search-button">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery" class="reset-button">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8 action-row">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['forum:forum:add']"
          class="add-button"
        >新增</el-button>
      </el-col>

      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['forum:forum:export']"
          class="export-button"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="forumList" @selection-change="handleSelectionChange" class="custom-table">
      <el-table-column label="帖子内容" align="left" class-name="post-column">
        <template slot-scope="scope">
          <div class="post-container">
            <!-- 用户信息 -->
            <div class="user-info">
              <el-avatar :size="40" :src="scope.row.avatar || 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'"></el-avatar>
              <span class="username">{{ scope.row.username }}</span>
            </div>

            <!-- 帖子内容 -->
            <div class="post-content">
              <h2 class="post-title">{{ scope.row.title }}</h2>
              <div class="post-body" v-html="scope.row.content"></div>
            </div>

            <!-- 评论列表 -->
            <div class="comment-list" v-show="scope.row.isExpanded">
              <div v-if="scope.row.comments && scope.row.comments.length">
                <div v-for="comment in scope.row.comments" :key="comment.id" class="comment-item" v-if="comment.forumId === scope.row.id">
                  <el-avatar :size="30" :src="comment.avatar || 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'"></el-avatar>
                  <span style="width: 10px; display: inline-block;">&nbsp;</span>
                  <span class="username">{{ comment.remark1}}</span>
                  <div class="comment-content" v-html="comment.content || '暂无内容'"></div>
                  <div class="comment-info">
                    <span class="comment-time">{{ parseTime(comment.createTime || comment.create_time) }}</span>
                  </div>

                </div>

              </div>
              <div v-else class="no-comments">暂无评论</div>
            </div>

            <!-- 操作按钮 -->
            <div class="post-actions">
              <div class="admin-actions">
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-edit"
                  @click="handleUpdate(scope.row)"
                  v-hasPermi="['forum:forum:edit']"
                  class="operation-button edit-text"
                >修改</el-button>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-delete"
                  @click="handleDelete(scope.row)"
                  v-hasPermi="['forum:forum:remove']"
                  class="operation-button delete-text"
                >删除</el-button>
              </div>
              <div class="action-buttons">
                <!-- 新增展开/收起按钮 -->
                <el-button
                  type="text"
                  :icon="scope.row.isExpanded ? 'el-icon-arrow-up' : 'el-icon-arrow-down'"
                  @click="toggleComments(scope.row)"
                  class="action-btn"
                >
                  {{ scope.row.isExpanded ? '收起' : '展开' }}
                </el-button>
                <el-button
                  type="text"
                  icon="el-icon-thumb"
                  @click="handleLike(scope.row)"
                  class="action-btn"
                >
                  {{ scope.row.likes || 0 }}
                </el-button>
                <el-button
                  type="text"
                  icon="el-icon-chat-dot-round"
                  @click="handleComment(scope.row)"
                  class="action-btn"
                  v-hasPermi="['forum:comment:add']"
                >
                  {{ scope.row.commentCount || 0 }}
                </el-button>
              </div>
            </div>
          </div>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
      class="pagination"
    />

    <!-- 添加或修改知识论坛对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body class="custom-dialog">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" class="dialog-form">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="form.username" placeholder="请输入用户名" class="form-input" />
        </el-form-item>
        <el-form-item label="内容">
          <editor v-model="form.content" :min-height="192" class="editor" />
        </el-form-item>
        <el-form-item label="标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入标题" class="form-input" />
        </el-form-item>
        <el-form-item label="部门ID" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入部门ID" class="form-input" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm" class="submit-button">确 定</el-button>
        <el-button @click="cancel" class="cancel-button">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 评论对话框 -->
    <el-dialog :title="'评论帖子: ' + currentPostTitle" :visible.sync="commentOpen" width="500px" append-to-body class="custom-dialog">
      <el-form ref="commentForm" :model="commentForm" label-width="80px" class="dialog-form">
        <el-form-item label="评论内容">
          <el-input
            v-model="commentForm.content"
            type="textarea"
            :rows="4"
            placeholder="请输入评论内容"
            class="form-input"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitComment" class="submit-button">提交评论</el-button>
        <el-button @click="commentOpen = false" class="cancel-button">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listForum, getForum, delForum, addForum, updateForum} from "@/api/forum/forum"
import { listComment, getComment, delComment, addComment, updateComment } from "@/api/forum/comment"
import { parseTime } from "@/utils/ruoyi"
export default {
  name: "Forum",
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
      // 知识论坛表格数据
      forumList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示评论弹出层
      commentOpen: false,
      // 当前帖子标题
      currentPostTitle: "",
      // 当前帖子ID
      currentPostId: null,
      // 查询参数
      queryParams: {
      pageNum: 1,
        pageSize: 10,
        username: null,
        content: null,
        title: null,
        status: null,
        remark1: null,
        remark2: null,
    },
    // 表单参数
    form: {},
    // 评论表单
    commentForm: {
      content: "",
    },
    // 表单校验
    rules: {
    }
  };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 新增方法：切换评论展开状态*/
    toggleComments(row) {
      console.log("切换评论状态", row); // 调试得知row的id为主贴id
      const wasExpanded = row.isExpanded;
      this.$set(row, 'isExpanded', !wasExpanded);

      if (!wasExpanded) {
        // 获取评论数据
        listComment(row.id).then(response => {
          //打印评论的id
          console.log("获取评论数据", response.rows); // 调试
          if (!row.comments) {
            this.$set(row, 'comments', []);
          }

            row.comments.splice(0, row.comments.length, ...response.rows || []);
          this.$set(row, 'isExpanded', true); // 确保状态正确
        }).catch(error => {
          console.error("获取评论失败", error); // 调试
          this.$set(row, 'isExpanded', false);
        });
      }
    },
    /** 查询知识论坛列表 */
    getList() {
      this.loading = true;
      listForum(this.queryParams).then(response => {
        this.forumList = response.rows.map(post => ({
          ...post,
          isExpanded: false, // 初始化展开状态
          comments: [] // 初始化评论为空数组
        }));
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
        username: null,
        content: null,
        title: null,
        status: null,
        remark1: null,
        remark2: null,
        remark: null,
        createTime: null,
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加知识论坛";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getForum(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改知识论坛";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateForum(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addForum(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除知识论坛编号为"' + ids + '"的数据项？').then(function() {
        return delForum(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('forum/forum/export', {
        ...this.queryParams
      }, `forum_${new Date().getTime()}.xlsx`);
    },
    /** 评论按钮操作 */
    handleComment(row) {
      this.currentPostId = row.id;
      this.currentPostTitle = row.title;
      // 获取评论数据
      listComment({ postId: row.userId }).then(response => {
        this.$set(row, 'comments', response.rows)
      })
      this.commentOpen = true;
    },
    /** 提交评论 */
    submitComment() {
      if (!this.commentForm.content) {
        this.$message.error("评论内容不能为空");
        return;
      }

      const commentData = {
        postId: this.currentPostId,
        content: this.commentForm.content,
      };

      addComment(commentData).then(response => {
        this.$modal.msgSuccess("评论提交成功");
        this.commentOpen = false;

        // 刷新评论列表并保持展开状态
        listComment({ postId: this.currentPostId }).then(response => {
          const post = this.forumList.find(p => p.id === this.currentPostId);
          if (post) {
            this.$set(post, 'comments', response.rows);
            this.$set(post, 'isExpanded', true);
          }
        });
      }).catch(error => {
        this.$modal.msgError("评论提交失败");
      });
    },

  }
};
</script>

<style scoped lang="scss">
/* 主容器 */
.app-container {
  padding: 24px;
  background: #f8fafc;
}

/* 查询表单 */
.query-form {
  background: linear-gradient(145deg, #ffffff, #f8fafc);
  padding: 20px;
  border-radius: 12px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
  margin-bottom: 24px;
  transition: all 0.3s ease;

  &:hover {
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.08);
  }

  .el-form-item {
    margin-bottom: 0;
    margin-right: 24px;
  }
}

.search-input {
  width: 240px;
  border-radius: 8px;

  ::v-deep .el-input__inner {
    border-radius: 8px;
    transition: all 0.3s ease;

    &:hover {
      border-color: #409EFF;
    }

    &:focus {
      box-shadow: 0 0 0 2px rgba(64, 158, 255, 0.2);
    }
  }
}

/* 新增评论样式 */
.no-comments {
  color: #999;
  font-size: 12px;
  padding: 10px;
  text-align: center;
}
.comment-list {
  margin-top: 20px;
  border-top: 1px solid #eee;
  padding-top: 15px;


  .comment-item {
    margin: 10px 0;
    padding: 12px;
    background: #f8f9fa;
    border-radius: 8px;
    font-size: 13px;

    .user-info {
      display: flex;
      align-items: center;
      margin-bottom: 8px;

      .comment-info {
        margin-left: 10px;
        display: flex;
        flex-direction: column;

        .username {
          font-weight: 500;
          color: #2c3e50;
          font-size: 12px;
        }

        .comment-time {
          color: #888;
          font-size: 11px;
          margin-top: 2px;
        }
      }
    }

    .comment-content {
      margin-left: 42px;
      color: #555;
      line-height: 1.5;
      font-size: 13px;

      ::v-deep img {
        max-width: 80%;
        border-radius: 4px;
        margin: 5px 0;
      }
    }
  }
}

/* 调整操作按钮位置 */
.post-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 15px;

  .action-buttons {
    margin-left: auto;
    display: flex;
    align-items: center;

    .action-btn {
      margin-left: 20px;
    }
  }

  .admin-actions {
    display: flex;
    align-items: center;
  }
}


/* 操作按钮 */
.action-row {
  margin-bottom: 20px;

  .el-button {
    font-weight: 500;
    letter-spacing: 0.5px;
    border-radius: 8px;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    color: whitesmoke;
    &--primary {
      background: linear-gradient(135deg, #409EFF, #3375ff);
      border: none;

      &:hover {
        transform: translateY(-1px);
        box-shadow: 0 4px 6px -1px rgba(64, 158, 255, 0.3);
      }
    }

    &--warning {
      background: linear-gradient(135deg, #e6a23c, #d48207);
      border: none;
      color: white;
    }
  }
}

/* 数据表格 */
.custom-table {
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);

  ::v-deep {
    th {
      background: linear-gradient(145deg, #f8fafc, #f1f5f9);
      color: #64748b;
      font-weight: 600;
    }

    tr {
      transition: background 0.2s ease;

      &:hover {
        background: #f8fafc;

        td {
          background: transparent;
        }
      }
    }

    .el-table__row--striped:hover {
      background: #f1f5f9;
    }
  }
}

.post-container {
  padding: 20px;
  border-bottom: 1px solid #eee;
}

.user-info {
  margin-bottom: 15px;

  .username {
    margin-left: 15px;
    font-size: 14px;
  }
}


.post-content {
  margin-left: 52px; /* 对齐头像 */

  .post-title {
    margin: 0 0 12px 0;
    font-size: 20px;
    color: #1a1a1a;
  }

  .post-body {
    font-size: 14px;
    color: #555;
    line-height: 1.6;
    margin-bottom: 15px;

    ::v-deep img {
      max-width: 100%;
      border-radius: 4px;
      margin: 10px 0;
    }
  }
}

.post-actions {
  display: flex;
  align-items: center;
  margin-left: 52px;

  .action-btn {
    margin-right: 20px;
    color: #666;

    &:hover {
      color: #409EFF;
    }

    i {
      margin-right: 5px;
    }
  }

  .admin-actions {
    margin-left: auto;
  }
}

/* 操作按钮 */
.operation-button {
  margin-left: 10px;
  font-size: 13px;

  &.edit-text {
    color: #10b981;
  }

  &.delete-text {
    color: #ef4444;
  }
}

.custom-table {
  ::v-deep .el-table__row {
    td {
      padding: 0 !important;
    }
  }

  ::v-deep .post-column {
    .cell {
      padding: 0 !important;
    }
  }
}

/* 分页 */
.pagination {
  margin-top: 24px;

  ::v-deep .btn-prev,
  ::v-deep .btn-next {
    border-radius: 8px;
  }

  ::v-deep .number {
    border-radius: 8px;
    transition: all 0.2s ease;

    &:hover {
      transform: translateY(-1px);
    }
  }
}

/* 对话框 */
.custom-dialog {
  border-radius: 16px;
  overflow: hidden;

  .el-dialog__header {
    background: linear-gradient(135deg, #f8fafc, #f1f5f9);
    padding: 20px;
    border-bottom: 1px solid #e2e8f0;
  }

  .el-dialog__title {
    color: #1e293b;
    font-weight: 600;
    font-size: 18px;
  }

  .dialog-form {
    padding: 20px;

    .el-form-item__label {
      color: #64748b;
      font-weight: 500;
    }
  }

  .form-input {
    ::v-deep .el-input__inner {
      border-radius: 8px;
      transition: all 0.3s ease;

      &:focus {
        box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.2);
      }
    }
  }

  .editor {
    border-radius: 8px;
    overflow: hidden;
    border: 1px solid #e2e8f0;
  }
}

/* 按钮 */
.submit-button {
  background: linear-gradient(135deg, #3b82f6, #2563eb);
  border: none;
  border-radius: 8px;
  padding: 10px 24px;
  transition: all 0.3s ease;

  &:hover {
    transform: translateY(-1px);
    box-shadow: 0 4px 6px -1px rgba(59, 130, 246, 0.3);
  }
}

.cancel-button {
  background: #f1f5f9;
  color: #64748b;
  border: none;
  border-radius: 8px;
  padding: 10px 24px;
  transition: all 0.3s ease;

  &:hover {
    background: #e2e8f0;
    color: #475569;
  }
}

/* 评论对话框 */
.comment-form {
  .el-textarea__inner {
    border-radius: 8px;
    transition: all 0.3s ease;

    &:focus {
      box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.2);
    }
  }
}
</style>
