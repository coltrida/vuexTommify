<template>
    <Navigation />
    <router-view></router-view>
</template>

<script>
import Navigation from "./Component/Navigation.vue";
export default {
    name: "App",
    components: {Navigation}
}
</script>

<style scoped>

</style>
