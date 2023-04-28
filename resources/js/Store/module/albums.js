import help from "../../help";

const state = () => ({
    allAlbums:[],
    albumsOfArtist: [],
    firstThreeAlbumSales: [],
});

const getters = {
    getAllAlbums(state){
        return state.allAlbums;
    },

    getAlbumsOfArtists(state){
        return state.albumsOfArtist;
    },

    getFirstThreeAlbumSales(state){
        return state.firstThreeAlbumSales;
    },
};

const actions = {
    async fetchAllAlbums({commit}){
        const response = await axios.get(`${help().linkgetalbums}`, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('fetchAllAlbums', response.data);
    },

    async findAlbum({commit}, payload){
        const response = await axios.post(`${help().linkfindalbum}`, payload, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('findAlbum', response.data);
    },

    /*async fetchAlbumsOfArtists({commit}){
        const response = await axios.get(`${help().linkgetallartists}`);
        commit('fetchAllArtists', response.data);
    },*/

    async fetchStatisticFirstThreeAlbumSales({commit}){
        const response = await axios.get(`${help().linkstatisticfirstthreealbumsales}`, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('fetchStatisticFirstThreeAlbumSales', response.data);
    },

    async deleteAlbum({commit}, idAlbum){
        await axios.delete(`${help().linkdeletealbum}` + '/' + idAlbum, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('deleteAlbum', idAlbum);
    },
};

const mutations = {
    fetchAllAlbums(state, payload){
        state.allAlbums = payload;
    },

    findAlbum(state, payload){
        state.allAlbums = payload;
    },

    /*fetchAlbumsOfArtists(state, payload){
        state.allArtists = payload;
    },*/

    fetchStatisticFirstThreeAlbumSales(state, payload){
        state.firstThreeAlbumSales = payload;
    },

    deleteAlbum(state, idAlbum){
        state.allAlbums = state.allAlbums.filter(u => u.id !== idAlbum);
    }
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
