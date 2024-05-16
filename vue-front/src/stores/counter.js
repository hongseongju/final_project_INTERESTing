import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'
import { useRouter } from 'vue-router'

const API_URL = 'http://localhost:8000/dj-rest-auth/'

export const useAuthStore = defineStore('auth', () => {
  const user = ref(null)
  const token = ref(null)

  const signup = function(payload){
    const {username, password1, password2, email, nickname} = payload

    axios({
      method: 'post',
      url: `${API_URL}registration/`,
      data:{
        username, password1, password2, email, nickname
      }
    })
      .then((response) =>{
        console.log('회원가입 성공!')
      })
      .catch(err => console.log(err))
  }
  const login = (username, password) => {
    axios.post(`${API_URL}login/`, {
      username,
      password
    })
    .then(response => {
      user.value = response.data.user
      token.value = response.data.token
      setAuthHeaders()
    })
    .catch(error => {
      console.error(error)
    })
  }

  const logout = () => {
    axios.post(`${API_URL}logout/`)
    .then(() => {
      user.value = null
      token.value = null
      setAuthHeaders()
    })
    .catch(error => {
      console.error(error)
      // 오류 처리
    })
  }

  const fetchUserDetails = () => {
    axios.get(`${API_URL}user/`)
    .then(response => {
      user.value = response.data
    })
    .catch(error => {
      console.error(error)
      // 오류 처리
    })
  }

  const changePassword = (oldPassword, newPassword) => {
    axios.post(`${API_URL}password/change/`, {
      old_password: oldPassword,
      new_password1: newPassword,
      new_password2: newPassword
    })
    .then(() => {
      // 필요한 추가 작업
    })
    .catch(error => {
      console.error(error)
      // 오류 처리
    })
  }

  const resetPassword = (email) => {
    axios.post(`${API_URL}password/reset/`, {
      email
    })
    .then(() => {
      // 필요한 추가 작업
    })
    .catch(error => {
      console.error(error)
      // 오류 처리
    })
  }

  const resetPasswordConfirm = (uid, token, newPassword) => {
    axios.post(`${API_URL}password/reset/confirm/`, {
      uid,
      token,
      new_password1: newPassword,
      new_password2: newPassword
    })
    .then(() => {
      // 필요한 추가 작업
    })
    .catch(error => {
      console.error(error)
      // 오류 처리
    })
  }

  const getArticles = () => {
    axios({
      method: 'get',
      url: `${API_URL}api/v1/articles/`,
      headers: {
        Authorization: `Token ${token.value}`
      }
    })
    .then(response => {
      // articles 상태 관리
      articles.value = response.data
    })
    .catch(error => {
      console.log(error)
      // 오류 처리
    })
  }

  return { user, token, signup, login, logout, fetchUserDetails, changePassword, resetPassword, resetPasswordConfirm, getArticles }
})