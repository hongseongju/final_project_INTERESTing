<template>
  <form @submit.prevent="submitArticle">
    <div>
      <label for="title">Title</label>
      <input type="text" id="title" v-model="title" />
    </div>
    <div>
      <label for="content">Content</label>
      <textarea id="content" v-model="content"></textarea>
    </div>
    <button type="submit">Submit</button>
  </form>
</template>

<script>
import axios from 'axios';
import { useAuthStore } from '@/stores/counter';
import { useRouter, useRoute } from 'vue-router';
import { ref, onMounted } from 'vue';

export default {
  setup() {
    const authStore = useAuthStore();
    const router = useRouter();
    const route = useRoute();
    const title = ref('');
    const content = ref('');

    const submitArticle = () => {
      const payload = {
        title: title.value,
        content: content.value
      };

      const url = route.params.id
        ? `http://localhost:8000/articles/${route.params.id}/`
        : 'http://localhost:8000/articles/';
      const method = route.params.id ? 'put' : 'post';

      axios[method](url, payload, {
        headers: {
          Authorization: `Token ${authStore.token}`
        }
      })
      .then(response => {
        router.push('/articles');
      })
      .catch(error => {
        console.error(error);
      });
    };

    const fetchArticle = () => {
      if (route.params.id) {
        axios.get(`http://localhost:8000/articles/${route.params.id}/`)
          .then(response => {
            title.value = response.data.title;
            content.value = response.data.content;
          })
          .catch(error => {
            console.error('게시글 가져오기 실패:', error.response ? error.response.data : error.message);
          });
      }
    };

    onMounted(() => {
      fetchArticle();
    });

    return {
      title,
      content,
      submitArticle
    };
  }
};
</script>

<style scoped>
/* 추가적인 스타일 정의 가능 */
</style>
