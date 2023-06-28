<template>
    <Disclosure as="nav" class="bg-gray-800" v-slot="{ open }">
        <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
            <div class="relative flex h-16 items-center justify-between">
                <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-center">
                    <div class="hidden sm:ml-6 sm:block">
                        <div class="flex space-x-4 text-amber-50">
                            <span class="mt-2">{{getNameOfSongPlayed}}</span>
<!--                            <button @click="hidePlayer" style="box-shadow: 2px 2px 2px black"
                                    class="bg-green-600 hover:bg-green-700 rounded-md bg-indigo-600 px-2 text-sm font-semibold text-white shadow-sm
                hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
                focus-visible:outline-indigo-600">

                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                         stroke-width="1.5" stroke="currentColor" class="border-2 w-10 h-6 mt-2 ml-3 bg-red-700">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25v13.5m-7.5-13.5v13.5"/>
                                    </svg>
                            </button>-->

                            <button @click="playPause" title="Play Song"
                                    class="rounded-md bg-green-700 px-2 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                                <svg v-if="!getPlaySong" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M5.25 5.653c0-.856.917-1.398 1.667-.986l11.54 6.348a1.125 1.125 0 010 1.971l-11.54 6.347a1.125 1.125 0 01-1.667-.985V5.653z" />
                                </svg>
                                <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25v13.5m-7.5-13.5v13.5" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </Disclosure>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import {Disclosure, DisclosureButton} from "@headlessui/vue";
import store from "../Store";

export default {
    name: "PlayerComponent",
    components: {Disclosure, DisclosureButton},
    methods:{
        linkSong(song){
            return '/storage/songs/' + song.id + '.mp3'
        },

        hidePlayer(){

        },

        playPause(){
            if (this.getPlaySong){
                store.commit('player/pauseAudio');
            } else {
                store.commit('player/playAudio');
            }
        }
    },

    computed:{
        ...mapGetters('player', {
            getPlayList: 'getPlayList',
            getPlaySong: 'getPlaySong',
            getNameOfSongPlayed: 'getNameOfSongPlayed',
        }),
    }
}
</script>

<style scoped>

</style>
