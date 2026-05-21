<template>
  <div class="container text-center">
    <div class="row">
      <div class="col-6">
        <div class="row">
          <StationSelect
            :selected-station="stationId"
            :stations="stations"
            @event-selected-station-changed="stationId = $event"
          />
        </div>
        <div class="row">
          <div v-if="stationId === ''" class="container">
            <h1>Vali tankla</h1>
          </div>
          <div v-else class="container">
            <div class="row">
              <h2>
                <img
                  :src="`data:image/*;base64,${stationDetail.chainLogo}`"
                  class="img-thumbnail"
                  alt=""
                />
                {{ stationDetail.stationName }}
                <span v-if="isLoggedIn">
                  <i
                    v-if="stationDetail.stationFavorite"
                    @click="removeFavorite"
                    class="bi bi-star-fill"
                  ></i>
                  <i v-else @click="addFavorite" class="bi bi-star"></i>
                </span>
              </h2>
            </div>
            <div class="row justify-content-center">
              <div v-for="item in stationDetail.fuels" :key="item.fuelName" class="col-auto">
                <div class="card p-3" style="width: 9rem">
                  <div class="border rounded p-2 text-center mb-2">
                    <span>{{ item.fuelName }}</span>
                  </div>
                  <p class="text-primary mb-1">{{ item.price }} €/l</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-6">
        <div class="row">
          <div class="col-4">
            <FuelSelect
              :selected-fuel="fuelId"
              :fuels="fuels"
              @event-selected-fuel-changed="fuelId = $event"
            />
          </div>
        </div>
        <div class="row">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Tanklad</th>
                <th scope="col">Hind €/l</th>
                <th scope="col">Δ</th>
                <th scope="col">Kaugus</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import StationSelect from '@/components/StationSelect.vue'
import StationService from '@/api-services/StationService.js'
import NavigationService from '@/navigation/NavigationService.js'
import FuelSelect from '@/components/FuelSelect.vue'
import FuelService from '@/api-services/FuelService.js'
import AuthService from '@/auth/AuthService.js'
import stationService from '@/api-services/StationService.js'

export default {
  name: 'StationView',
  components: { FuelSelect, StationSelect },
  data() {
    return {
      stationDetail: {
        stationId: Number,
        stationName: String,
        stationFavorite: Boolean,
        chainName: String,
        chainLogo: String,
        fuels: [
          {
            fuelName: String,
            price: Number,
          },
        ],
      },
      stationId: '',
      fuelId: '',
      stations: [
        {
          stationId: null,
          stationName: 'null',
          favorite: false,
        },
      ],
      fuels: [
        {
          fuelId: null,
          fuelName: null,
        },
      ],
    }
  },
  computed: {
    isLoggedIn() {
      return AuthService.isLoggedIn()
    },
  },
  methods: {
    checkPathForStation() {
      if (this.$route.params.stationId) {
        this.stationId = this.$route.params.stationId
      }
    },
    getStations() {
      StationService.getStations(localStorage.getItem('userId'))
        .then((response) => this.handleGetStationsResponse(response.data))
        .catch(() => NavigationService.navigateToErrorView())
        .finally()
    },
    handleGetStationsResponse(data) {
      this.stations = data.sort((a, b) => b.favorite - a.favorite)
    },
    handleGetFuelTypesResponse(data) {
      this.fuels = data
    },
    getFuelTypes() {
      FuelService.getFuelTypes()
        .then((response) => this.handleGetFuelTypesResponse(response.data))
        .catch(() => NavigationService.navigateToErrorView())
        .finally()
    },
    getStationDetail() {
      StationService.getStationDetail(this.stationId, localStorage.getItem('userId'))
        .then((response) => (this.stationDetail = response.data))
        .catch(() => NavigationService.navigateToErrorView())
        .finally()
    },
    addFavorite() {
      stationService.addFavorite(this.stationId, localStorage.getItem('userId'))
      this.stationDetail.stationFavorite = true
    },
    removeFavorite() {
      stationService.deleteFavorite(this.stationId, localStorage.getItem('userId'))
      this.stationDetail.stationFavorite = false
    },
    getNearbyStations(){

    }
  },
  beforeMount() {
    this.checkPathForStation()
    this.getStations()
    this.getFuelTypes()
  },
  watch: {
    stationId() {
      NavigationService.navigateToStationView(this.stationId)
      this.getStationDetail()
    },
  },
}
</script>
