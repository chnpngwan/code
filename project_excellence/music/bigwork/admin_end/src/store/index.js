import { createStore } from "vuex"

const state = {
    admin:{
        id:null,
    }
}

const mutations = {
    updateAdmin(state, admin) {
        state.admin = admin
      },
}

const actions ={
    updateAdmin(content, admin) {
        content.commit("updateAdmin", admin)
      },
}

export default createStore({
    state:state,
    mutations:mutations,
    actions:actions
})