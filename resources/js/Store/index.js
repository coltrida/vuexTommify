import { createStore } from 'vuex'

import UsersModule from './module/users';

const store = createStore({
    modules: {
        users: UsersModule,
    }
})

export default store;
