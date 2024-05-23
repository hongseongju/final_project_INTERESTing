<template>
  <div class="container">
    <h1>&nbsp;주식톡톡 &nbsp;</h1>
    <ul class="article-list">
      <li class="article-item" v-for="article in paginatedArticles" :key="article.id">
        <span class="article-run">{{ article.id }}</span>
        <router-link class="article-link" :to="{ name: 'ArticleView', params: { id: article.id } }">
          {{ article.title }}
        </router-link>
        <span class="author">{{ article.nickname }}</span>
      </li>
    </ul>
    <div class="footer">
      <div class="pagination">
        <span 
          v-for="page in totalPages" 
          :key="page" 
          @click="currentPage = page" 
          :class="{ active: currentPage === page }">
          {{ page }}
        </span>
      </div>
    </div>
    <button class="write-button" @click="checkLoginAndRedirect">&nbsp;write&nbsp;</button>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import axios from 'axios';
import { useAuthStore } from '@/stores/counter';

const articles = ref([]);
const router = useRouter();
const authStore = useAuthStore();
const currentPage = ref(1);
const itemsPerPage = 10;

const fetchArticles = () => {
  axios.get('http://localhost:8000/articles/')
    .then(response => {
      articles.value = response.data.reverse();
    })
    .catch(error => {
      console.error(error);
    });
};

const paginatedArticles = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  return articles.value.slice(start, end);
});

const totalPages = computed(() => {
  return Math.ceil(articles.value.length / itemsPerPage);
});

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
.container {
  width: 50%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  box-sizing: border-box;
}

h1 {
  text-align: center;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 2px solid #000;
}

.article-list {
  list-style: none;
  padding: 0;
  margin: 0;
  width: 100%;
}

.article-item {
  display: grid;
  grid-template-columns: 1fr 4fr 1fr;
  align-items: center;
  padding: 15px 0;
  border-bottom: 1px solid #e0e0e0;
}

.article-item:last-child {
  border-bottom: none;
}

.article-run {
  text-align: center;
  color: #01415B;
}

.article-link {
  text-decoration: none;
  color: #333;
  font-size: 1.1em;
}

.article-link:hover {
  text-decoration: underline;
}

.author {
  text-align: right;
  color: #888;
  font-size: 0.9em;
  white-space: nowrap;
}

.footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 20px;
  background-color: white; /* 배경색을 흰색으로 설정 */
  padding: 10px; /* 적절한 여백 추가 */
}

.pagination {
  display: flex;
  justify-content: center;
  margin: 0;
}

.pagination span {
  margin: 0 5px;
  padding: 5px 10px;
  cursor: pointer;
  color: #888;
}

.pagination span.active {
  color: #000;
  font-weight: bold;
}

.write-button {
  background-color: #f0f0f0;
  color: #666;
  border: 1px solid #ddd;
  border-radius: 4%;
  padding: 5px 10px;
  cursor: pointer;
  text-align: justify;
  margin-left: auto;
 
}

.write-button:hover {
  background-color: #e0e0e0;
}
</style>
