<template>
  <div v-if="article">
    <h1>제목: {{ article.title }}</h1>
    <p>작성자: {{ article.nickname }}</p>
    <p>{{ article.content }}</p>
    <p>작성일: {{ new Date(article.created_at).toLocaleString() }}</p>

    <div>
      <h3>댓글</h3>
      <form @submit.prevent="addComment">
        <textarea v-model="newCommentContent"></textarea>
        <button type="submit">댓글 작성</button>
      </form>
      <ul>
        <li v-for="comment in article.comment_set" :key="comment.id">
          <p>작성자: {{ comment.nickname }}</p>
          <p>🌸{{ comment.content }}🌸</p>
          <p>작성일: {{ new Date(comment.created_at).toLocaleString() }}</p>
          <hr>
        </li>
      </ul>
    </div>
    <router-link to="/articles">목록으로</router-link>
  </div>
</template>

<script setup>
import axios from 'axios'
import { useAuthStore } from '@/stores/counter'
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'


const article = ref(null)
const newCommentContent = ref('')
const route = useRoute()
const router = useRouter()

const fetchArticle = function () {
  return axios.get(`http://localhost:8000/articles/${route.params.id}/`)
    .then(response => {
      console.log('API 응답 데이터:', response.data)
      article.value = response.data
      console.log('Article 데이터:', article.value)
      console.log('Comments 데이터:', article.value.comments)
      return response.data
    })
    .catch(error => {
      console.error('게시글 가져오기 실패:', error.response ? error.response.data : error.message)
    })
}

const addComment = function () {
  const authStore = useAuthStore()
  if (!authStore.isLogin) {
    alert('로그인 후 이용 가능합니다.');
    router.push({ name: 'Login' });
    return;
  }

  const payload = {
    content: newCommentContent.value,
  }
  axios.post(`http://localhost:8000/articles/${article.value.id}/comments/`, payload, {
    headers: {
      Authorization: `Token ${authStore.token}`
    }
  })
  .then(() => {
    newCommentContent.value = '' 
    fetchArticle() // 댓글 추가 후 게시글을 다시 불러와서 댓글 목록을 업데이트
  })
  .catch(error => {
    console.error('댓글 작성 실패:', error.response ? error.response.data : error.message)
  })
}

onMounted(() => {
  fetchArticle()
})
</script>

<style scoped>
/* 추가적인 스타일 정의 가능 */
</style>
