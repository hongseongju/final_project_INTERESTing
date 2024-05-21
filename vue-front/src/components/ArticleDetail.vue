<template>
  <div v-if="article">
    <h1>제목: {{ article.title }}</h1>
    <p>작성자: {{ article.nickname }}</p>
    <p>{{ article.content }}</p>
    <p>작성일: {{ new Date(article.created_at).toLocaleString() }}</p>
    <button @click="editArticle">글 수정</button>
    <button @click="deleteArticle">글 삭제</button>

    <div>
      <h3>댓글</h3>
      <form @submit.prevent="addComment">
        <textarea v-model="newCommentContent"></textarea>
        <button type="submit">댓글 작성</button>
      </form>
      <ul>
        <li v-for="comment in article.comment_set" :key="comment.id">
          <div v-if="editingComment && editingComment.id === comment.id">
            <textarea v-model="editingCommentContent"></textarea>
            <button @click="updateComment">수정 완료</button>
            <button @click="cancelEditComment">취소</button>
          </div>
          <div v-else>
            <p>작성자: {{ comment.nickname }}</p>
            <p>🌸{{ comment.content }}🌸</p>
            <p>작성일: {{ new Date(comment.created_at).toLocaleString() }}</p>
            <button @click="editComment(comment)">댓글 수정</button>
            <button @click="deleteComment(comment.id)">댓글 삭제</button>
          </div>
          <hr>
        </li>
      </ul>
    </div>
    <router-link to="/articles">목록으로</router-link>
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
const route = useRoute();
const router = useRouter();
const authStore = useAuthStore();

const fetchArticle = function () {
  return axios.get(`http://localhost:8000/articles/${route.params.id}/`)
    .then(response => {
      article.value = response.data;
      return response.data;
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

onMounted(() => {
  fetchArticle();
});
</script>

<style scoped>
/* 추가적인 스타일 정의 가능 */
</style>
