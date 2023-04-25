import help from "../../help";

const state = () => ({
    albumsOfArtist: [],
});

const getters = {
    getAlbumsOfArtists(state){
        return state.albumsOfArtist;
    },
};

const actions = {

    async fetchAlbumsOfArtists({commit}){
        const response = await axios.get(`${help().linkgetallartists}`);
        commit('fetchAllArtists', response.data);
    },
};

const mutations = {
    fetchAlbumsOfArtists(state, payload){
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
