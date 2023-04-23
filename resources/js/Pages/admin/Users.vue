<template>
    <h2 class="text-red-600">Home</h2>
    <div v-for="user in getUsers" :key="user.id">
        {{user.name}}
    </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
export default {
    name: "Users",

    mounted() {
        this.fetchUsers();
    },

    methods:{
        ...mapActions('users', {
            fetchUsers: 'fetchUsers',
        }),
    },

    computed:{
        ...mapGetters('users', {
            getUsers: 'getUsers',
        }),
    }
}
</script>

<style scoped>

</style>
