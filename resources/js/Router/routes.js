const routes = [
    { path: '/', component: () => import('../Pages/Home.vue'), name: 'home' },
    { path: '/login', component: () => import('../Pages/login/Login.vue'), name: 'login' },
];

export default routes;
