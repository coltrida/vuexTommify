<template>
    <div>
        <div class="px-4 sm:px-0">
            <h3 class="text-base font-semibold leading-7 text-gray-900">Informations</h3>
            <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Album Artist and Users</p>
        </div>
        <div class="mt-6 border-t border-gray-100">
            <dl class="divide-y divide-gray-100">
                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                    <dt class="text-sm font-medium leading-6 text-gray-900">Top three selling albums</dt>
                    <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                        <div v-for="album in getFirstThreeAlbumSales" :key="album.id">
                            {{album.name}}  ( {{album.albumsales_count}} )
                        </div>
                    </dd>
                </div>
                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                    <dt class="text-sm font-medium leading-6 text-gray-900">Users</dt>
                    <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{getUsers.length}}</dd>
                </div>
                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                    <dt class="text-sm font-medium leading-6 text-gray-900">Artists</dt>
                    <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{getAllArtists.length}}</dd>
                </div>
                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                    <dt class="text-sm font-medium leading-6 text-gray-900">Album</dt>
                    <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{getAllAlbums.length}}</dd>
                </div>
<!--                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                    <dt class="text-sm font-medium leading-6 text-gray-900">About</dt>
                    <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">Fugiat ipsum ipsum deserunt culpa aute sint do nostrud anim incididunt cillum culpa consequat. Excepteur qui ipsum aliquip consequat sint. Sit id mollit nulla mollit nostrud in ea officia proident. Irure nostrud pariatur mollit ad adipisicing reprehenderit deserunt qui eu.</dd>
                </div>-->
            </dl>
        </div>
    </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
    name: "HomeAdmin",

    mounted() {
        this.loadData();
    },

    methods:{
        ...mapActions('albums', {
            fetchAllAlbums: 'fetchAllAlbums',
            fetchStatisticFirstThreeAlbumSales: 'fetchStatisticFirstThreeAlbumSales',
        }),
        ...mapActions('users', {
            fetchUsers: 'fetchUsers',
        }),
        ...mapActions('artists', {
            fetchAllArtists: 'fetchAllArtists',
        }),

        loadData(){
            this.fetchStatisticFirstThreeAlbumSales();
            this.fetchUsers();
            this.fetchAllArtists();
            this.fetchAllAlbums();
        }
    },

    computed: {
        ...mapGetters('albums', {
            getFirstThreeAlbumSales: 'getFirstThreeAlbumSales',
            getAllAlbums: 'getAllAlbums',
        }),
        ...mapGetters('users', {
            getUsers: 'getUsers',
        }),
        ...mapGetters('artists', {
            getAllArtists: 'getAllArtists',
        }),
    }
}
</script>

<style scoped>

</style>
