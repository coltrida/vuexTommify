import { createStore } from 'vuex'

import UsersModule from './module/users';
import LoginModule from './module/login';
import ArtistsModule from './module/artists';
import AlbumsModule from './module/albums';
import SongsModule from './module/songs';
import PlayerModule from './module/player';

const store = createStore({
    modules: {
        users: UsersModule,
        login: LoginModule,
        artists: ArtistsModule,
        albums: AlbumsModule,
        songs: SongsModule,
        player: PlayerModule,
    }
})

export default store;
