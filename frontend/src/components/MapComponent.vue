<template>
  <div ref="mapContainer" style="height: 500px"></div>
</template>

<style scoped></style>
<script setup>
import { onMounted, ref } from 'vue'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
const mapContainer = ref(null)

onMounted(() => {
  const map = L.map(mapContainer.value).setView([58.5953, 25.0136], 7)
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map)
})
</script>
