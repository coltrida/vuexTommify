import help from "../../help";

const state = () => ({
    allArtists: [],
    artistWithAlbums:{}
});

const getters = {
    getAllArtists(state){
        return state.allArtists;
    },

    getArtistWithAlbums(state){
        return state.artistWithAlbums;
    },
};

const actions = {

    async fetchAllArtists({commit}){
        const response = await axios.get(`${help().linkgetallartists}`);
        commit('fetchAllArtists', response.data);
    },

    async fetchArtistWithAlbums({commit}, idArtist ){
        const response = await axios.get(`${help().linkgetartistwithalbums}` + '/' + idArtist);
        commit('fetchArtistWithAlbums', response.data);
    },
};

const mutations = {
    fetchAllArtists(state, payload){
        state.allArtists = payload;
    },

    fetchArtistWithAlbums(state, payload){
        state.artistWithAlbums = payload;
    },
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
