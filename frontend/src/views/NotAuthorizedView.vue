<script>
import navigationService from '@/navigation/NavigationService.js'
import ligipaasPuudub from '@/components/8467_Ligipaas_puudub_silt.png'

export default {
  name: 'NotAuthorizedView',
  data() {
    return { ligipaasPuudub }
  },
  methods: {
    goToLogin() {
      navigationService.navigateToLoginView()
    },
  },
}
</script>

<template>
  <div class="text-center mt-5">
    <img :src="ligipaasPuudub" alt="Ligipääs puudub" />
    Ehk aitab sisselogimine?
    <button type="button" class="btn btn-info" @click="goToLogin">Logi sisse</button>
  </div>
</template>

<style scoped></style>
