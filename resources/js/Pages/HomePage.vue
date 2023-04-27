<template>
    <div v-if="getLogged">
        <HomeUser v-if="getUser.role === 'user'"/>
        <HomeArtist v-if="getUser.role === 'artist'"/>
        <HomeAdmin v-if="getUser.role === 'admin'"/>
    </div>
</template>

<script>

import {mapGetters} from "vuex";
import HomeUser from "../Component/HomeUserComponent.vue";
import HomeArtist from "../Component/HomeArtistComponent.vue";
import HomeAdmin from "../Component/HomeAdminComponent.vue";

export default {
    name: "HomePage",
    components: {HomeAdmin, HomeArtist, HomeUser},
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
