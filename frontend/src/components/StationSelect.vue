<script>
import Multiselect from '@vueform/multiselect'

export default {
  name: 'StationSelect',
  components: { Multiselect },
  props: {
    selectedStation: {},
    stations: {},
  },
  emits: ['event-selected-station-changed'],
}
</script>

<template>
  <Multiselect
    @select="$emit('event-selected-station-changed', $event)"
    :value="selectedStation"
    :options="stations"
    label="stationName"
    value-prop="stationId"
    placeholder="Otsi tanklat..."
    :searchable="true"
  >
    <template #option="{ option }">
      <span :class="{ 'text-warning fw-bold': option.favorite }">
        {{ option.stationName }}
      </span>
    </template>
  </Multiselect>
</template>
