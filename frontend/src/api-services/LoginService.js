import axios from 'axios'

export default {
  sendGetLoginRequest(username, password) {
    return axios.get('/api/login', {
      params: {
        username: username,
        password: password,
      },
    })
  },
}
