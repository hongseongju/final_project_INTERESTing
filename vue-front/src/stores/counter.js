import { ref } from 'vue';
import { defineStore } from 'pinia';
import axios from 'axios';

const API_URL = 'http://localhost:8000/dj-rest-auth/';

export const useAuthStore = defineStore('auth', () => {
  const user = ref(null);
  const token = ref(null);

  const signup = async (payload) => {
    const { username, password1, password2, email, nickname } = payload;
    try {
      const response = await axios.post(`${API_URL}registration/`, {
        username, password1, password2, email, nickname
      });
      console.log('회원가입 성공!');
    } catch (error) {
      console.error(error);
    }
  };

  const login = async (payload) => {
    const { username, password } = payload;
    try {
      const response = await axios.post(`${API_URL}login/`, {
        username, password
      });
      user.value = response.data.user;
      token.value = response.data.token;
      setAuthHeaders();
    } catch (error) {
      console.error('Login failed:', error.response ? error.response.data : error.message);
    }
  };

  const logout = async () => {
    try {
      await axios.post(`${API_URL}logout/`);
      user.value = null;
      token.value = null;
      setAuthHeaders();
    } catch (error) {
      console.error(error);
    }
  };

  const fetchUserDetails = async () => {
    try {
      const response = await axios.get(`${API_URL}user/`);
      user.value = response.data;
    } catch (error) {
      console.error(error);
    }
  };

  const changePassword = async (oldPassword, newPassword) => {
    try {
      await axios.post(`${API_URL}password/change/`, {
        old_password: oldPassword,
        new_password1: newPassword,
        new_password2: newPassword
      });
    } catch (error) {
      console.error(error);
    }
  };

  const resetPassword = async (email) => {
    try {
      await axios.post(`${API_URL}password/reset/`, { email });
    } catch (error) {
      console.error(error);
    }
  };

  const resetPasswordConfirm = async (uid, token, newPassword) => {
    try {
      await axios.post(`${API_URL}password/reset/confirm/`, {
        uid, token, new_password1: newPassword, new_password2: newPassword
      });
    } catch (error) {
      console.error(error);
    }
  };

  const getArticles = async () => {
    try {
      const response = await axios.get(`${API_URL}api/v1/articles/`, {
        headers: {
          Authorization: `Token ${token.value}`
        }
      });
      // articles 상태 관리
    } catch (error) {
      console.error(error);
    }
  };

  const setAuthHeaders = () => {
    if (token.value) {
      axios.defaults.headers.common['Authorization'] = `Token ${token.value}`;
    } else {
      delete axios.defaults.headers.common['Authorization'];
    }
  };

  return { user, token, signup, login, logout, fetchUserDetails, changePassword, resetPassword, resetPasswordConfirm, getArticles };
});
