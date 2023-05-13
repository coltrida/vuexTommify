<template>
        <h2 class="flex justify-center mt-2">
            <button @click="runPlay" style="box-shadow: 2px 2px 2px black"
                    :class="getPlayShuffleAlbumsOfArtist ? 'bg-green-600 hover:bg-green-700' : 'bg-indigo-600'"
                    class="rounded-md bg-indigo-600 px-10 text-sm font-semibold text-white shadow-sm
                hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
                focus-visible:outline-indigo-600">
                <div class="flex justify-center text-3xl py-2">
                    Album of {{ getArtistWithAlbums.name }}
                    <svg v-if="getPlayShuffleAlbumsOfArtist && getArtistWithAlbums.id == getIdArtistPlay" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                         stroke-width="1.5" stroke="currentColor" class="border-2 w-10 h-6 mt-2 ml-3 bg-red-700">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25v13.5m-7.5-13.5v13.5"/>
                    </svg>

                    <svg style="box-shadow: 2px 2px 2px black" v-else xmlns="http://www.w3.org/2000/svg" fill="none"
                         viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="border-2 w-10 h-6 mt-2 ml-3">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M7.5 21L3 16.5m0 0L7.5 12M3 16.5h13.5m0-13.5L21 7.5m0 0L16.5 12M21 7.5H7.5"/>
                    </svg>
                </div>
            </button>
        </h2>
        <swiper
            :effect="'coverflow'"
            :grabCursor="true"
            :centeredSlides="true"
            :slidesPerView="'auto'"
            :coverflowEffect="{
      rotate: 50,
      stretch: 0,
      depth: 100,
      modifier: 1,
      slideShadows: true,
    }"
            :pagination="true"
            :modules="modules"
            class="mySwiper"
        >
            <swiper-slide v-for="album in getArtistWithAlbums.albums" :key="album.id">
                <router-link :to="{ name: 'artistAddSong', params: { idAlbum: album.id }}">
                    <h2>{{ album.name }}</h2>
                    <img :src=coverLink(album.id)>
                </router-link>
            </swiper-slide>
        </swiper>

</template>

<script>
import {mapActions, mapGetters} from "vuex";
import {Swiper, SwiperSlide} from "swiper/vue";
import "swiper/css";
import "swiper/css/effect-coverflow";
import "swiper/css/pagination";

import {EffectCoverflow, Pagination} from "swiper";
import SongsOfAlbumComponent from "./SongsOfAlbumOfArtistComponent.vue";

export default {
    name: "MyAlbumsOfArtistComponent",

    components: {
        SongsOfAlbumComponent,
        Swiper,
        SwiperSlide,
    },

    data(){
        return{

        }
    },

    setup() {
        return {
            modules: [EffectCoverflow, Pagination],
        };
    },

    props: ['idArtist'],

    mounted() {
        this.fetchData();
    },

    methods: {
        ...mapActions('artists', {
            fetchArtistWithMyAlbums: 'fetchArtistWithMyAlbums',
        }),

        fetchData() {
            this.fetchArtistWithMyAlbums({
                'idArtist':this.idArtist,
                'idUser':this.getUser.id,
            });
        },

        coverLink(albumId) {
            return '/storage/covers/' + albumId + '.jpg';
        },

        runPlay() {
            this.$store.commit('player/runPlayShuffleAlbumsOfArtist', this.idArtist);
        },

    },

    computed: {
        ...mapGetters('artists', {
            getArtistWithAlbums: 'getArtistWithAlbums',
        }),
        ...mapGetters('login', {
            getUser: 'getUser',
        }),
        ...mapGetters('player', {
            getPlayShuffleAlbumsOfArtist: 'getPlayShuffleAlbumsOfArtist',
            getIdArtistPlay: 'getIdArtistPlay',
        }),
    }
}
</script>

<style scoped>
.swiper {
    width: 100%;
    padding-top: 10px;
    padding-bottom: 50px;
}

.swiper-slide {
    background-position: center;
    background-size: cover;
    width: 300px;
    height: 350px;
    border: 1px solid #9f9e9e;
    box-shadow: 3px 3px 3px;
    padding: 3px;
}

.swiper-slide img {
    display: block;
    width: 100%;
}
</style>

