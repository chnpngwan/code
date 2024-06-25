<script setup>
import {VueAwesomePaginate} from "vue-awesome-paginate";
import {usePaginationStore} from "@/stores/pagination.js";
import {storeToRefs} from "pinia";

const paginationStore = usePaginationStore();
const {total, page, size} = storeToRefs(paginationStore)

function onClickHandler(currentPage){
    page.value = currentPage
    window.scrollTo({top: 0, left: 0, behavior: "smooth"})

}
</script>

<template>
    <vue-awesome-paginate
        :total-items="total"
        v-model="page"
        :max-pages-shown="5"
        :items-per-page="size"
        :on-click="onClickHandler"
        prev-button-content="<"
        next-button-content=">"
    />
</template>

<style scoped>

</style>