<template>
    <form @submit.prevent="submitComment">
      <div>
        <label for="content">Comment</label>
        <textarea id="content" v-model="content"></textarea>
      </div>
      <button type="submit">Submit</button>
    </form>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    props: ['articleId'],
    data() {
      return {
        content: ''
      };
    },
    methods: {
      submitComment() {
        axios.post(`/articles/${this.articleId}/comments/`, {
          content: this.content
        })
        .then(response => {
          this.$emit('comment-added');
          this.content = '';
        })
        .catch(error => {
          console.error(error);
        });
      }
    }
  };
  </script>
  