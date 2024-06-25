<script setup>

import NavLogo from "@/components/nav/NavLogo.vue";
import NavList from "@/components/nav/NavList.vue";
import NavSearch from "@/components/nav/NavSearch.vue";
import NavAuth from "@/components/nav/NavAuth.vue";
</script>

<template>
    <!--导航条-->
    <header class="nav navbar navbar-expand-lg py-3 fixed-top">
        <nav class="container">

            <NavLogo :logo-text="'Le-Go'"/>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="menu">
                <NavList/>
                <NavSearch/>
                <NavAuth/>
            </div>

        </nav>
    </header>
</template>

<style scoped>
header {
    backdrop-filter: blur(4px);
    background-color: rgba(255, 255, 255, .5);
}
</style>