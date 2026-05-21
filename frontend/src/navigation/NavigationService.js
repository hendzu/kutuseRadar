import router from '@/router/index.js'

export default {
  navigateToHomeView() {
    router.push({ name: 'homeRoute' })
  },

  navigateToErrorView() {
    router.push({ name: 'errorRoute' })
  },

  navigateToNotAuthorizedView() {
    router.push({ name: 'notAuthorizedRoute' })
  },
  navigateToLoginView() {
    router.push({ name: 'loginRoute' })
  },
  navigateToStationView(stationId) {
    router.push({ name: 'stationRoute', params: {stationId: stationId}})
  },
  navigateToAddPriceView(stationId) {
    router.push({ name: 'addPriceRoute', params: {stationId: stationId}})
  },
}
