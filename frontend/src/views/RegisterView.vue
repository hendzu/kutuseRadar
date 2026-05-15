<template>
  <div class="row justify-content-center mt-5">
    <div class="col col-6">
      <AlertError :error-message="errorMessage" />
    </div>
    <h1 class="text-center">Registreeru</h1>

    <div class="col col-3 mb-4">
      <input
        type="text"
        v-model="username"
        class="form-control"
        id="inputUsername"
        placeholder="Kasutajanimi"
      />
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col col-3">
      <input
        v-model="password"
        type="password"
        class="form-control"
        id="inputPassword"
        placeholder="Parool"
      />
    </div>
  </div>
  <div class="row justify-content-center mt-3">
    <div class="col col-3">
      <input
        v-model="validatepassword"
        type="password"
        class="form-control"
        id="inputPasswordConfirm"
        placeholder="Korda parooli"
      />
    </div>
  </div>
  <div class="row justify-content-center mt-3">
    <div class="col col-3">
      <button class="btn btn-primary w-100" @click="register">Registreeru</button>
    </div>
  </div>
</template>

<script>
import registerService from '@/api-services/RegisterService.js'
import AlertError from '@/components/alerts/AlertError.vue'
import navigationService from '@/navigation/NavigationService.js'

export default {
  name: 'RegisterView',
  components: { AlertError },

  data() {
    return {
      username: '',
      password: '',
      errorMessage: '',
      validatepassword: '',

      errorResponse: {
        message: '',
        errorCode: 0,
      },
    }
  },
  methods: {
    register() {
      if (!this.allFieldsFilled()) {
        this.errorMessage = 'Kõik väljad peavad olema täidetud'
        return
      }
      if (!this.passwordsMatch()) {
        this.errorMessage = 'Paroolid ei kattu'
        return
      }
      registerService
        .sendPostRegisterRequest(this.username, this.password)
        .then(navigationService.navigateToLoginView)
        .catch((error) => {
          this.errorMessage = error.response.data.message
        })
        .finally()
    },
    allFieldsFilled() {
      return this.username && this.password && this.validatepassword
    },
    passwordsMatch() {
      return this.password === this.validatepassword
    },


  },
}
</script>
