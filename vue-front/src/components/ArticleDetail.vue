<template>
  <div v-if="article" class="article-container">
    <div class="article-header">
      <h4>{{ article.title }}</h4>
      <div class="article-meta1">
        <span class="article-author">작성자 : {{ article.nickname }}</span>
      </div>
    </div>
    <div class="article-content">
      <p>{{ article.content }}</p>
    </div>
    <div class="article-meta">
      <span class="article-date">{{ new Date(article.created_at).toLocaleString() }}</span>
    </div>
    <div class="article-actions" v-if="authStore.user && authStore.user.pk === article.user.pk">
      <button @click="editArticle">수정</button>
      <button @click="deleteArticle">삭제</button>
    </div>
    <div class="comments-section">
      <h10>댓글 {{ article.comment_set.length }}</h10>
      <form @submit.prevent="addComment" class="comment-form">
        <textarea v-model="newCommentContent" placeholder="댓글을 작성하세요"></textarea>
        <button type="submit">댓글 작성</button>
      </form>
      <ul class="comments-list">
        <li v-for="comment in article.comment_set" :key="comment.id" class="comment-item">
          <div v-if="editingComment && editingComment.id === comment.id" class="comment-edit">
            <textarea v-model="editingCommentContent"></textarea>
            <button @click="updateComment">수정 완료</button>
            <button @click="cancelEditComment">취소</button>
          </div>
          <div v-else class="comment-content">
            <p class="comment-author">{{ comment.nickname }}</p>
            <p class="comment-text">{{ comment.content }}</p>
            <p class="comment-date">작성일: {{ new Date(comment.created_at).toLocaleString() }}</p>
            <div class="comment-actions" v-if="authStore.user && authStore.user.pk === comment.user.pk">
<button @click="toggleMenu(comment.id)" class="icon-button"><i class="bi bi-three-dots-vertical custom-icon"></i></button>

  <div :class="{'dropdown-menu': true, 'active': activeCommentId === comment.id}">
    <button @click="editComment(comment)">수정</button>
    <button @click="deleteComment(comment.id)">삭제</button>
  </div>
</div>

          </div>
        </li>
      </ul>
    </div>
    <router-link to="/articles" class="back-link">목록으로</router-link>
  </div>
  <div v-else class="loading">
    <p>Loading...</p>
  </div>
</template>

<script setup>
import axios from 'axios';
import { useAuthStore } from '@/stores/counter';
import { ref, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';

const article = ref(null);
const newCommentContent = ref('');
const editingComment = ref(null);
const editingCommentContent = ref('');
const activeCommentId = ref(null); // 활성화된 댓글 ID
const route = useRoute();
const router = useRouter();
const authStore = useAuthStore();

const fetchArticle = function () {
  return axios.get(`http://localhost:8000/articles/${route.params.id}/`)
    .then(response => {
      article.value = response.data;
    })
    .catch(error => {
      console.error('게시글 가져오기 실패:', error.response ? error.response.data : error.message);
    });
};

const addComment = function () {
  if (!authStore.isLogin) {
    alert('로그인 후 이용 가능합니다.');
    router.push({ name: 'Login' });
    return;
  }

  const payload = {
    content: newCommentContent.value,
  };
  axios.post(`http://localhost:8000/articles/${article.value.id}/comments/`, payload, {
    headers: {
      Authorization: `Token ${authStore.token}`
    }
  })
  .then(() => {
    newCommentContent.value = '';
    fetchArticle();
  })
  .catch(error => {
    console.error('댓글 작성 실패:', error.response ? error.response.data : error.message);
  });
};

const deleteComment = function (commentId) {
  if (!authStore.isLogin) {
    alert('로그인 후 이용 가능합니다.');
    router.push({ name: 'Login' });
    return;
  }

  axios.delete(`http://localhost:8000/articles/comments/${commentId}/`, {
    headers: {
      Authorization: `Token ${authStore.token}`
    }
  })
  .then(() => {
    fetchArticle();
  })
  .catch(error => {
    console.error('댓글 삭제 실패:', error.response ? error.response.data : error.message);
  });
};

const editComment = function (comment) {
  editingComment.value = { ...comment };
  editingCommentContent.value = comment.content;
};

const cancelEditComment = function () {
  editingComment.value = null;
  editingCommentContent.value = '';
};

const updateComment = function () {
  if (!authStore.isLogin) {
    alert('로그인 후 이용 가능합니다.');
    router.push({ name: 'Login' });
    return;
  }

  const payload = {
    content: editingCommentContent.value,
  };

  axios.put(`http://localhost:8000/articles/comments/${editingComment.value.id}/`, payload, {
    headers: {
      Authorization: `Token ${authStore.token}`
    }
  })
  .then(() => {
    cancelEditComment();
    fetchArticle();
  })
  .catch(error => {
    console.error('댓글 수정 실패:', error.response ? error.response.data : error.message);
  });
};

const editArticle = function () {
  router.push({ name: 'EditArticle', params: { id: article.value.id } });
};

const deleteArticle = function () {
  if (!authStore.isLogin) {
    alert('로그인 후 이용 가능합니다.');
    router.push({ name: 'Login' });
    return;
  }

  axios.delete(`http://localhost:8000/articles/${article.value.id}/`, {
    headers: {
      Authorization: `Token ${authStore.token}`
    }
  })
  .then(() => {
    router.push({ name: 'ArticleList' });
  })
  .catch(error => {
    console.error('글 삭제 실패:', error.response ? error.response.data : error.message);
  });
};

const toggleMenu = function (commentId) {
  console.log('Toggling menu for comment ID:', commentId);
  if (activeCommentId.value === commentId) {
    activeCommentId.value = null;
  } else {
    activeCommentId.value = commentId;
  }
};


onMounted(() => {
  fetchArticle();
});
</script>

<style scoped>
.article-container {
  width: 80%;
  margin: auto;
  padding: 20px;
  background-color: #fff;
  box-shadow: none;
}

.article-header {
  padding-bottom: 10px;
  margin-bottom: 20px;

}

.article-header h1 {
  font-size: 24px;
  margin: 0;
}

.article-meta {
  display: flex;
  flex-direction: column;
  text-align: end;
  font-size: 14px;
  color: #555;
}
.article-meta1 {
  display: flex;
  flex-direction: column;
  
  font-size: 14px;
  color: #555;
}

.article-content {
  margin-bottom: 20px;
}

.article-actions {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  margin-bottom: 20px;
}

.article-actions button {
  padding: 5px 10px;
  border: 1px solid #ddd;
  background-color: #f9f9f9;
  cursor: pointer;
}

.article-actions button:hover {
  background-color: #f0f0f0;
}


.comments-section {
  margin-top: 20px;
}

.comment-form {
  margin-bottom: 20px;
}

.comment-form textarea {
  width: 100%;
  height: 80px;
  padding: 10px;
  border: 1px solid #ddd;
  box-sizing: border-box;
}

.comment-form button {
  margin-top: 10px;
  padding: 5px 10px;
  border: 1px solid #ddd;
  background-color: #f9f9f9;
  cursor: pointer;
}

.comment-form button:hover {
  background-color: #f0f0f0;
}

.comments-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.comment-item {
  padding: 10px 0;
  border-bottom: 1px solid #ddd;
}

.comment-item:last-child {
  border-bottom: none;
}

.comment-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.comment-author {
  font-weight:lighter;
  margin: auto;
  padding: 1%;
  color: #888;
}

.comment-text {
  margin: 0 10px;
  flex: 1;
}

.comment-date {
  font-size: 12px;
  color: #888;
}

.comment-actions {
  position: relative;
}

.comment-actions button {
  padding: 3px 5px;
  border: none;
  background: none;
  cursor: pointer;
}

.comment-actions .dropdown-menu {
  position: absolute;
  right: 0;
  background: #fff;
  border: 1px solid #ddd;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  z-index: 1000;
  display: none; /* 처음에는 숨겨진 상태 */
}

.comment-actions .dropdown-menu.active {
  display: block; /* active 클래스가 추가되면 표시 */
}


.comment-actions .dropdown-menu button {
  display: block;
  width: 100%;
  padding: 5px 10px;
  border: none;
  background: none;
  cursor: pointer;
  text-align: left;
}

.comment-actions .dropdown-menu button:hover {
  background-color: #f0f0f0;
}

.back-link {
  display: block;
  text-align: justify;
  margin-top: 20px;
  text-decoration: none;
  color: #555;
}

.back-link:hover {
  text-decoration: underline;
}

.loading {
  text-align: center;
  padding: 20px;
}

.custom-icon {
  color: #888; /* 원하는 색상으로 변경 */
}

</style>
