<template>
  <div class="container-fluid">
    <div class="text-center"><h1>Kaardilt leiad mugavalt lähima tankla</h1></div>
    <MapComponent />
  </div>
</template>

<script>
import MapComponent from '@/components/MapComponent.vue'

export default {
  name: 'MapView',
  components: { MapComponent },
}
</script>

<style scoped></style>