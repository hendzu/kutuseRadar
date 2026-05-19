<script>
export default {
  name: 'StationDropdown',
  props: {
    selectedStationId: Number,
    stations: {},
  },
}
</script>

<template>
  <select
    class="form-select form-select"
    :value="selectedStationId"
    aria-label="Default select example"
    aria-placeholder="Tankla"
    id="tanklaValik"
  >
    <option :disabled="true" :value=0>--Vali tankla--</option>
    <option v-for="station in stations" :key="station.stationId" :value="station.stationId">
      {{ station.stationName }}
    </option>
  </select>
</template>
