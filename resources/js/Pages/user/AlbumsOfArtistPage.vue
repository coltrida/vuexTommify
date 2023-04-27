<template>
    <AlbumsOfArtistComponent :idArtist="this.$route.params.idArtist"/>
</template>

<script>

import AlbumsOfArtistComponent from "../../Component/AlbumsOfArtistComponent.vue";
export default {
    name: "AlbumsOfArtistPage",
    components: {AlbumsOfArtistComponent},
}
</script>

<style scoped>

</style>
