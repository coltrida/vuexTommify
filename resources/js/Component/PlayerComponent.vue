<template>
    <Disclosure as="nav" class="bg-gray-800" v-slot="{ open }">
        <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
            <div class="relative flex h-16 items-center justify-between">
                <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-center">
                    <div class="hidden sm:ml-6 sm:block">
                        <div class="flex space-x-4 text-amber-50">
                            Player
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </Disclosure>
</template>

<script>
import {mapGetters} from "vuex";
import {Disclosure, DisclosureButton} from "@headlessui/vue";

export default {
    name: "PlayerComponent",
    components: {Disclosure, DisclosureButton},
    methods:{
        linkSong(song){
            return '/storage/songs/' + song.id + '.mp3'
        }
    },

    computed:{
        ...mapGetters('player', {
            getPlayList: 'getPlayList',
        }),
    }
}
</script>

<style scoped>

</style>
