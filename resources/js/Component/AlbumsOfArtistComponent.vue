<template>
        <h2 class="flex justify-center text-3xl">Albums of {{ getArtistWithAlbums.name }}</h2>
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
                <router-link :to="{ name: 'artistSongs', params: { idAlbum: album.id }}">
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
    name: "AlbumsOfArtistComponent",

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
            fetchArtistWithAlbums: 'fetchArtistWithAlbums',
        }),

        fetchData() {
            this.fetchArtistWithAlbums(this.idArtist);
        },

        coverLink(albumId) {
            return '/storage/covers/' + albumId + '.jpg';
        },

    },

    computed: {
        ...mapGetters('artists', {
            getArtistWithAlbums: 'getArtistWithAlbums',
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

