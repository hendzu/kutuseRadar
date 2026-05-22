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
          <div class="col-3">
            <label for="distance">Kaugus</label>
          </div>
          <div class="col-2">
            <input
              @change="getNearbyStations"
              v-model="radius"
              type="number"
              class="form-control form-control-sm"
              id="distance"
              min="0"
            />
          </div>
          <div class="col-2">
            <span>km</span>
          </div>
        </div>
        <div class="row">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Tanklad</th>
                <th scope="col">Hind €/l</th>
                <th scope="col">Δ</th>
                <th scope="col">Kaugus km</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="station in nearby" :key="station.id">
                <th scope="row" @click="navigationService.navigateToStationView(station.id)">
                  {{ station.name }}
                </th>
                <td>
                  {{ station.fuels.find((sf) => sf.fuelName === fuelName)?.price }}
                </td>
                <td>
                  {{
                    (
                      stationDetail.fuels.find((df) => df.fuelName === fuelName)?.price -
                      station.fuels.find((sf) => sf.fuelName === fuelName)?.price
                    )?.toFixed(3)
                  }}
                </td>
                <td>{{ station.distance.toFixed(3) }}</td>
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
import stationService from '@/api-services/StationService.js'
import NavigationService from '@/navigation/NavigationService.js'
import FuelSelect from '@/components/FuelSelect.vue'
import FuelService from '@/api-services/FuelService.js'
import AuthService from '@/auth/AuthService.js'
import navigationService from "@/navigation/NavigationService.js";

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
      nearby: [
        {
          id: 0,
          name: '',
          distance: 0,
          fuels: [
            {
              fuelName: 'string',
              price: 0,
            },
          ],
        },
      ],
      stationId: 0,
      fuelId: 1,
      fuelName: '',
      radius: 0,
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
    navigationService() {
      return navigationService
    },
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
      this.getFuelName()
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
    getNearbyStations() {
      console.log(this.stationId)
      StationService.findNearbyStations(this.stationId, this.radius, localStorage.getItem('userId'))
        .then((response) => (this.nearby = response.data))
        .catch(() => NavigationService.navigateToErrorView())
        .finally()
    },
    getFuelName() {
      this.fuelName = this.fuels.find((f) => f.fuelId === this.fuelId)?.fuelName
    },
  },
  beforeMount() {
    this.checkPathForStation()
    this.getStations()
    this.getFuelTypes()
    this.getStationDetail()
  },
  watch: {
    stationId() {
      NavigationService.navigateToStationView(this.stationId)
    },
    '$route.params.stationId'(newId) {
      this.stationId = newId
      this.getStationDetail()
      this.getNearbyStations()
    },
    fuelId() {
      this.getFuelName()
    },
  },
}
</script>
