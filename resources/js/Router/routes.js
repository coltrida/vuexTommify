const routes = [
    { path: '/', component: () => import('../Pages/Home.vue'), name: 'home' },
    { path: '/login', component: () => import('../Pages/login/Login.vue'), name: 'login' },
    { path: '/register', component: () => import('../Pages/login/Register.vue'), name: 'register' },
];

export default routes;
