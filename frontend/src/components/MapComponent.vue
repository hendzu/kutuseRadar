<template>
  <div ref="mapContainer" style="height: 500px"></div>
</template>

<style scoped></style>
<script setup>
import { onMounted, ref } from 'vue'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
import markerIcon from 'leaflet/dist/images/marker-icon.png'
import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png'
import markerShadow from 'leaflet/dist/images/marker-shadow.png'
import StationService from '@/api-services/StationService.js'
import NavigationService from '@/navigation/NavigationService.js'

const mapContainer = ref(null)

onMounted(() => {
  // Leaflet markeripiltide Vite fix
  delete L.Icon.Default.prototype._getIconUrl
  L.Icon.Default.mergeOptions({
    iconUrl: markerIcon,
    iconRetinaUrl: markerIcon2x,
    shadowUrl: markerShadow,
  })

  // Kaardi ja kaardikihi loomine
  const map = L.map(mapContainer.value).setView([58.5953, 25.0136], 7)
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map)

  const userId = localStorage.getItem('userId')
  const favoriteState = {}

  // Globaalsed funktsioonid Leaflet popup nuppude jaoks (töötavad väljaspool Vue-d)
  window.goToStation = (id) => NavigationService.navigateToStationView(id)
  window.goToAddPrice = (id) => NavigationService.navigateToAddPriceView(id)
  window.toggleFavorite = (id) => {
    const isFav = favoriteState[id]
    const call = isFav
      ? StationService.deleteFavorite(id, userId)
      : StationService.addFavorite(id, userId)
    call.then(() => {
      favoriteState[id] = !isFav
      document.getElementById('star-' + id).textContent = favoriteState[id] ? '★' : '☆'
    })
  }

  // 1) Toob kõik jaamad koordinaatidega
  StationService.getStationLocations(userId)
    .then((response) => {
      // 2) Tsükkel: iga jaama kohta lisatakse kaardile üks marker
      response.data.forEach((station) => {
        favoriteState[station.stationId] = station.isInFavorites
        const marker = L.marker([station.stationLat, station.stationLong]).addTo(map)
        marker.bindTooltip(station.stationName)

        // 3) Markeri klikk: toob jaama detailid
        marker.on('click', () => {
          StationService.getStationDetail(station.stationId, userId)
            .then((response) => {
              // 4) Ehitab popup sisu ja avab selle markeri peal
              const logo = ''
              const favorite = favoriteState[station.stationId] ? '★' : '☆'
              const star = userId
                ? `<span id="star-${station.stationId}" onclick="window.toggleFavorite(${station.stationId})" style="cursor:pointer;font-size:18px">${favorite}</span>`
                : ''
              const html = `
                ${logo}
                <strong>${response.data.stationName}</strong>
                ${star}<br>
                <button onclick="window.goToAddPrice(${station.stationId})">Lisa hetke hind</button>
                <button onclick="window.goToStation(${station.stationId})">Vaata tanklat</button>
              `
              marker.bindPopup(html).openPopup()
              // 4) lõpp
            })
            .catch(() => NavigationService.navigateToErrorView())
        })
        // 3) lõpp
      })
      // 2) tsükkel lõpp
    })
    .catch(() => NavigationService.navigateToErrorView())
  // 1) lõpp
})
</script>
