import axios from 'axios'

export default {
  sendPostRegisterRequest(username, password) {
    return axios.post('/api/register', null, {
      params: { username, password },
    })
  },
}
