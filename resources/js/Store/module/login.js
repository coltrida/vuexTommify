import help from '../../help';

const state = () => ({
    token: sessionStorage.getItem('user-token') || '',
    messaggioErroreEmail: [],
    messaggioErrorePassword: [],
    user: {},
    myArtists:[],
});

const getters = {
    getLogged: state => !!state.token,

    getToken(state) {
        return state.token;
    },

    getMyArtists(state) {
        return state.myArtists;
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

};

const actions = {
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
            'category': payload.category,
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
        state.user = payload.user
        state.myArtists = payload.user.artistsales
    },

    loginError(state, payload) {
        if (payload.response.data.errors['email']){
            state.messaggioErroreEmail = payload.response.data.errors['email']
        }
        if (payload.response.data.errors['password']){
            state.messaggioErrorePassword = payload.response.data.errors['password']
        }
    },

    logout(state) {
        sessionStorage.removeItem('user-token');
        state.token = '';
        state.user = {}
    },

    resetMessaggio(state) {
        state.messaggio = '';
    },

    fetchUserFromToken(state, payload) {
        state.user = payload;
        state.myArtists = payload.artistsales
    }
};

export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}
