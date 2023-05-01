import help from "../../help";

const state = () => ({
    allAlbums:[],
    albumsOfArtist: [],
    firstThreeAlbumSales: [],
    albumWithSongs:{}
});

const getters = {
    getAllAlbums(state){
        return state.allAlbums;
    },

    getAlbumWithSongs(state){
        return state.albumWithSongs;
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

    async fetchAlbumWithSongs({commit}, idAlbum ){
        const response = await axios.get(`${help().linkgetalbumwithsongs}` + '/' + idAlbum);
        commit('fetchAlbumWithSongs', response.data);
    },

    async addSong({commit}, payload){
        const config = {
            headers: {
                'content-type': 'multipart/form-data' ,
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        };
        let formData = new FormData();
        formData.append('music', payload.fileUp);
        formData.append('name', payload.name);
        formData.append('cost', payload.cost);
        formData.append('album_id', payload.album_id);

        const response = await axios.post(`${help().linkaddsong}`, formData, config);
        commit('addSong', response.data);
    },

    async deleteSongOfAlbum({commit}, payload){
        await axios.delete(`${help().linkdeletesong}`+ '/' + payload.idSong, {
            headers: {
                'Authorization': `Bearer `+ sessionStorage.getItem('user-token')
            }
        });
        commit('deleteSongOfAlbum', payload);
    },
};

const mutations = {
    fetchAllAlbums(state, payload){
        state.allAlbums = payload;
    },

    fetchAlbumWithSongs(state, payload){
        state.albumWithSongs = payload;
    },

    findAlbum(state, payload){
        state.allAlbums = payload;
    },

    fetchStatisticFirstThreeAlbumSales(state, payload){
        state.firstThreeAlbumSales = payload;
    },

    deleteAlbum(state, idAlbum){
        state.allAlbums = state.allAlbums.filter(u => u.id !== idAlbum);
    },

    addSong(state, payload){
        state.albumWithSongs.songs.unshift(payload)
    },

    deleteSongOfAlbum(state, payload){
        state.allAlbums.find(u => u.id === payload.idAlbum).songs =
            state.allAlbums.find(u => u.id === payload.idAlbum).songs.filter(v => v.id !== payload.idSong)
    },
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
