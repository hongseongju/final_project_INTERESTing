<template>
    <div>
      <h1>개인정보 수정</h1>
      <div v-if="user">
        <!-- 닉네임 변경 폼 -->
        <div>
          <h3>닉네임 변경</h3>
          <input v-model="newNickname" placeholder="새 닉네임">
          <button @click="changeUserNickname">닉네임 변경</button>
        </div>
  
        <!-- 비밀번호 변경 폼 -->
        <div>
          <h3>비밀번호 변경</h3>
          <input type="password" v-model="oldPassword" placeholder="현재 비밀번호">
          <input type="password" v-model="newPassword" placeholder="새 비밀번호">
          <button @click="changeUserPassword">비밀번호 변경</button>
        </div>
  
        <router-link :to="{ name: 'Profile' }">
          <button>프로필로 돌아가기</button>
        </router-link>
      </div>
      <div v-else>
        <p>사용자 정보가 없습니다.</p>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, computed, onMounted } from 'vue';
  import { useAuthStore } from '@/stores/counter';
  
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
  /* 추가적인 스타일 정의 가능 */
  </style>
  