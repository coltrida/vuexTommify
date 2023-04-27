<template>
    <div class="sm:col-span-3">
        <div class="flex space-x-2 my-3">
            <h2 class="flex justify-center text-3xl">Album of {{artistWithAlbumToShow.name}}</h2>
            <button @click="backBtn"
                    class="rounded-md bg-orange-400 px-10 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                back
            </button>
        </div>
    </div>

    <ul role="list" class="divide-y divide-gray-100">
        <li v-for="album in artistWithAlbumToShow.albums" :key="album.id" class="flex justify-between gap-x-6 py-5">
            <div class="flex gap-x-4">
                <img class="h-20 w-20 flex-none bg-gray-50" :src="fotoAlbum(album)" alt="" />
                <div class="min-w-0 flex-auto">
                    <p class="text-sm font-semibold leading-6 text-gray-900">{{ album.name }}</p>
                </div>
            </div>
            <div class="hidden sm:flex sm:flex-col sm:items-end">
                <p class="text-sm leading-6 text-gray-900 space-x-2">
                    <button @click="runDeleteAlbum(album)" title="Delete Album"
                            class="rounded-md bg-red-700 px-2 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                        </svg>
                    </button>

                    <button @click="runShowSongs(album)" title="Show Songs of Album"
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
</template>

<script>
import {mapActions, mapGetters} from "vuex";
export default {
    name: "AlbumOfArtistPage",

    emits:['backToArtists'],

    props:['artistWithAlbumToShow'],

    methods:{
        ...mapActions('albums', {
            fetchAllAlbums: 'fetchAllAlbums',
            findAlbum: 'findAlbum',
        }),

        fotoAlbum(album){
            return '/storage/covers/' + album.id + '.jpg'
        },

        backBtn(){
            this.$emit('backToArtists')
        },

        runDeleteAlbum(album){

        },

        runShowSongs(album){

        }
    },

    computed:{
        ...mapGetters('albums', {
            getAllAlbums: 'getAllAlbums',
        }),
    }
}
</script>

<style scoped>

</style>
