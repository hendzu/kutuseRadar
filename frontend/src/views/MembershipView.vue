<template>
  <div class="container mt-5">
    <h1 class="text-center">Minu soodustused</h1>
    <div class="row justify-content-center">
      <div class="col col-6">
        <AlertError :error-message="errorMessage" />
        <AlertSuccess :success-message="successMessage" />
      </div>
    </div>
    <div class="justify-content-center mt-3">
      <div class="col col-8">
        <table class="table">
          <thead>
            <tr>
              <th>Kett</th>
              <th>Tase</th>
              <th>Soodus s/l</th>
              <th></th>
            </tr>
          </thead>

          <tbody>
            <tr v-for="m in memberships" :key="m.userMembershipId">
              <td>{{ m.chainName }}</td>
              <td>{{ m.membershipName }}</td>
              <td>{{ m.membershipDiscount }}</td>
              <td>
                <span style="cursor: pointer" @click="editMembership(m)">
                  <PhPencil :size="32" />
                </span>
                <span
                  style="cursor: pointer"
                  class="ms-2"
                  @click="deleteMembership(m.userMembershipId)"
                  ><PhX :size="32"
                /></span>
              </td>
            </tr>
            <select class="form-select" v-model="selectedChainId" @change="getMembershipOptions">
              <option :value="0" disabled>Vali kett</option>
              <option v-for="c in chains" :key="c.chainId" :value="c.chainId">
                {{ c.chainName }}
              </option>
            </select>
            <select
              class="form-select"
              v-model="selectedMembershipId"
              :disabled="membershipOptions.length === 0"
            >
              <option :value="0" disabled>Vali soodustus</option>
              <option v-for="o in membershipOptions" :key="o.membershipId" :value="o.membershipId">
                {{ o.membershipName }}
              </option>
            </select>
            <button class="btn btn-primary w-100" @click="submitMembership">
              {{ editingUserMembershipId !== null ? 'Muuda soodustus' : 'Lisa soodustus' }}
            </button>
            <button
              v-if="editingUserMembershipId !== null"
              class="btn btn-secondary"
              @click="cancelEdit"
            >
              Tühista
            </button>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
<script>
import AlertError from '@/components/alerts/AlertError.vue'
import NavigationService from '@/navigation/NavigationService.js'
import AuthService from '@/auth/AuthService.js'
import MembershipService from '@/api-services/MembershipService.js'
import AlertSuccess from '@/components/alerts/AlertSuccess.vue'
import { PhPencil, PhX } from '@phosphor-icons/vue'

export default {
  name: 'MembershipView',
  components: { PhPencil, AlertSuccess, AlertError, PhX },

  data() {
    return {
      errorMessage: '',
      successMessage: '',
      memberships: [],
      chains: [],
      membershipOptions: [],
      selectedChainId: 0,
      selectedMembershipId: 0,
      editingUserMembershipId: null,
    }
  },

  beforeMount() {
    if (!AuthService.isLoggedIn()) {
      NavigationService.navigateToNotAuthorizedView()
      return
    }
    this.getUserMemberships()
    this.getChains()
  },

  methods: {
    resetMessageFields() {
      this.errorMessage = ''
      this.successMessage = ''
    },

    getUserMemberships() {
      MembershipService.getUserMemberships(localStorage.getItem('userId'))
        .then((response) => (this.memberships = response.data))
        .catch(() => NavigationService.navigateToErrorView())
    },

    getChains() {
      MembershipService.getChains()
        .then((response) => (this.chains = response.data))
        .catch(() => NavigationService.navigateToErrorView())
    },

    getMembershipOptions() {
      this.selectedMembershipId = 0
      this.membershipOptions = []
      MembershipService.getMembershipOptions(this.selectedChainId)
        .then((response) => (this.membershipOptions = response.data))
        .catch(() => NavigationService.navigateToErrorView())
    },

    submitMembership() {
      this.resetMessageFields()
      const userMembershipDto = {
        chainId: this.selectedChainId,
        membershipId: this.selectedMembershipId,
        userId: Number(localStorage.getItem('userId')),
      }
      if (this.editingUserMembershipId !== null) {
        MembershipService.updateUserMembership(userMembershipDto)
          .then((response) => {
            this.successMessage = response.data.message
            this.editingUserMembershipId = null
            this.getUserMemberships()
          })
          .catch(() => NavigationService.navigateToErrorView())
      } else {
        MembershipService.addUserMembership(userMembershipDto)
          .then((response) => {
            this.successMessage = response.data.message
            this.getUserMemberships()
          })
          .catch((error) => this.handleAddError(error))
      }
    },

    handleAddError(error) {
      const data = error.response?.data
      if (data?.errorCode === 105) {
        this.errorMessage = data.message
      } else {
        NavigationService.navigateToErrorView()
      }
    },

    editMembership(membership) {
      this.editingUserMembershipId = membership.userMembershipId
      const chain = this.chains.find((c) => c.chainName === membership.chainName)
      this.selectedChainId = chain?.chainId ?? 0
      MembershipService.getMembershipOptions(this.selectedChainId)
        .then((response) => {
          this.membershipOptions = response.data
          const option = response.data.find((m) => m.membershipName === membership.membershipName)
          this.selectedMembershipId = option?.membershipId ?? 0
        })
        .catch(() => NavigationService.navigateToErrorView())
    },

    deleteMembership(userMembershipId) {
      this.resetMessageFields()
      MembershipService.deleteUserMembership(userMembershipId)
        .then((response) => {
          this.successMessage = response.data.message
          this.getUserMemberships()
        })
        .catch(() => NavigationService.navigateToErrorView())
    },
    cancelEdit() {
      this.editingUserMembershipId = null
      this.selectedChainId = 0
      this.selectedMembershipId = 0
      this.membershipOptions = []
    },
  },
}
</script>
