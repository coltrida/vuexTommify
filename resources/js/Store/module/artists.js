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

    async fetchAllArtistsPaginate({commit}, page){
        const response = await axios.get(`${help().linkgetallartistspaginate}` + page);
        commit('fetchAllArtists', response.data);
    },

    async fetchArtistWithAlbums({commit}, idArtist ){
        const response = await axios.get(`${help().linkgetartistwithalbums}` + '/' + idArtist);
        commit('fetchArtistWithAlbums', response.data);
    },

    async fetchArtistWithMyAlbums({commit}, payload){
        const response = await axios.get(`${help().linkgetartistwithmyalbums}` + '/' + payload.idArtist + '/' + payload.idUser, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
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

    async addAlbumOfArtist({commit}, payload){
        const config = {
            headers: {
                'content-type': 'multipart/form-data' ,
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        };
        let formData = new FormData();
        formData.append('cover', payload.fileUp);
        formData.append('name', payload.name);
        formData.append('cost', payload.cost);
        formData.append('artist_id', payload.artist_id);

        const response = await axios.post(`${help().linkaddalbum}`, formData, config);
        commit('addAlbumOfArtist', response.data);
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
    },

    addAlbumOfArtist(state, payload){
        state.artistWithAlbums.albums.unshift(payload);
    }
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
