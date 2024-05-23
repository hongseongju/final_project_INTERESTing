<template>
  <div class="container mt-5">
    <h1 class="text-center mb-4">카페 글쓰기</h1>
    <form @submit.prevent="submitArticle" class="border p-4 rounded mx-auto form-width">
      <div class="mb-3">
        <label for="title" class="form-label">제목</label>
        <input type="text" id="title" class="form-control" v-model="title" placeholder="제목을 입력해 주세요." />
      </div>
      <div class="mb-3">
        <label for="content" class="form-label">내용</label>
        <textarea id="content" class="form-control content-box" v-model="content" rows="15" placeholder="내용을 입력해 주세요."></textarea>
      </div>
      <button type="submit" class="btn btn-primary">등록</button>
    </form>
  </div>
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
.container {
  max-width: 1000px;
}

h1 {
  font-size: 2rem;
}

.form-label {
  font-weight: bold;
}

.form-control {
  height: calc(2.5em + 0.75rem + 2px);
  font-size: 1rem;
  padding: 0.375rem 0.75rem;
}

.content-box {
  height: auto;
  font-size: 1rem;
  padding: 0.75rem;
}

.btn {
  font-size: 1rem;
  padding: 0.5rem 1.5rem;
}

.form-width {
  width: 70%;
}
</style>
