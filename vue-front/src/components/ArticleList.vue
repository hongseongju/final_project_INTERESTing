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
  </div>
  <router-link to="/new-article">글쓰기</router-link>
</template>

<script>
import { RouterLink, RouterView } from 'vue-router';
import axios from 'axios';

export default {
  data() {
    return {
      articles: []
    };
  },
  created() {
    axios.get('http://localhost:8000/articles/')
      .then(response => {
        this.articles = response.data;
      })
      .catch(error => {
        console.error(error);
      });
  }
};
</script>
