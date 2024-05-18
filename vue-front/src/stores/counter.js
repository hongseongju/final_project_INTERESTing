import { ref, computed } from 'vue';
import { defineStore } from 'pinia';
import axios from 'axios';
import { useRouter } from 'vue-router'

const API_URL = 'http://localhost:8000/dj-rest-auth/';

export const useAuthStore = defineStore('auth', () => {
  const user = ref(null);
  const token = ref(null);
  const router = useRouter()

  const signup = (payload) => {
    const { username, password1, password2, email, nickname } = payload;
    return axios.post(`${API_URL}registration/`, {
      username, password1, password2, email, nickname
    })
    .then(response => {
      console.log('회원가입 성공!');
      const password = password1
      login({ username, password })
    })
    .catch(error => {
      console.error(error);
    });
  };

  const login = (payload) => {
    const { username, password } = payload;
    return axios.post(`${API_URL}login/`, {
      username, password
    })
    .then(response => {
      // 응답 데이터의 구조 확인 및 설정
      if (response.data.key) {  // Assuming the token is in 'key'
        user.value = { username: username };  // Set user details appropriately
        token.value = response.data.key;
        console.log('로그인 성공!');
        router.push({ name: 'Home' })
        setAuthHeaders();
  

      } else {
        console.error('로그인 응답에 토큰이 없습니다.');
      }
    })
    .catch(error => {
      console.error('Login failed:', error.response ? error.response.data : error.message);
    });
  };

  const logout = () => {
    return axios.post(`${API_URL}logout/`)
    .then(() => {
      user.value = null;
      token.value = null;
      setAuthHeaders();
    })
    .catch(error => {
      console.error(error);
    });
  };

  const fetchUserDetails = () => {
    return axios.get(`${API_URL}user/`)
    .then(response => {
      user.value = response.data;
      console.log(response.data)
    })
    .catch(error => {
      console.error(error);
    });
  };

  // const changePassword = (oldPassword, newPassword) => {
  //   return axios.post(`${API_URL}password/change/`, {
  //     old_password: oldPassword,
  //     new_password1: newPassword,
  //     new_password2: newPassword
  //   })
  //   .then(() => {
  //     // 필요한 추가 작업
  //   })
  //   .catch(error => {
  //     console.error(error);
  //   });
  // };

  // const resetPassword = (email) => {
  //   return axios.post(`${API_URL}password/reset/`, { email })
  //   .then(() => {
  //     // 필요한 추가 작업
  //   })
  //   .catch(error => {
  //     console.error(error);
  //   });
  // };

  // const resetPasswordConfirm = (uid, token, newPassword) => {
  //   return axios.post(`${API_URL}password/reset/confirm/`, {
  //     uid, token, new_password1: newPassword, new_password2: newPassword
  //   })
  //   .then(() => {
  //     // 필요한 추가 작업
  //   })
  //   .catch(error => {
  //     console.error(error);
  //   });
  // };

  const getArticles = () => {
    return axios.get(`${API_URL}api/v1/articles/`, {
      headers: {
        Authorization: `Token ${token.value}`
      }
    })
    .then(response => {
      // articles 상태 관리
    })
    .catch(error => {
      console.error(error);
    });
  };


  const isLogin = computed(() => {
    return token.value !== null;
  });

  const setAuthHeaders = () => {
    if (token.value) {
      axios.defaults.headers.common['Authorization'] = `Token ${token.value}`;
    } else {
      delete axios.defaults.headers.common['Authorization'];
    }
  };

  return { user, token, signup, login, logout, fetchUserDetails, getArticles, isLogin };
}, { persist: true });
