<template>
    <div class="sm:col-span-3">
        <div class="flex space-x-2 my-3">
            <h2 class="flex justify-center text-3xl">Songs of Album {{albumWithSongsToShow.name}}</h2>
            <button @click="backBtn" v-if="getUser.role === 'admin'"
                    class="rounded-md bg-orange-400 px-10 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                back
            </button>
        </div>
    </div>

    <ul role="list" class="divide-y divide-gray-100">
        <li v-for="song in albumWithSongsToShow.songs" :key="song.id" class="flex justify-between gap-x-6 py-5">
            <div class="flex gap-x-4">
                <img class="h-20 w-20 flex-none bg-gray-50" src="/images/disco.jpg" alt="" />
                <div class="min-w-0 flex-auto">
                    <p class="text-sm font-semibold leading-6 text-gray-900">{{ song.name }}</p>
                </div>
            </div>
            <div class="hidden sm:flex sm:flex-col sm:items-end">
                <p class="text-sm leading-6 text-gray-900 space-x-2">
                    <button @click="runDeleteSong(song)" title="Delete Song" v-if="getUser.role === 'admin'"
                            class="rounded-md bg-red-700 px-2 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                        </svg>
                    </button>
                    <button @click="runPlay(song)" title="Play Song" v-if="getUser.role === 'artist' || getUser.role === 'user'"
                            class="rounded-md bg-green-700 px-2 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                        <svg v-if="song.id != idSongPlayed" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M5.25 5.653c0-.856.917-1.398 1.667-.986l11.54 6.348a1.125 1.125 0 010 1.971l-11.54 6.347a1.125 1.125 0 01-1.667-.985V5.653z" />
                        </svg>
                        <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25v13.5m-7.5-13.5v13.5" />
                        </svg>
                    </button>
                </p>
            </div>
        </li>
    </ul>

    <MessageComponent v-if="showDelete" :soggetto="songDelete" @confirmDelete="confirmDelete" @confirmCancel="confirmCancel"/>

    <InfoComponent v-if="showInfo" :soggetto="songDelete" @closeInfo="closeInfo"/>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import MessageComponent from "../Component/MessageComponent.vue";
import InfoComponent from "./InfoComponent.vue";
import store from "../Store";

export default {
    name: "SongsOfAlbumComponent",
    components: {InfoComponent, MessageComponent},
    emits:['backToAlbum'],

    props:['albumWithSongsToShow'],

    data(){
        return{
            showDelete:false,
            showInfo:false,
            idSongPlayed:'',
            songDelete:{}
        }
    },

    methods:{
        ...mapActions('albums', {
            deleteSongOfAlbum: 'deleteSongOfAlbum',
        }),

        backBtn(){
            this.$emit('backToAlbum')
        },

        runDeleteSong(song){
            this.showDelete = true;
            this.songDelete = song;
        },

        confirmDelete(){
            this.deleteSongOfAlbum({
                'idSong':this.songDelete.id,
                'idAlbum':this.albumWithSongsToShow.id,
            });
            this.showDelete = false;
            this.showInfo = true;
        },

        confirmCancel(){
            this.showDelete = false;
        },

        closeInfo(){
            this.showInfo = false;
        },

        runPlay(song){
            if (!this.getVisibile){
                store.commit('player/switchVisible');
            }

            // ----- è la prima volta oppure un nuovo play ------- //
            if (song.id !== this.idSongPlayed){
                if (song.id == this.getAudio.meta){
                    // ----- play stessa canzone ------- //
                    store.commit('player/playAudio');
                }else{
                    // ----- play nuova canzone ------- //
                    store.commit('player/setAudio', song);
                }
                this.idSongPlayed = song.id;
            } else {
                // ----- pausa stessa canzone ------- //
                this.idSongPlayed = '';
                store.commit('player/pauseAudio')
            }
        }
    },

    computed:{
        ...mapGetters('login', {
            getUser: 'getUser',
        }),
        ...mapGetters('player', {
            getVisibile: 'getVisibile',
            getPlaySong: 'getPlaySong',
            getAudio: 'getAudio',
        }),
    }
}
</script>

<style scoped>

</style>
