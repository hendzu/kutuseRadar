<template>
  <div class="row justify-content-center mt-5">
    <h1 class="text-center">Logi sisse</h1>
    <div class="col col-3 mb-4">
      <input
        v-model="username"
        type="text"
        class="form-control"
        id="inputUsername"
        placeholder="Kasutajanimi"
      />
    </div>
  </div>
  <div class="row justify-content-center mb-3">
    <div class="col col-3">
      <input
        v-model="password"
        type="text"
        class="form-control"
        id="inputPassword"
        placeholder="Parool"
      />
    </div>
  </div>
  <div class="row justify-content-center mb-3">
    <div class="col col-3">
      <button @click="login" class="btn btn-primary w-100">Logi sisse</button>
    </div>
  </div>
</template>

<script>
import LoginService from '@/api-services/LoginService.js'

export default {
  name: 'LoginView',
  data() {
    return {
      username: '',
      password: '',
      errorMessage: '',
      loginResponse: {
        userId: 0,
        roleName: '',
      },
    }
  },
  methods: {
    allFormFieldsAreCorrect() {
      return this.username && this.password
    },
    login() {
      //   this.startSpinner()
      //   this.resetErrorMessage()
      if (this.allFormFieldsAreCorrect()) {
        LoginService.sendGetLoginRequest(this.username, this.password)
          .then((response) => this.handleLoginResponse(response))
          .catch((error) => this.handleLoginError(error))
          .finally()
      } else {
        this.errorMessage = 'Täida kõik väljad'
      }
    },
    handleLoginResponse: (response) => {
      this.loginResponse = response.data()
      localStorage.setItem('userId', this.loginResponse.userId)
      localStorage.setItem('roleName', this.loginResponse.roleName)
      this.$emit('event-user-logged-in')
      return undefined
    },
  },
}
</script>
