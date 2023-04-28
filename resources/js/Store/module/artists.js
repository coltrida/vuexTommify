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

    async findArtist({commit}, payload){
        const response = await axios.post(`${help().linkfindartist}`, payload);
        commit('findArtist', response.data);
    },

    async deleteArtist({commit}, idArtist){
        await axios.delete(`${help().linkdeleteartist}` + '/' + idArtist, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('deleteArtist', idArtist);
    },

    async deleteAlbumOfArtist({commit}, payload){
        await axios.delete(`${help().linkdeletealbum}`+ '/' + payload.idAlbum, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('deleteAlbumOfArtist', payload);
    },

    async deleteSongOfAlbumOfArtist({commit}, payload){
        await axios.delete(`${help().linkdeletesong}`+ '/' + payload.idSong, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('deleteSongOfAlbumOfArtist', payload);
    },
};

const mutations = {
    fetchAllArtists(state, payload){
        state.allArtists = payload;
    },

    fetchArtistWithAlbums(state, payload){
        state.artistWithAlbums = payload;
    },

    findArtist(state, payload){
        state.allArtists = payload;
    },

    deleteArtist(state, idArtist){
        state.allArtists = state.allArtists.filter(u => u.id !== idArtist);
    },

    deleteAlbumOfArtist(state, payload){
        state.allArtists.find(u => u.id === payload.idArtist).albums =
            state.allArtists.find(u => u.id === payload.idArtist).albums.filter(u => u.id !== payload.idAlbum);
    },

    deleteSongOfAlbumOfArtist(state, payload){
        state.allArtists.find(u => u.id === payload.idArtist).albums.find(v => v.id === payload.idAlbum).songs =
            state.allArtists.find(u => u.id === payload.idArtist).albums.find(v => v.id === payload.idAlbum).songs.filter(u => u.id !== payload.idSong);
    }
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
