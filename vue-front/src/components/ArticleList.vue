<template>
  <div>
    <h1>Articles</h1>
    <ul>
      <li v-for="article in articles" :key="article.id">
        <router-link :to="{ name: 'ArticleView', params: { id: article.id } }">
          {{ article.title }}
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>
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
