<template>
  <div class="container mt-5 d-flex flex-column align-items-center">
    <div class="text-center mb-4">
      <h1>개인정보 수정</h1>
    </div>
    <div class="card w-100" style="max-width: 400px;">
      <form class="p-4">
        <!-- 닉네임 변경 폼 -->
        <div class="form-section">
          <div class="form-group mb-4 position-relative">
            <label for="nickname" class="visually-hidden">새 닉네임</label>
            <i class="bi bi-person-circle input-icon"></i>
            <input type="text" class="form-control underline" v-model="newNickname" id="nickname" placeholder="새 닉네임" />
          </div>
          <button @click="changeUserNickname" type="button" class="btn btn-custom w-100 custom-btn mb-4">닉네임 변경</button>
        </div>

        <!-- 비밀번호 변경 폼 -->
        <div class="form-section">
          <h3 class="text-center mb-4">&nbsp;</h3>
          <div class="form-group mb-4 position-relative">
            <label for="oldPassword" class="visually-hidden">현재 비밀번호</label>
            <i class="bi bi-lock input-icon"></i>
            <input type="password" class="form-control underline" v-model="oldPassword" id="oldPassword" placeholder="현재 비밀번호" />
          </div>
          <div class="form-group mb-4 position-relative">
            <label for="newPassword" class="visually-hidden">새 비밀번호</label>
            <i class="bi bi-lock input-icon"></i>
            <input type="password" class="form-control underline" v-model="newPassword" id="newPassword" placeholder="새 비밀번호" />
          </div>
          <button @click="changeUserPassword" type="button" class="btn btn-custom w-100 custom-btn mb-4">비밀번호 변경</button>
        </div>
            <router-link class="nav-link" :to="{ name: 'Profile' }">
          <p>프로필로 돌아가기</p>
        </router-link>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { useAuthStore } from '@/stores/counter';
import router from '@/router';

const authStore = useAuthStore();
const user = computed(() => authStore.user);

const newNickname = ref('');
const oldPassword = ref('');
const newPassword = ref('');

const changeUserNickname = () => {
  authStore.changeNickname(newNickname.value)
    .then(() => {
      alert('닉네임이 변경되었습니다.');
      newNickname.value = '';
      authStore.fetchUserDetails();
      router.push({name:'Profile'})
    })
    .catch(error => {
      console.error('닉네임 변경 실패:', error);
      alert('닉네임 변경에 실패했습니다.');
    });
};

const changeUserPassword = () => {
  authStore.changePassword(oldPassword.value, newPassword.value)
    .then(() => {
      alert('비밀번호가 변경되었습니다.');
      oldPassword.value = '';
      newPassword.value = '';
      router.push({name:'Profile'})
    })
    .catch(error => {
      console.error('비밀번호 변경 실패:', error);
      alert('비밀번호 변경에 실패했습니다.');
    });
};

onMounted(() => {
  authStore.fetchUserDetails();
});
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

h4, h3 {
  font-weight: bold;
}

.form-group {
  position: relative;
}

.form-control {
  height: 50px;
  padding-left: 2.5rem;
  border: none;
  border-bottom: 2px solid #ced4da;
  border-radius: 0;
  box-shadow: none;
}

.form-control::placeholder {
  color: #6c757d;
}

.form-control:focus {
  outline: none;
  border-bottom: 2px solid black;
}

.input-icon {
  position: absolute;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  font-size: 1.25rem;
  padding-left: 0.5rem;
  color: #6c757d;
}

.custom-btn {
  height: 50px;
  font-size: 1.25rem;
}

input::placeholder {
  color: #ced4da;
  font-weight: 400;
}

button {
  background-color: #6c757d;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 10px;
  transition: background-color 0.3s ease, color 0.3s ease;
}

button:hover {
  background-color: #5a6268;
  color: white;
}

button:active {
  background-color: #A6BC09 !important;
  color: white !important;
}
.nav-link {
  text-align: right;
  color: #777;
  text-decoration: none; /* 링크 밑줄 제거 */
}
</style>
