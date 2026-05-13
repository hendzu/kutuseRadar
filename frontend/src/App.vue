<script>
import AuthService from '@/auth/AuthService.js'

export default {
  name: 'App',
  data() {
    return {
      isLoggedIn: false,
    }
  },
  methods: {
    updateLoggedInStatus() {
      this.isLoggedIn = AuthService.isLoggedIn()
    },

    executeLogOut() {
      localStorage.removeItem('userId')
      localStorage.removeItem('roleName')
      this.updateLoggedInStatus()
    },
  },
  beforeMount() {
    this.updateLoggedInStatus()
  },
}
</script>
<template>
  <nav class="navbar navbar-expand-lg bg-body-tertiar">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Kütuseradar</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <RouterLink class="nav-link active" aria-current="page" to="/">Kütusehinnad</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/map">Kaart</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/addprice">Lisa Hind</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/login">Logi sisse</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/register">Registreeru</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link disabled" aria-disabled="true">Minu soodustused</RouterLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <RouterView @event-user-logged-in="updateLoggedInStatus" />
</template>
