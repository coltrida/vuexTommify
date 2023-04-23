const routes = [
    { path: '/', component: () => import('../Pages/Home.vue'), name: 'home' },
    { path: '/login', component: () => import('../Pages/login/Login.vue'), name: 'login' },
    { path: '/register', component: () => import('../Pages/login/Register.vue'), name: 'register' },
    { path: '/favorites', component: () => import('../Pages/user/Favorites.vue'), name: 'favorites' },
    { path: '/myalbums', component: () => import('../Pages/user/Myalbums.vue'), name: 'myalbums' },
    { path: '/myartists', component: () => import('../Pages/user/Myartists.vue'), name: 'myartists' },
];

export default routes;
