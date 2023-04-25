<template>
    <Navigation />
    <div class="lg:px-40 px-2">
        <router-view></router-view>
    </div>
    <Player v-if="getVisibile"/>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import Navigation from "./Component/NavigationComponent.vue";
import Player from "./Component/PlayerComponent.vue";
export default {
    name: "App",

    components: {Player, Navigation},

    computed:{
        ...mapGetters('player', {
            getVisibile:'getVisibile',
        }),
    }
}
</script>

<style scoped>

</style>
