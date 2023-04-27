<template>
    <div v-if="showArtistWithAlbum">
        <AlbumsOfArtistPage :artistWithAlbumToShow="artistWithAlbumToShow" @backToArtists="backToArtists"/>
    </div>
    <div v-else>
        <div class="sm:col-span-3">
            <div class="flex space-x-2 my-3">
                <input v-model="payload.nameToFind" autocomplete="find" placeholder="find Artist"
                       class="pl-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"/>
                <button @click="runFindArtist"
                        class="rounded-md bg-indigo-600 px-10 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                    Find
                </button>
                <button @click="runResetFind"
                        class="rounded-md bg-orange-400 px-10 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                    Reset
                </button>
            </div>
        </div>
        <ul role="list" class="divide-y divide-gray-100">
            <li v-for="artist in getAllArtists" :key="artist.id" class="flex justify-between gap-x-6 py-5">
                <div class="flex gap-x-4">
                    <img class="h-12 w-12 flex-none rounded-full bg-gray-50" src="/images/disco.jpg" alt="" />
                    <div class="min-w-0 flex-auto">
                        <p class="text-sm font-semibold leading-6 text-gray-900">{{ artist.name }}</p>
                        <p class="mt-1 truncate text-xs leading-5 text-gray-500">{{ artist.category }}</p>
                    </div>
                </div>
                <div class="hidden sm:flex sm:flex-col sm:items-end">
                    <!--                <p class="text-sm leading-6 text-gray-900">nr. Albums {{ artist.albums_count }}</p>-->
                    <p class="text-sm leading-6 text-gray-900 space-x-2">
                        <button @click="runDeleteArtist(artist)" title="Delete Artist"
                                class="rounded-md bg-red-700 px-2 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                            </svg>
                        </button>

                        <button @click="runShowAlbums(artist)" :title="titleButton(artist)"
                                class="rounded-md bg-green-700 px-2 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                        </button>
                    </p>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import AlbumsOfArtistPage from "../admin/AlbumsOfArtistPage.vue";
export default {
    name: "ArtistsPage",

    components: {AlbumsOfArtistPage},

    mounted() {
        this.fetchAllArtists();
    },

    data(){
        return{
            payload:{
                nameToFind:''
            },
            artistWithAlbumToShow:{},
            showArtistWithAlbum: false
        }
    },

    methods:{
        ...mapActions('artists', {
            fetchAllArtists: 'fetchAllArtists',
            findArtist: 'findArtist',
        }),

        runFindArtist(){
            this.findArtist(this.payload);
        },

        runResetFind(){
            this.payload.nameToFind = '';
            this.fetchAllArtists();
        },

        titleButton(artist){
            return "Show Album (" + artist.albums_count + ")";
        },

        runDeleteArtist(artist){

        },

        runShowAlbums(artist){
            this.artistWithAlbumToShow = artist;
            this.showArtistWithAlbum = true;
        },

        backToArtists(){
            this.showArtistWithAlbum = false;
        }
    },

    computed:{
        ...mapGetters('artists', {
            getAllArtists: 'getAllArtists',
        }),
    }
}
</script>

<style scoped>

</style>
