<script>
import Multiselect from '@vueform/multiselect'
export default {
  name: 'FuelSelect',
  components: { Multiselect },
  props: {
    selectedFuel: {},
    fuels: {},
  },
  emits: ['event-selected-fuel-changed'],
}
</script>

<template>
  <Multiselect
    @select="$emit('event-selected-fuel-changed', $event)"
    :value="selectedFuel"
    :options="fuels"
    label="fuelName"
    value-prop="fuelId"
    placeholder="Vali kütus"
    :searchable="true"
  >
    <template #option="{ option }">
      <span>
        {{ option.fuelName }}
      </span>
    </template>
  </Multiselect>
</template>
