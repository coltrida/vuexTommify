<template>
    <h2 class="flex justify-center mt-4 space-x-4">
        <button @click="runPlay" style="box-shadow: 2px 2px 2px black" class="flex rounded-md bg-indigo-600 px-10 py-5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
            <h2 class="text-3xl">My Artists</h2>
            <svg v-if="getVisibile" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="border-2 w-6 h-6 mt-2 ml-3">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25v13.5m-7.5-13.5v13.5" />
            </svg>

            <svg style="box-shadow: 2px 2px 2px black" v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="border-2 w-6 h-6 mt-2 ml-3">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7.5 21L3 16.5m0 0L7.5 12M3 16.5h13.5m0-13.5L21 7.5m0 0L16.5 12M21 7.5H7.5" />
            </svg>
        </button>

        <div class="sm:col-span-3">
            <label for="find" class="block text-sm font-medium leading-6 text-gray-900">Find my Artist</label>
            <div class="mt-2">
                <input v-model="findArtist" autocomplete="find"
                       class="pl-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"/>
            </div>
        </div>
    </h2>

    <MyArtists />

    <h2 class="flex justify-center text-3xl mt-10">All Artists</h2>
    <AllArtists />
</template>

<script>

import MyArtists from "./MyArtistsComponent.vue";
import AllArtists from "./AllArtistsComponent.vue";
import {mapGetters} from "vuex";
export default {
    name: "HomeUserComponent",

    components: {AllArtists, MyArtists},

    data(){
        return{
            findArtist:''
        }
    },

    methods:{
        runPlay(){
            this.$store.commit('player/switchShaffle');
        }
    },

    computed:{
        ...mapGetters('player', {
            getVisibile:'getVisibile',
        }),
    }
}
</script>

<style scoped>

</style>
