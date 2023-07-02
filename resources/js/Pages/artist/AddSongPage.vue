<template>
    <div class="pb-12" v-if="getUser.role === 'artist'">
        <h2 class="text-base font-semibold leading-7 text-gray-900">Insert Song for {{ getAlbumWithSongs.name }} Album</h2>

        <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
            <div class="sm:col-span-3 py-2">
                <label for="name" class="block text-sm font-medium leading-6 text-gray-900">Song Name</label>
                <div class="mt-2">
                    <input v-model="payload.name" autocomplete="name"
                           class="pl-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"/>
                </div>
                <label for="name" class="block text-sm font-medium leading-6 text-gray-900">Cost</label>
                <div class="mt-2">
                    <input v-model="payload.cost" autocomplete="name"
                           class="pl-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"/>
                </div>
            </div>

            <div class="sm:col-span-3">
                <label for="cover-photo" class="block text-sm font-medium leading-6 text-gray-900">Mp3</label>
                <div class="mt-2 flex justify-center rounded-lg border border-dashed border-gray-900/25 px-6 py-2">
                    <div class="text-center">
                        <svg class="mx-auto h-12 w-12 text-gray-300" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                            <path fill-rule="evenodd" d="M1.5 6a2.25 2.25 0 012.25-2.25h16.5A2.25 2.25 0 0122.5 6v12a2.25 2.25 0 01-2.25 2.25H3.75A2.25 2.25 0 011.5 18V6zM3 16.06V18c0 .414.336.75.75.75h16.5A.75.75 0 0021 18v-1.94l-2.69-2.689a1.5 1.5 0 00-2.12 0l-.88.879.97.97a.75.75 0 11-1.06 1.06l-5.16-5.159a1.5 1.5 0 00-2.12 0L3 16.061zm10.125-7.81a1.125 1.125 0 112.25 0 1.125 1.125 0 01-2.25 0z" clip-rule="evenodd" />
                        </svg>
                        <div class="mt-4 flex text-sm leading-6 text-gray-600">
                            <label for="file-upload" class="relative cursor-pointer rounded-md bg-white font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500">
                                <span>Upload a file</span>
                                <input id="file-upload" v-on:change="loadImg" type="file" class="sr-only" accept=".mp3">
                            </label>
                            <p class="pl-1">or drag and drop</p>
                        </div>
                        <p class="text-xs leading-5 text-gray-600">MP3 format</p>
                    </div>
                </div>
            </div>

        </div>

        <div class="mt-6 flex justify-center gap-x-6">
            <button v-if="addMusic" disabled type="button" class="text-white bg-indigo-600 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 inline-flex items-center">
                <svg aria-hidden="true" role="status" class="inline w-4 h-4 mr-3 text-white animate-spin" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="#E5E7EB"/>
                    <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentColor"/>
                </svg>
                Loading...
            </button>
            <button v-else @click="runInsertSong"
                    class="rounded-md bg-indigo-600 px-6 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                Insert
            </button>
        </div>
    </div>

    <div v-if="album.id">
        <songs-of-album-component :albumWithSongsToShow="album"/>
    </div>

    <div class="my-6 flex justify-center gap-x-6">
        <button @click="runSaveAlbum" :disabled="numberOfTracks < 2"
                :class="numberOfTracks < 2 ? 'bg-blue-500 text-white font-bold py-2 px-4 rounded opacity-50 cursor-not-allowed' : ''"
                class="rounded-md
                        bg-indigo-600
                        px-8
                        py-2
                        text-sm
                        font-semibold
                        text-white
                        shadow-sm
                        hover:bg-indigo-500
                        focus-visible:outline
                        focus-visible:outline-2
                        focus-visible:outline-offset-2
                        focus-visible:outline-indigo-600">
            Save {{buttonName}}
        </button>
    </div>


</template>

<script>
import {mapActions, mapGetters} from "vuex";
import SongsOfAlbumComponent from "../../Component/SongsOfAlbumComponent.vue";

export default {
    name: "AddSongPage",
    components: {SongsOfAlbumComponent},
    data(){
        return{
            payload: {
                'name' : '',
                'cost' : '',
                'fileUp' : {},
                'album_id' : this.$route.params.idAlbum,
            },
            addMusic: false,
            album: {}
        }
    },

    mounted() {
        this.fetchData();
    },

    methods:{
        ...mapActions('albums', {
            fetchAlbumWithSongs:'fetchAlbumWithSongs',
            addSong:'addSong',
        }),

        fetchData(){
            this.fetchAlbumWithSongs(this.payload.album_id).then(() => {this.album = this.getAlbumWithSongs});
        },

        loadImg(e){
            let files = e.target.files || e.dataTransfer.files;
            if (!files.length)
                return;
            this.payload.fileUp = files[0];
        },

        runInsertSong(){
            this.addMusic = true;
            this.addSong(this.payload).then(() => {
                this.payload = {
                    'name' : '',
                    'cost' : '',
                    'fileUp' : {},
                    'album_id' : this.$route.params.idAlbum,
                };
                this.addMusic = false;
            });
        },

        runSaveAlbum(){
            this.$router.push({name:'artistAlbums'})
        }
    },

    computed:{
        ...mapGetters('albums', {
            getAlbumWithSongs: 'getAlbumWithSongs',
        }),

        ...mapGetters('login', {
            getUser: 'getUser',
        }),

        numberOfTracks(){
            return this.getAlbumWithSongs.songs ? this.getAlbumWithSongs.songs.length : 0;
        },

        buttonName(){
            if (this.getAlbumWithSongs.songs){
                return this.getAlbumWithSongs.songs.length < 7 ? '( ' + this.getAlbumWithSongs.songs.length + ' of 7 )' : this.getAlbumWithSongs.songs.length;
            }
            return '';
        }
    }
}
</script>

<style scoped>

</style>
