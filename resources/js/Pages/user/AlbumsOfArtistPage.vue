<template>
    <MyAlbumsOfArtistComponent :idArtist="this.$route.params.idArtist"/>
</template>

<script>

import MyAlbumsOfArtistComponent from "../../Component/MyAlbumsOfArtistComponent.vue";
export default {
    name: "AlbumsOfArtistPage",
    components: {MyAlbumsOfArtistComponent},
}
</script>

<style scoped>

</style>
