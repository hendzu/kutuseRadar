<template>
  <div class="container mt-5">
    <h1 class="text-center">Lisa hind</h1>

    <div class="row justify-content-center mt-3">
      <div class="col col-8">
        <AlertError :error-message="errorMessage" />
      </div>
    </div>
    <div class="row justify-content-center mt-3">
      <div class="col col-8">
        <AlertSuccess :success-message="successMessage" />
      </div>
    </div>
    <div class="row justify-content-center mt-3">
      <div class="col col-2">
        <span>Tankla nimi</span>
      </div>
      <div class="col col-6">
        <StationSelect
          :selected-station="newPrice.stationId"
          :stations="stations"
          @event-selected-station-changed="newPrice.stationId = $event"
        />
      </div>
    </div>
    <div class="row justify-content-center mt-2">
      <div class="col col-2">
        <span>Kütuse liik</span>
      </div>

      <div class="col col-6">
        <FuelSelect
          :selected-fuel="newPrice.fuelId"
          :fuels="fuels"
          @event-selected-fuel-changed="newPrice.fuelId = $event"
        />
      </div>
    </div>
    <div class="row justify-content-center mt-2">
      <div class="col col-2">
        <span>Hind tanklas</span>
      </div>
      <div class="col col-6">
        <input
          type="number"
          class="form-control"
          placeholder="0.000"
          step="0.001"
          v-model="newPrice.price"
          @blur="formatPrice"
          min="0"
        />
      </div>
    </div>
    <div class="row justify-content-center mt-3">
      <div class="col col-4">
        <button @click="addPrice" class="btn btn-primary w-100">Lisa hind</button>
      </div>
    </div>
  </div>
</template>

<script>
import AuthService from '@/auth/AuthService.js'
import NavigationService from '@/navigation/NavigationService.js'
import StationService from '@/api-services/StationService.js'
import StationSelect from '@/components/StationSelect.vue'
import FuelSelect from '@/components/FuelSelect.vue'
import FuelService from '@/api-services/FuelService.js'
import AlertError from '@/components/alerts/AlertError.vue'
import AlertSuccess from '@/components/alerts/AlertSuccess.vue'

export default {
  name: 'AddPriceView',
  components: { AlertSuccess, AlertError, StationSelect, FuelSelect },

  data() {
    return {
      errorMessage: '',
      successMessage: '',
      newPrice: {
        userId: 0,
        stationId: 0,
        fuelId: 0,
        price: 0,
      },
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
  methods: {
    getStations() {
      StationService.getStations(localStorage.getItem('userId'))
        .then((response) => this.handleGetStationsResponse(response.data))
        .catch(() => NavigationService.navigateToErrorView())
        .finally(() => this.checkPathForStation())
    },
    getFuelTypes() {
      FuelService.getFuelTypes()
        .then((response) => this.handleGetFuelTypesResponse(response.data))
        .catch(() => NavigationService.navigateToErrorView())
        .finally()
    },
    checkPathForStation() {
      if (this.$route.params.stationId) {
        this.newPrice.stationId = this.$route.params.stationId
      }
    },
    handleGetStationsResponse(data) {
      this.stations = data.sort((a, b) => b.favorite - a.favorite)
    },
    handleGetFuelTypesResponse(data) {
      this.fuels = data
    },
    formatPrice() {
      if (this.price !== '') {
        this.price = parseFloat(this.price).toFixed(3)
      }
    },
    addPrice() {
      this.errorMessage = ''
      this.successMessage = ''
      let errorMessages = this.validateFormCorrectInput()
      this.errorMessage = errorMessages.toString().replaceAll(',', '; \n')
      if (this.errorMessage === '') {
        this.newPrice.userId = Number(localStorage.getItem('userId'))
        FuelService.postNewFuelPrice(this.newPrice)
          .then((response) => (this.successMessage = response.data.message))
          .catch((error) => this.handlePostNewPriceError(error))
          .finally()
      }
    },
    validateFormCorrectInput() {
      let errorMessages = []
      if (this.newPrice.stationId === 0) {
        errorMessages.push('Vali tankla')
      }
      if (this.newPrice.fuelId === 0) {
        errorMessages.push('Vali kütuse tüüp')
      }
      if (this.newPrice.price < 0 || this.newPrice.price >= 10) {
        errorMessages.push('Hinna sisend ebasobilik')
      }
      return errorMessages
    },
    handlePostNewPriceError(error) {
      this.errorResponse = error.response.data
      const statusCode = error.response.status
      if (statusCode === 404 && this.errorResponse.errorCode === 103) {
        this.errorMessage = this.errorResponse.message
      } else {
        NavigationService.navigateToErrorView()
      }
      return undefined
    },
  },

  beforeMount() {
    if (!AuthService.isLoggedIn()) {
      NavigationService.navigateToNotAuthorizedView()
    }
    this.getStations()
    this.getFuelTypes()
  },
}
</script>
