<template>
  <div>
    <h1>게시글 목록</h1>
    <ul>
      <li v-for="article in articles" :key="article.id">
        <router-link :to="{ name: 'ArticleView', params: { id: article.id } }">
          {{ article.title }}
        </router-link>
      </li>
    </ul>
    <button @click="checkLoginAndRedirect">글쓰기</button>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import axios from 'axios';
import { useAuthStore } from '@/stores/counter';

const articles = ref([]);
const router = useRouter();
const authStore = useAuthStore();

const fetchArticles = () => {
  axios.get('http://localhost:8000/articles/')
    .then(response => {
      articles.value = response.data;
    })
    .catch(error => {
      console.error(error);
    });
};

const checkLoginAndRedirect = () => {
  if (!authStore.isLogin) {
    alert('로그인 후 이용 가능합니다.');
    router.push({ name: 'Login' });
  } else {
    router.push({ name: 'NewArticle' });
  }
};

onMounted(() => {
  fetchArticles();
});
</script>

<style scoped>
/* 추가적인 스타일 정의 가능 */
</style>
