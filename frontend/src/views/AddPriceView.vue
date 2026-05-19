<template>
  <div class="container mt-5">
    <h1 class="text-center">Lisa hind</h1>
    <div class="row justify-content-center mt-3">
      <div class="col col-2">
        <span>Tankla nimi</span>
      </div>
      <div class="col col-6">
        <StationDropdown :selected-station-id="selectedStationId" :stations="stations" />
      </div>
    </div>
    <div class="row justify-content-center mt-2">
      <div class="col col-2">
        <span>Kütuse liik</span>
      </div>
      <div class="col col-2">
        <select class="form-select" aria-label="Default select example" aria-placeholder="Tankla">
          <option selected>Vali tankla</option>
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
    </div>
    <div class="row justify-content-center mt-2">
      <div class="col col-2">
        <span>Hind tanklas</span>
      </div>
      <div class="col col-2">
        <input type="number" class="form-control" placeholder="0.00" />
      </div>
    </div>
    <div class="row justify-content-center mt-3">
      <div class="col col-4">
        <button class="btn btn-primary w-100">Lisa hind</button>
      </div>
    </div>
  </div>
</template>

<script>
import AuthService from '@/auth/AuthService.js'
import NavigationService from '@/navigation/NavigationService.js'
import StationService from '@/api-services/StationService.js'
import StationDropdown from '@/components/AddPrice/StationDropdown.vue'

export default {
  name: 'AddPriceView',
  components: { StationDropdown },

  data() {
    return {
      errorMessage: '',
      successMessage: '',
      selectedStationId: 0,
      firstOptionLabel: '-- Vali tankla --',
      firstOptionIsDisabled: false,
      stations: [
        {
          stationId: 0,
          stationName: 'string',
          favorite: true,
        },
      ],
      fuels: [
        {
          fuelId: 0,
          fuelName: 'string',
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
    checkPathForStation() {
      if (this.$route.params.stationId) {
        this.selectedStationId = this.$route.params.stationId
      }
    },
    handleGetStationsResponse(data) {
      this.stations = data.sort((a, b) => b.favorite - a.favorite)
    },
  },
  beforeMount() {
    if (!AuthService.isLoggedIn()) {
      NavigationService.navigateToNotAuthorizedView()
    }
    this.getStations()
  },
}
</script>
