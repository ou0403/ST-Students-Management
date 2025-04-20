<template>
  <div class="forum">
    <el-row>
      <!--      发表帖子-->
      <el-col :span="24"  :visible.sync="open" >
        <el-card :body-style="{ padding: '20px' }">
          <h2>发布帖子</h2>

          <el-form :model="newPost" ref="newPostForm" label-width="80px">
            <el-form-item label="标题">
              <el-input v-model="newPost.title" placeholder="请输入帖子标题"></el-input>
            </el-form-item>

            <el-form-item label="内容">
              <el-input type="textarea" v-model="newPost.content" placeholder="请输入帖子内容"></el-input>
            </el-form-item>

            <el-form-item label="图片">
              <el-upload
                class="upload-demo"
                drag
                action=""
                :on-change="handleImageChange"
                :show-file-list="false"
              >
                <el-button size="small" type="primary">点击上传图片</el-button>
                <div v-if="imageUrl" class="uploaded-image">
                  <img :src="imageUrl" alt="Uploaded Image" width="100px" />
                </div>
              </el-upload>
            </el-form-item>

            <el-form-item>
              <el-button type="primary" @click="postForum">发布帖子</el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>

      <!-- 显示帖子列表 -->
      <el-col :span="24">

        <el-card v-for="(post, index) in filteredPosts" :key="index" :body-style="{ padding: '20px' }" class="post-item">

          <!-- 搜索框 -->
          <div class="Search box">
            <el-col :span="24">
              <el-input
                v-model="searchQuery"
                placeholder="搜索论坛帖子"
                suffix-icon="el-icon-search"
                @input="searchPosts"
                style="width: 300px; margin-bottom: 20px;">
              </el-input>
              <el-button type="primary" style="margin-right: 200px" @click="postForum">发布帖子</el-button>
            </el-col>

          </div>
          <h3>{{ post.title }}</h3>
          <p>{{ post.content }}</p>
          <div v-if="post.imageUrl">
            <img :src="post.imageUrl" alt="Post Image" width="200px" />
          </div>

          <div class="comment-section">
            <el-input v-model="post.newComment" placeholder="发表评论" clearable></el-input>
            <el-button @click="addComment(post)" type="text">评论</el-button>

            <!-- 显示评论 -->
            <div v-if="post.comments.length > 0">
              <el-divider></el-divider>
              <div v-for="(comment, idx) in post.comments" :key="idx" class="comment-item">
                <el-card>{{ comment }}</el-card>
              </div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      newPost: {
        title: '',
        content: '',
        imageUrl: '',
        // 是否显示弹出层
        open: false,
      },
      posts: [
        {
          title: '欢迎加入论坛',
          content: '这是第一个帖子，大家可以讨论任何问题。',
          imageUrl: '',
          newComment: '',
          comments: ['很棒的帖子！']
        },
      ],
      searchQuery: '',
    }
  },
  computed: {
    // 根据搜索查询过滤帖子
    filteredPosts() {
      if (!this.searchQuery) {
        return this.posts;
      }
      return this.posts.filter(post => {
        return post.title.toLowerCase().includes(this.searchQuery.toLowerCase()) || post.content.toLowerCase().includes(this.searchQuery.toLowerCase());
      });
    }
  },
  methods: {
    // 处理图片上传
    handleImageChange(file) {
      // 假设这里是直接从 file 中获取 URL，实际情况下可以上传到服务器
      this.newPost.imageUrl = URL.createObjectURL(file.raw);
    },

    // 发布论坛帖子
    postForum() {
      if (!this.newPost.title || !this.newPost.content) {
        this.$message.error('标题和内容不能为空');
        this.open = true;
        return;

      }

      // 新帖子添加到帖子数组
      this.posts.push({
        title: this.newPost.title,
        content: this.newPost.content,
        imageUrl: this.newPost.imageUrl,
        newComment: '',
        comments: [],
      });

      // 重置输入框
      this.newPost.title = '';
      this.newPost.content = '';
      this.newPost.imageUrl = '';
    },

    // 添加评论
    addComment(post) {
      if (!post.newComment) {
        this.$message.error('评论不能为空');
        return;
      }

      post.comments.push(post.newComment);
      post.newComment = ''; // 清空评论输入框
    },

    // 搜索帖子
    searchPosts() {
      // searchPosts 被绑定到搜索框的 input 事件上，计算属性 `filteredPosts` 会自动更新
    }
  }
}
</script>

<style scoped>
.forum {
  max-width: 900px;
  margin: 0 auto;
}
.post-item {
  margin-bottom: 20px;
}
.comment-section {
  margin-top: 20px;
}
.uploaded-image {
  margin-top: 10px;

}

.Search box{}

.issue{
  justify-content: flex-end;
  margin-right: 50px;
}
</style>
