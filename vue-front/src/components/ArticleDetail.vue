<template>
    <div>
      <h1>{{ article.title }}</h1>
      <p>{{ article.content }}</p>
      <h3>Comments</h3>
      <ul>
        <li v-for="comment in article.comments" :key="comment.id">
          {{ comment.content }} - {{ comment.user.nickname }}
        </li>
      </ul>
      <CommentForm :articleId="article.id" />
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import CommentForm from './CommentForm.vue';
  
  export default {
    components: {
      CommentForm
    },
    data() {
      return {
        article: {}
      };
    },
    created() {
      axios.get(`/articles/${this.$route.params.id}/`)
        .then(response => {
          this.article = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    }
  };
  </script>
  