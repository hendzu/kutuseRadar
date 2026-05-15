<template>
  <div class="container mt-5">
    <h1 class="mt-5 text-center">Praegused odavamaid hinnad</h1>
    <div class="row justify-content-center">
      <div v-for="item in bestPrices" :key="item.stationId" class="col-auto">
        <div class="card p-3" style="width: 9rem">
          <div class="border rounded p-2 text-center mb-2">
            <span>{{ item.fuelName }}</span>
          </div>
          <p class="text-primary mb-1">{{ item.price }} €/l</p>
          <p class="text-primary"><i class="bi bi-geo-alt"></i> {{ item.stationName }}</p>
        </div>
      </div>
    </div>
    <h2 class="text-center mt-5">Otsi tanklat</h2>
    <div class="row justify-content-center mt-3">
      <div class="col-6">
        <Multiselect
          v-model="selectedStation"
          :options="stations"
          label="stationName"
          value-prop="stationId"
          placeholder="Otsi tanklat..."
          :searchable="true"
        />
      </div>
    </div>
  </div>
</template>

<script>
import stationService from '@/api-services/StationService.js'
import Multiselect from '@vueform/multiselect'
import '@vueform/multiselect/themes/default.css'

export default {
  components: { Multiselect },
  data() {
    return {
      bestPrices: [
        {
          stationId: 0,
          stationName: '',
          fuelName: '',
          price: 0,
        },
      ],
      stations: [],
      selectedStation: null,
      userId: localStorage.getItem('userId'),
    }
  },
  mounted() {
    stationService.getBestPrices(this.userId).then((response) => {
      this.bestPrices = response.data
    })
  },
}
</script>
