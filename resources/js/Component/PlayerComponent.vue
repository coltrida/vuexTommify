<template>
    <Disclosure as="nav" class="bg-gray-800" v-slot="{ open }">
        <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
            <div class="relative flex h-16 items-center justify-between">
                <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-center">
                    <div class="hidden sm:ml-6 sm:block">
                        <div class="flex space-x-4 text-amber-50">
                            Player
                            <button @click="hidePlayer" style="box-shadow: 2px 2px 2px black"
                                    class="bg-green-600 hover:bg-green-700 rounded-md bg-indigo-600 px-2 text-sm font-semibold text-white shadow-sm
                hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
                focus-visible:outline-indigo-600">

                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                         stroke-width="1.5" stroke="currentColor" class="border-2 w-10 h-6 mt-2 ml-3 bg-red-700">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25v13.5m-7.5-13.5v13.5"/>
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
import {mapGetters} from "vuex";
import {Disclosure, DisclosureButton} from "@headlessui/vue";

export default {
    name: "PlayerComponent",
    components: {Disclosure, DisclosureButton},
    methods:{
        linkSong(song){
            return '/storage/songs/' + song.id + '.mp3'
        },

        hidePlayer(){

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
