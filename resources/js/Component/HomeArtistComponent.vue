<template>
    <div>
        <div class="px-4 sm:px-0">
            <h3 class="text-base font-semibold leading-7 text-gray-900">Informations</h3>
        </div>
        <div class="mt-6 border-t border-gray-100">
            <dl class="divide-y divide-gray-100">
<!--                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                    <dt class="text-sm font-medium leading-6 text-gray-900">Top three selling albums</dt>
                    <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                        <div v-for="album in getFirstThreeAlbumSales" :key="album.id">
                            {{album.name}}  ( {{album.albumsales_count}} )
                        </div>
                    </dd>
                </div>-->
                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                    <dt class="text-sm font-medium leading-6 text-gray-900">Nr. of Songs</dt>
                    <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{numberSongs}}</dd>
                </div>
                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                    <dt class="text-sm font-medium leading-6 text-gray-900">Nr. of Album Sales</dt>
                    <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{numberAlbumSales}}</dd>
                </div>
                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                    <dt class="text-sm font-medium leading-6 text-gray-900">Nr. of Album</dt>
                    <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{numberAlbum}}</dd>
                </div>
            </dl>
        </div>
    </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
export default {
    name: "HomeArtistComponent",

    mounted() {
        this.loadData();
    },

    methods:{
        ...mapActions('artists', {
            fetchArtistWithAlbums: 'fetchArtistWithAlbums',
        }),

        loadData(){
            this.fetchArtistWithAlbums(this.getUser.artist.id);
        }
    },

    computed: {
        ...mapGetters('login', {
            getUser: 'getUser',
        }),
        ...mapGetters('artists', {
            getArtistWithAlbums: 'getArtistWithAlbums',
        }),

        numberAlbum(){
            return this.getArtistWithAlbums.albums ? this.getArtistWithAlbums.albums.length : null
        },

        numberAlbumSales(){
            return this.getArtistWithAlbums.albums ?
                this.getArtistWithAlbums.albums.reduce((accumulator, currentValue) => {
                    return accumulator + currentValue.albumsales_count
                },0)
                    : null
        },

        numberSongs(){
            return this.getArtistWithAlbums.albums ?
                this.getArtistWithAlbums.albums.reduce((accumulator, currentValue) => {
                    return accumulator + currentValue.songs_count
                },0)
                : null
        }
    }
}
</script>

<style scoped>

</style>
