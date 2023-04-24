<template>
    <div v-if="getLogged">
        <HomeUser v-if="getUser.role === 'user'"/>
        <HomeArtist v-if="getUser.role === 'artist'"/>
    </div>
</template>

<script>

import {mapGetters} from "vuex";
import HomeUser from "../Component/HomeUser.vue";
import HomeArtist from "../Component/HomeArtist.vue";

export default {
    name: "Home",
    components: {HomeArtist, HomeUser},
    mounted() {

    },

    methods:{

    },

    computed:{
        ...mapGetters('login', {
            getLogged:'getLogged',
            getUser:'getUser',
        }),
    }
}
</script>

<style scoped>

</style>
