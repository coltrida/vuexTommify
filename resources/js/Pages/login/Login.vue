<template>
    <div class="pb-12">
        <h2 class="text-base font-semibold leading-7 text-gray-900">Login</h2>

        <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
            <div class="sm:col-span-3">
                <label for="email" class="block text-sm font-medium leading-6 text-gray-900">Email address</label>
                <div class="mt-2">
                    <input id="email" v-model="payload.email" autocomplete="email"
                           class="pl-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"/>
                </div>
                <div class="text-red-600" v-for="message in getMessaggioErroreEmail" :key="message">
                    {{ message }}
                </div>

            </div>

            <div class="sm:col-span-3">
                <label for="last-name" class="block text-sm font-medium leading-6 text-gray-900">Password</label>
                <div class="mt-2">
                    <input type="password" v-model="payload.password" autocomplete="family-name"
                           class="pl-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"/>
                </div>
                <div class="text-red-600" v-for="message in getMessaggioErrorePassword" :key="message">
                    {{ message }}
                </div>
            </div>
        </div>

        <div class="mt-6 flex justify-center gap-x-6">
            <button @click="runLogin"
                    class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                Login
            </button>
        </div>
    </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
    name: "Login",

    data() {
        return {
            payload: [
                'email',
                'password'
            ],
        }
    },

    mounted() {
        if (this.getLogged) {
            this.$router.push({path: '/'})
        }
    },

    methods: {
        ...mapActions('login', {
            login: 'login',
        }),

        runLogin() {
            this.login(this.payload).then(() => {

                this.$router.push({path: '/'})

            });
        }
    },

    computed: {
        ...mapGetters('login', {
            getMessaggioErroreEmail: 'getMessaggioErroreEmail',
            getMessaggioErrorePassword: 'getMessaggioErrorePassword',
            getLogged: 'getLogged',
        }),
    }
}
</script>

<style scoped>

</style>
