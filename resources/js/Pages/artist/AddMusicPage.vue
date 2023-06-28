<template>
    <div class="pb-12">
        <h2 class="text-base font-semibold leading-7 text-gray-900">Add Music</h2>

        <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
            <div class="sm:col-span-3">
                <button @click="addAlbum"
                        style="width: 300px; height: 200px"
                        class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                    Add Album
                </button>
            </div>

            <div class="sm:col-span-3">
                <button @click="addSong"
                        style="width: 300px; height: 200px"
                        class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                    Add Song
                </button>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: "AddMusicPage",

    data() {
        return {

        }
    },

    methods: {
        addAlbum(){
            this.$router.push({name:'artistNewAlbum'})
        },

        addSong(){
            this.$router.push({name:'artistNewSong'})
        }
    },

}
</script>

<style scoped>

</style>
