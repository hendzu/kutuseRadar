import axios from 'axios'

export default {
  getUserMemberships(userId) {
    return axios.get('/api/memberships/user', { params: { userId } })
  },

  getChains() {
    return axios.get('/api/chains')
  },

  getMembershipOptions(chainId) {
    return axios.get('/api/memberships', { params: { chainId } })
  },

  addUserMembership(userMembershipDto) {
    return axios.post('/api/memberships/user', userMembershipDto)
  },

  updateUserMembership(userMembershipDto) {
    return axios.put('/api/memberships/user', userMembershipDto)
  },

  deleteUserMembership(userMembershipId) {
    return axios.delete('/api/memberships/user', { params: { userMembershipId } })
  },
}
