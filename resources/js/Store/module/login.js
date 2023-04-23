import help from '../../help';

const state = () => ({
    token: sessionStorage.getItem('user-token') || '',
    username: sessionStorage.getItem('username') || '',
    idUser: sessionStorage.getItem('idUser') || '',
    messaggio: '',
    ruolo: sessionStorage.getItem('rl') || '',
    user: {}
});

const getters = {
    getLogged: state => !!state.token,

    getIdUser(state){
        return state.idUser;
    },

    getUsername(state){
        return state.username;
    },

    getMessaggio(state){
        return state.messaggio;
    },

    getUser(state){
        return state.user;
    },

    getRuolo(state){
        return state.ruolo;
    },

};

const actions = {
    /*async login({commit}, payload){
        const response = await axios.post(`${help().linklogin}`, {
            'email': payload.email,
            'password': payload.password
        });

        commit('login', response.data);
    },*/

    async login({commit}, payload){
        const response = await axios.get(`${help().linklogin}`+'/'+payload.email+'/'+payload.password);

        commit('login', response.data);
    },

    async register({commit}, payload){
        const response = await axios.post(`${help().linkregister}`, {
            'email': payload.email,
            'oldPassword': payload.oldPassword,
            'password': payload.password,
            'repeatpassword': payload.repeatpassword,
        });
        commit('login', response.data);
    },

    async logout({commit}, id){
        await axios.get(`${help().linklogout}`+'/'+id, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('logout');
    },

    async resetMessaggio({commit}){
        commit('resetMessaggio');
    },

    async fetchUser({commit}, id){
        const response = await axios.get(`${help().linkuser}`+'/'+id, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('fetchUser', response.data);
    },
};

const mutations = {
    login(state, payload){

        if (payload.stato === 'successo'){
            sessionStorage.setItem('user-token', payload.token);
            sessionStorage.setItem('username', payload.user.name);
            sessionStorage.setItem('idUser', payload.user.id);
            sessionStorage.setItem('rl', payload.user.ruolo_id);

            state.token = sessionStorage.getItem('user-token');
            state.username = sessionStorage.getItem('username');
            state.idUser = sessionStorage.getItem('idUser');
            state.ruolo = payload.user.ruolo.nome;
            state.messaggio = '';
        }else{
            state.messaggio = payload.message
        }
    },

    logout(state){
        sessionStorage.removeItem('user-token');
        sessionStorage.removeItem('username');
        sessionStorage.removeItem('idUser');
        sessionStorage.removeItem('rl');
        state.token = '';
        state.username = '';
    },

    resetMessaggio(state){
        state.messaggio = '';
    },

    fetchUser(state, payload){
        state.user = payload;
        state.ruolo = payload.ruolo.nome;
    }
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
