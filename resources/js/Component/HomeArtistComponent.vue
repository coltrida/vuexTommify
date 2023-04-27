<template>
    <InsertAlbumComponent />
    <AlbumsOfArtistComponent :idArtist="getUser.artist.id"/>
</template>

<script>
import InsertAlbumComponent from "./InsertAlbumComponent.vue";
import {mapGetters} from "vuex";
import AlbumsOfArtistComponent from "./AlbumsOfArtistComponent.vue";
export default {
    name: "HomeArtistComponent",

    components: {AlbumsOfArtistComponent, InsertAlbumComponent},

    computed:{
        ...mapGetters('login', {
            getUser:'getUser',
        }),
    }
}
</script>

<style scoped>

</style>
