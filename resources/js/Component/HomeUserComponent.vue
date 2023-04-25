<template>
    <h2 class="flex justify-center text-3xl">My Artists</h2>
    <MyArtists />

    <h2 class="flex justify-center text-3xl mt-10">All Artists</h2>
    <AllArtists />
</template>

<script>

import MyArtists from "./MyArtistsComponent.vue";
import AllArtists from "./AllArtistsComponent.vue";
export default {
    name: "HomeUserComponent",
    components: {AllArtists, MyArtists},
}
</script>

<style scoped>

</style>
