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
import { useRouter } from 'vue-router';
import { ref } from 'vue';

export default {
  setup() {
    const authStore = useAuthStore();
    const router = useRouter();
    const title = ref('');
    const content = ref('');

    const submitArticle = () => {
      axios.post('http://localhost:8000/articles/', {
        title: title.value,
        content: content.value
      }, {
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

    return {
      title,
      content,
      submitArticle
    };
  }
};
</script>
