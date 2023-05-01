<template>
    <div class="flex justify-center">
        <h2>Player</h2>
<!--        <audio controls autoplay>
            <source v-for="song in getPlayList" :key="song.id" :src="linkSong(song)" type="audio/mpeg">
            Your browser does not support the audio element.
        </audio>-->
    </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
    name: "PlayerComponent",

    methods:{
        linkSong(song){
            return '/storage/songs/' + song.id + '.mp3'
        }
    },

    computed:{
        ...mapGetters('player', {
            getPlayList: 'getPlayList',
        }),
    }
}
</script>

<style scoped>

</style>
