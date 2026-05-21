import axios from 'axios'

export default {
  getBestPrices(userId) {
    return axios.get('/api/station/lowest-prices', { params: { userId } })
  },
  getStations(userId) {
    return axios.get('/api/station/option', { params: { userId } })
  },
  getStationLocations(userId) {
    return axios.get('/api/station/location', { params: { userId } })
  },
  getStationDetail(stationId, userId) {
    return axios.get('/api/station', { params: { stationId, userId } })
  },
  addFavorite(stationId, userId) {
    return axios.post('/api/station/favorite', null,  { params: {stationId, userId}})
  },
  deleteFavorite(stationId, userId) {
    return axios.delete('/api/station/favorite', { params: {stationId, userId}})
  },
  findNearbyStations(stationID,searchRadius,userId){

  }
}
