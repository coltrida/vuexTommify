<template>
    <Navigation />
    <div class="lg:px-40 px-2">
        <router-view></router-view>
    </div>
    <Player />
</template>

<script>
import Navigation from "./Component/Navigation.vue";
import Player from "./Component/Player.vue";
export default {
    name: "App",
    components: {Player, Navigation}
}
</script>

<style scoped>

</style>
