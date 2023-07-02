<template>
    <div v-if="album.id">
        <songs-of-album-component :albumWithSongsToShow="album"/>
    </div>


</template>

<script>
import {mapActions, mapGetters} from "vuex";
import SongsOfAlbumComponent from "../../Component/SongsOfAlbumComponent.vue";

export default {
    name: "SongsPage",
    components: {SongsOfAlbumComponent},
    data(){
        return{
            payload: {
                'album_id' : this.$route.params.idAlbum,
            },
            album: {}
        }
    },

    mounted() {
        this.fetchData();
    },

    methods:{
        ...mapActions('albums', {
            fetchAlbumWithSongs:'fetchAlbumWithSongs',
        }),

        fetchData(){
            this.fetchAlbumWithSongs(this.payload.album_id).then(() => {this.album = this.getAlbumWithSongs});
        },
    },

    computed:{
        ...mapGetters('albums', {
            getAlbumWithSongs: 'getAlbumWithSongs',
        }),

        ...mapGetters('login', {
            getUser: 'getUser',
        }),
    }
}
</script>

<style scoped>

</style>
