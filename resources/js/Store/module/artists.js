import help from "../../help";

const state = () => ({
    allArtists: [],
});

const getters = {
    getAllArtists(state){
        return state.allArtists;
    },
};

const actions = {

    async fetchAllArtists({commit}){
        const response = await axios.get(`${help().linkgetallartists}`);
        commit('fetchAllArtists', response.data);
    },
};

const mutations = {
    fetchAllArtists(state, payload){
        state.allArtists = payload;
    },
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
