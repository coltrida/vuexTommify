import { createStore } from 'vuex'

import UsersModule from './module/users';
import LoginModule from './module/login';
import ArtistsModule from './module/artists';

const store = createStore({
    modules: {
        users: UsersModule,
        login: LoginModule,
        artists: ArtistsModule,
    }
})

export default store;
