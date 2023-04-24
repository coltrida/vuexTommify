<template>
    <h2 class="flex justify-center text-3xl">My Artists</h2>
    <MyArtists />

    <h2 class="flex justify-center text-3xl mt-10">All Artists</h2>
    <AllArtists />
</template>

<script>

import MyArtists from "./MyArtists.vue";
import AllArtists from "./AllArtists.vue";
export default {
    name: "HomeUser",
    components: {AllArtists, MyArtists},
}
</script>

<style scoped>

</style>
