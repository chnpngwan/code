<script setup>
import {ref, watch} from "vue";
import {getSuggestListApi} from "@/apis/goods.js";
import {usePaginationStore} from "@/stores/pagination.js";
import {storeToRefs} from "pinia";
import {useRouter} from "vue-router";

const paginationStore = usePaginationStore();
//解构
const {keyword, page} = storeToRefs(paginationStore)

const keywords = ref('')
const suggestList = ref(["手机","平板","笔记本","手表","家电"])

watch(keywords, () => {
    getSuggestListApi(keywords.value)
        .then(resp => resp.data)
        .then(data => suggestList.value = data.suggestList)
})

const router = useRouter();
function search(){
    keyword.value = keywords.value
    page.value = 1
    router.push('/search')
}

</script>

<template>
<div class="d-flex flex-column flex-sm-row">
<!--搜索框-->
    <input type="search"
           class="form-control rounded-0 me-1 mb-2"
           list="tipSearchList"
           placeholder="搜索..."
           v-model="keywords"
           @keydown.enter="search">
    <datalist id="tipSearchList">
        <option v-for="item in suggestList" :value="item"/>
    </datalist>
<!--按钮-->
    <button class="btn bg-danger rounded-0 text-white mb-2" type="button" @click="search">
        <i class="bi bi-search"></i>
    </button>
</div>
</template>

<style scoped>

</style>