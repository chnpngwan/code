import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    userId: null,
    avatar: null,
    loginDialog: false,
    registerDialog: false,
    forgetDialog: false,
  },
  mutations: {
    login(state, user) {
      state.userId = user.id;
      state.avatar = user.avatar;
    },
    logout2(state) {
      state.userId = null;
      state.avatar = null;
    },
    closeDialog(state) {
      state.loginDialog = false;
      state.registerDialog = false;
      state.forgetDialog = false;
    },
  },
  actions: {},
  modules: {},
  plugins: [
    createPersistedState({
      storage: window.sessionStorage
    })
  ]
});
