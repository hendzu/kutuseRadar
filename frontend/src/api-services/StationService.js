import axios from 'axios'

export default {
  getBestPrices(userId) {
    return axios.get('/api/station/lowest-prices', { params: { userId } })
  },
}
