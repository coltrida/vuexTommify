import help from "../../help";

const state = () => ({
    songs: [],
});

const getters = {
    getSongs(state){
        return state.songs;
    },
};

const actions = {
    async fetchSongsOfAlbum({commit}, idAlbum){
        const response = await axios.get(`${help().linkusers}`, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('fetchSongsOfAlbum', response.data);
    },
};

const mutations = {
    fetchSongsOfAlbum(state, payload){
        state.songs = payload;
    },
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
