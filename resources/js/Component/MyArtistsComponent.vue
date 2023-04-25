<template>
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
        <swiper-slide v-for="artist in getMyArtists" :key="artist.id">
            <router-link
                :to="/albums/+artist.id">
                <h2>{{artist.name}}</h2>
                <img src="/images/disco.jpg">
            </router-link>
        </swiper-slide>
    </swiper>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import { Swiper, SwiperSlide } from "swiper/vue";
import "swiper/css";
import "swiper/css/effect-coverflow";
import "swiper/css/pagination";

import { EffectCoverflow, Pagination } from "swiper";

export default {
    name: "MyArtistsComponent",
    components: {
        Swiper,
        SwiperSlide,
    },
    setup() {
        return {
            modules: [EffectCoverflow, Pagination],
        };
    },

    mounted() {
        if (this.getMyArtists.length === 0){
            this.fetchData();
        }
    },

    methods:{
        ...mapActions('login', {
            fetchUserFromToken:'fetchUserFromToken',
        }),

        fetchData(){
            this.fetchUserFromToken(this.getToken);
        }
    },

    computed:{
        ...mapGetters('login', {
            getMyArtists:'getMyArtists',
            getToken:'getToken',
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
}

.swiper-slide img {
    display: block;
    width: 100%;
}
</style>
