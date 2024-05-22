<template>
  <div class="container mt-5 d-flex flex-column align-items-center">
    <div class="text-center mb-4">
      <h3 class="text-success">INTERESTing과 <br><span class="text-warning">'흥미로운'</span> 금융 생각</h3>
    </div>
    <div class="card w-100" style="max-width: 400px;">
      <form @submit.prevent="logIn" class="p-4">
        <div class="form-group mb-4">
          <label for="username" class="visually-hidden">Username</label>
          <div class="input-group">
            <span class="input-group-text no-border-right"><i class="bi bi-person"></i></span>
            <input type="text" class="form-control no-border-left" v-model.trim="username" id="username" placeholder="Username" required />
          </div>
        </div>
        <div class="form-group mb-4">
          <label for="password" class="visually-hidden">Password</label>
          <div class="input-group">
            <span class="input-group-text no-border-right"><i class="bi bi-lock"></i></span>
            <input type="password" class="form-control no-border-left" v-model.trim="password" id="password" placeholder="Password" required />
          </div>
        </div>
        <button type="submit" class="btn btn-success w-100 custom-btn">Log In</button>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useAuthStore } from '@/stores/counter';

const username = ref('');
const password = ref('');
const authStore = useAuthStore();

const logIn = () => {
  authStore.login({ username: username.value, password: password.value });
};
</script>

<style scoped>
.container {
  max-width: 400px;
  margin-top: 5rem;
}

.text-success {
  font-weight: bold;
}

.card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

.input-group-text {
  cursor: pointer;
  border-right: 0;
  height: 50px;
  display: flex;
  align-items: center;
  background-color: white;
}

.form-control {
  border-left: 0;
  height: 50px;
}

.input-group-text.no-border-right {
  border-right: 0;
  background-color: white;
}

.form-control.no-border-left {
  border-left: 0;
}

.custom-btn {
  height: 45px;
  font-size: 1.25rem;
}
</style>
