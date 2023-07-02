const routes = [
    { path: '/', component: () => import('../Pages/HomePage.vue'), name: 'home' },
    { path: '/login', component: () => import('../Pages/login/Login.vue'), name: 'login' },
    { path: '/register', component: () => import('../Pages/login/Register.vue'), name: 'register' },
    { path: '/favorites', component: () => import('../Pages/user/FavoritesPage.vue'), name: 'favorites' },
    { path: '/myalbums', component: () => import('../Pages/user/MyAlbumsPage.vue'), name: 'myalbums' },
    { path: '/myartists', component: () => import('../Pages/user/MyArtistsPage.vue'), name: 'myartists' },
    { path: '/albums/:idArtist', component: () => import('../Pages/user/AlbumsOfArtistPage.vue'), name: 'albumsOfArtist' },
    { path: '/admin/users', component: () => import('../Pages/admin/UsersPage.vue'), name: 'adminUsers' },
    { path: '/admin/artists', component: () => import('../Pages/admin/ArtistsPage.vue'), name: 'adminArtists' },
    { path: '/admin/albums', component: () => import('../Pages/admin/AlbumsPage.vue'), name: 'adminAlbums' },
    { path: '/admin/albums/:artist', component: () => import('../Pages/admin/AlbumsOfArtistPage.vue'), name: 'adminAlbumsOfArtist' },
    { path: '/artist/albums', component: () => import('../Pages/artist/AlbumsPage.vue'), name: 'artistAlbums' },
    { path: '/artist/newAlbum', component: () => import('../Pages/artist/AddAlbumPage.vue'), name: 'artistNewAlbum' },
    { path: '/artist/newSong', component: () => import('../Pages/artist/CreateSongPage.vue'), name: 'artistNewSong' },
    { path: '/artist/addMusic', component: () => import('../Pages/artist/AddMusicPage.vue'), name: 'artistAddMusic' },
    { path: '/artist/addSong/:idAlbum', component: () => import('../Pages/artist/AddSongPage.vue'), name: 'artistAddSong' },
    { path: '/artist/Songs/:idAlbum', component: () => import('../Pages/artist/SongsPage.vue'), name: 'artistSongs' },
];

export default routes;
