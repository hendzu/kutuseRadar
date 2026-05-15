<script>
import navigationService from '@/navigation/NavigationService.js'

export default {
  name: 'ErrorView',

  methods: {
    goToHome(){
      navigationService.navigateToHomeView()

    }
  }
}
</script>

<template>
  <div class="text-center mt-5">
    <h2>Midagi läks valesti</h2>
<p>Protsessi käigus tekkis  ootamatu viga</p>


    <button type="button" @click="goToHome" class="btn btn-info mt-5">Tagasi koduvaatele</button>
  </div>
</template>

<style scoped></style>
