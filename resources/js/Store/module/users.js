import help from "../../help";

const state = () => ({
    users: {},
});

const getters = {
    getUsers(state){
        return state.users;
    },
};

const actions = {

    async fetchUsers({commit}){
        const response = await axios.get(`${help().linkusers}`, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('fetchUsers', response.data);
    },

    async fetchUsersPagination({commit}, page){
        const response = await axios.get(`${help().linkuserspaginate}` + page,{
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('fetchUsers', response.data);
    },

    async findUser({commit}, payload){
        const response = await axios.post(`${help().linkfinduser}`, payload, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('findUser', response.data);
    },

    async deleteUser({commit}, idUser){
        await axios.delete(`${help().linkdeleteuser}` + '/' + idUser, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('deleteUser', idUser);
    },
};

const mutations = {
    fetchUsers(state, payload){
        state.users = payload;
    },

    findUser(state, payload){
        state.users = payload;
    },

    deleteUser(state, idUser){
        state.users.data = state.users.data.filter(u => u.id !== idUser);
    }
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
