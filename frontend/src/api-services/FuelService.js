import axios from 'axios'

export default {

  getFuelTypes(){
    return axios.get('/api/fuel/')
  },
  postNewFuelPrice(newPrice){
    return axios.post('/api/fuelPrice/',newPrice)
  }
}
