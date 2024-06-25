import {defineStore} from "pinia";
import {ref} from "vue";

//defineStore(‘状态模块ID’, ()=> {... ...})
export const usePaginationStore = defineStore('pagination', () => {

    const page = ref(0)
    const keyword = ref('')
    const size = ref(15)
    const total = ref(0)
    const dataList = ref([])

    return {page, keyword, size, total, dataList}

}, {
    persist: {storage: sessionStorage}
})