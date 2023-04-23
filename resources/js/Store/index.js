import { createStore } from 'vuex'

import UsersModule from './module/users';
import LoginModule from './module/login';

const store = createStore({
    modules: {
        users: UsersModule,
        login: LoginModule,
    }
})

export default store;
