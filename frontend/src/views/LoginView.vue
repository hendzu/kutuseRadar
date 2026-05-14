<template>
  <div class="row justify-content-center mt-5">
    <h1 class="text-center">Logi sisse</h1>
    <div class="row justify-content-center" >
      <div class="col col-6">
        <AlertError :error-message="errorMessage"/></div>

    </div>
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
        type="password"
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
import AlertError from '@/components/alerts/AlertError.vue'

export default {
  name: 'LoginView',
  components: { AlertError },
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
      this.resetErrorMessage()
      if (this.allFormFieldsAreCorrect()) {
        LoginService.sendGetLoginRequest(this.username, this.password)
          .then((response) => this.handleLoginResponse(response))
          .catch((error) => this.handleLoginError(error))
          .finally(() => {
            this.$emit('event-user-logged-in')
          })
      } else {
        this.errorMessage = 'Täida kõik väljad'
      }
    },
    resetErrorMessage() {
      this.errorMessage = ''
    },
    handleLoginResponse(response) {
      this.loginResponse = response.data
      localStorage.setItem('userId', this.loginResponse.userId)
      localStorage.setItem('roleName', this.loginResponse.roleName)
      this.$emit('event-user-logged-in')
      this.$router.push('/')
    },
  },
}
</script>
