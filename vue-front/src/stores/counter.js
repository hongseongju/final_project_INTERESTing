import { ref, computed } from 'vue';
import { defineStore } from 'pinia';
import axios from 'axios';
import { useRouter } from 'vue-router';

const API_URL = 'http://localhost:8000/';

export const useAuthStore = defineStore('auth', () => {
  const user = ref(null);
  const token = ref(null);
  const articles = ref([]);
  const comments = ref([]);
  const router = useRouter();

  const signup = (payload) => {
    const { username, password1, password2, email, nickname } = payload;
    return axios.post(`${API_URL}dj-rest-auth/registration/`, {
      username, password1, password2, email, nickname
    })
    .then(response => {
      console.log('회원가입 성공!');
      const password = password1;
      login({ username, password });
    })
    .catch(error => {
      console.error(error);
    });
  };

  const login = (payload) => {
    const { username, password } = payload;
    return axios.post(`${API_URL}dj-rest-auth/login/`, {
      username, password
    })
    .then(response => {
      if (response.data.key) {
        token.value = response.data.key;
        console.log('로그인 성공!');
        setAuthHeaders();
        fetchUserDetails().then(() => {
          router.push({ name: 'Home' });
        });
      } else {
        console.error('로그인 응답에 토큰이 없습니다.');
      }
    })
    .catch(error => {
      console.error('Login failed:', error.response ? error.response.data : error.message);
    });
  };

  const logout = () => {
    return axios.post(`${API_URL}dj-rest-auth/logout/`)
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
    setAuthHeaders()
    return axios.get(`${API_URL}accounts/user/`)
    .then(response => {
      user.value = response.data;
      console.log('사용자 정보:', response.data);
    })
    .catch(error => {
      console.error(error);
    });
  };

  const changePassword = (oldPassword, newPassword) => {
    return axios.post(`${API_URL}dj-rest-auth/password/change/`, {
      old_password: oldPassword,
      new_password1: newPassword,
      new_password2: newPassword
    })
    .then(() => {
      console.log('비밀번호 변경 성공!');
    })
    .catch(error => {
      console.error('비밀번호 변경 실패:', error.response ? error.response.data : error.message);
    });
  };

  const changeNickname = (newNickname) => {
    return axios.put(`${API_URL}accounts/change-nickname/`, {
      nickname: newNickname
    })
    .then(() => {
      console.log('닉네임 변경 성공!');
      fetchUserDetails();  // 변경된 닉네임을 즉시 반영하기 위해 사용자 정보를 다시 가져옵니다.
    })
    .catch(error => {
      console.error('닉네임 변경 실패:', error.response ? error.response.data : error.message);
    });
  };

  const resetPassword = (email) => {
    return axios.post(`${API_URL}dj-rest-auth/password/reset/`, { email })
    .then(() => {
      console.log('비밀번호 초기화 이메일 전송 성공!');
    })
    .catch(error => {
      console.error(error);
    });
  };

  const resetPasswordConfirm = (uid, token, newPassword) => {
    return axios.post(`${API_URL}dj-rest-auth/password/reset/confirm/`, {
      uid, token, new_password1: newPassword, new_password2: newPassword
    })
    .then(() => {
      console.log('비밀번호 초기화 성공!');
    })
    .catch(error => {
      console.error(error);
    });
  };

  const fetchArticles = () => {
    return axios.get(`${API_URL}articles/`)
    .then(response => {
      articles.value = response.data;
    })
    .catch(error => {
      console.error(error);
    });
  };

  const fetchArticle = (articleId) => {
    return axios.get(`${API_URL}articles/${articleId}/`)
    .then(response => {
      return response.data;
    })
    .catch(error => {
      console.error(error);
    });
  };

  const createArticle = (articleData) => {
    return axios.post(`${API_URL}articles/`, articleData)
    .then(response => {
      articles.value.push(response.data);
    })
    .catch(error => {
      console.error(error);
    });
  };

  const updateArticle = (articleId, articleData) => {
    return axios.put(`${API_URL}articles/${articleId}/`, articleData)
    .then(response => {
      const index = articles.value.findIndex(article => article.id === articleId);
      if (index !== -1) {
        articles.value[index] = response.data;
      }
    })
    .catch(error => {
      console.error(error);
    });
  };

  const deleteArticle = (articleId) => {
    return axios.delete(`${API_URL}articles/${articleId}/`)
    .then(() => {
      articles.value = articles.value.filter(article => article.id !== articleId);
    })
    .catch(error => {
      console.error(error);
    });
  };

  const fetchComments = (articleId) => {
    return axios.get(`${API_URL}articles/${articleId}/comments/`)
    .then(response => {
      comments.value = response.data;
    })
    .catch(error => {
      console.error(error);
    });
  };

  const createComment = (articleId, commentData) => {
    return axios.post(`${API_URL}articles/${articleId}/comments/`, commentData)
    .then(response => {
      comments.value.push(response.data);
    })
    .catch(error => {
      console.error(error);
    });
  };

  const updateComment = (commentId, commentData) => {
    return axios.put(`${API_URL}comments/${commentId}/`, commentData)
    .then(response => {
      const index = comments.value.findIndex(comment => comment.id === commentId);
      if (index !== -1) {
        comments.value[index] = response.data;
      }
    })
    .catch(error => {
      console.error(error);
    });
  };

  const deleteComment = (commentId) => {
    return axios.delete(`${API_URL}comments/${commentId}/`)
    .then(() => {
      comments.value = comments.value.filter(comment => comment.id !== commentId);
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

  return { 
    user, 
    token, 
    articles, 
    comments, 
    signup, 
    login, 
    logout, 
    fetchUserDetails, 
    changePassword, 
    changeNickname, 
    resetPassword, 
    resetPasswordConfirm, 
    fetchArticles, 
    fetchArticle, 
    createArticle, 
    updateArticle, 
    deleteArticle, 
    fetchComments, 
    createComment, 
    updateComment, 
    deleteComment, 
    isLogin 
  };
}, { persist: true });
