<template>
  
 <div v-if="article">
    <h1>제목: {{ article.title }}</h1>
    <p>본문: {{ article.content }}</p>
    <p>작성자: {{ article.user }}</p>
    <p>작성일: {{ article.created_at }}</p>

    <div>
      <h2>댓글</h2>
      <ul>
        <li v-for="comment in article.comment_set" :key="comment.id">
          <p>{{ comment.content }}</p>
          <!-- <p>작성자: {{ comment.user }}</p> -->
          <p>작성일: {{ comment.created_at }}</p>
        </li>
      </ul>
      <form @submit.prevent="addComment">
        <textarea v-model="newCommentContent"></textarea>
        <button type="submit">댓글 작성</button>
      </form>
    </div>
    <router-link to="/articles">목록으로</router-link>
  </div>
 
</template>

<script setup>
import axios from 'axios'
import { useAuthStore } from '@/stores/counter'
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router';
const article = ref(null) // 변경: 초기값을 null로 설정
const newCommentContent = ref('')
const route = useRoute()

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

// const formatDate = function () {
//       const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' }
//       return new Date(date).toLocaleString('ko-KR', options)
//   }

onMounted(()=> {
  fetchArticle()
})

</script>

<style scoped>
/* 추가적인 스타일 정의 가능 */
</style>
