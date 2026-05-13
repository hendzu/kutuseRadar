export default {
  isLoggedIn() {
    return localStorage.getItem('userId') !== null
  },

}
