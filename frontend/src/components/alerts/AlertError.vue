<script>
export default {
  name: 'AlertError',
  props: {
    errorMessage: String,
  },
}
</script>

<template>
  <div v-if="errorMessage" class="alert alert-danger" role="alert">
    {{ errorMessage}}
  </div>
</template>
