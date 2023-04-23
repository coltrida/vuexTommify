import help from "../../help";

const state = () => ({
    users: [],
});

const getters = {
    getUsers(state){
        return state.users;
    },
};

const actions = {

    async fetchUsers({commit}){
        /*const response = await axios.get(`${help().linkaudiometrie}`, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });*/
        const response = await axios.get(`${help().linkusers}`);
        commit('fetchUsers', response.data);
    },
};

const mutations = {
    fetchUsers(state, payload){
        state.users = payload;
    },
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
