import help from '../../help';

const state = () => ({
    token: sessionStorage.getItem('user-token') || '',
    username: sessionStorage.getItem('username') || '',
    idUser: sessionStorage.getItem('idUser') || '',
    messaggioErroreEmail: [],
    messaggioErrorePassword: [],
    ruolo: sessionStorage.getItem('rl') || '',
    user: {}
});

const getters = {
    getLogged: state => !!state.token,

    getIdUser(state) {
        return state.idUser;
    },

    getToken(state) {
        return state.token;
    },

    getUsername(state) {
        return state.username;
    },

    getMessaggioErroreEmail(state) {
        return state.messaggioErroreEmail;
    },

    getMessaggioErrorePassword(state) {
        return state.messaggioErrorePassword;
    },

    getUser(state) {
        return state.user;
    },

    getRuolo(state) {
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

    login({commit}, payload) {
        axios.post(`${help().linklogin}`, {
            'email': payload.email,
            'password': payload.password,
        }).then(response => commit('loginOk', response.data)).catch(error => commit('loginError', error));
    },

    register({commit}, payload) {
        axios.post(`${help().linkregister}`, {
            'email': payload.email,
            'name': payload.name,
            'password': payload.password,
            'role': payload.role,
        }).then(response => commit('loginOk', response.data)).catch(error => commit('loginError', error));
    },

    async logout({commit}, token) {
        await axios.get(`${help().linklogout}` + '/' + token, {
            headers: {
                'Authorization': `Bearer ` + sessionStorage.getItem('user-token')
            }
        });
        commit('logout');
    },

    async resetMessaggio({commit}) {
        commit('resetMessaggio');
    },

    async fetchUserFromToken({commit}, token) {
        const response = await axios.get(`${help().linkgetuserfromtoken}` + '/' + token, {
            headers: {
                'Authorization': `Bearer ` + sessionStorage.getItem('user-token')
            }
        });
        commit('fetchUserFromToken', response.data);
    },
};

const mutations = {
    loginOk(state, payload) {
        sessionStorage.setItem('user-token', payload.token);
        state.token = sessionStorage.getItem('user-token');
    },

    loginError(state, payload) {
        //console.log(payload.response.data.errors)
        if (payload.response.data.errors['email']){
            state.messaggioErroreEmail = payload.response.data.errors['email']
        }
        if (payload.response.data.errors['password']){
            state.messaggioErrorePassword = payload.response.data.errors['password']
        }
    },

    logout(state) {
        sessionStorage.removeItem('user-token');
        sessionStorage.removeItem('username');
        sessionStorage.removeItem('idUser');
        sessionStorage.removeItem('rl');
        state.token = '';
        state.username = '';
    },

    resetMessaggio(state) {
        state.messaggio = '';
    },

    fetchUserFromToken(state, payload) {
        state.user = payload;
    }
};

export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}
