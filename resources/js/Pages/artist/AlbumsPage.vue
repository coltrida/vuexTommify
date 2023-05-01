<template>
    <AlbumsOfArtistComponent :idArtist="getUser.artist.id"/>
</template>

<script>

import AlbumsOfArtistComponent from "../../Component/AlbumsOfArtistComponent.vue";
import {mapGetters} from "vuex";
export default {
    name: "AlbumsPage",

    components: {AlbumsOfArtistComponent},

    computed:{
        ...mapGetters('login', {
            getUser:'getUser',
        }),
    },
}
</script>

<style scoped>

</style>
