import help from "../../help";

const state = () => ({
    visibile:false,
    playShuffleAllArtists:false,
    playShuffleAlbumsOfArtist:false,
    playShuffleOfAlbum:false,
    playSong:false,
    idArtistPlay:0,
    idAlbumPlay:0,
    playList:[],
    audio:{}
});

const getters = {
    getVisibile(state){
        return state.visibile;
    },

    getIdArtistPlay(state){
        return state.idArtistPlay;
    },

    getIdAlbumPlay(state){
        return state.idAlbumPlay;
    },

    getPlayShuffleOfAlbum(state){
        return state.playShuffleOfAlbum;
    },

    getPlayShuffleAllArtists(state){
        return state.playShuffleAllArtists;
    },

    getPlayShuffleAlbumsOfArtist(state){
        return state.playShuffleAlbumsOfArtist;
    },

    getPlayList(state){
        return state.playList;
    },

    getPlaySong(state){
        return state.playSong;
    },

    getAudio(state){
        return state.audio;
    },
};

const actions = {

};

const mutations = {
    switchVisible(state) {
        state.visibile = !state.visibile;
    },

    runPlayShuffleAllArtists(state) {
        state.playShuffleAllArtists = !state.playShuffleAllArtists;
        if (state.visibile === false){
            state.visibile = true;
        }
        if (state.playShuffleAlbumsOfArtist === true){
            state.playShuffleAlbumsOfArtist = false;
        }
        if (state.playShuffleOfAlbum === true){
            state.playShuffleOfAlbum = false;
        }
    },

    runPlayShuffleAlbumsOfArtist(state, idArtist) {
        state.playShuffleAlbumsOfArtist = !state.playShuffleAlbumsOfArtist;
        state.idArtistPlay = idArtist;
        if (state.visibile === false){
            state.visibile = true;
        }
        if (state.playShuffleAllArtists === true){
            state.playShuffleAllArtists = false;
        }
        if (state.playShuffleOfAlbum === true){
            state.playShuffleOfAlbum = false;
        }
    },

    runPlayShuffleOfAlbum(state, idAlbum) {
        state.playShuffleOfAlbum = !state.playShuffleOfAlbum;
        state.idAlbumPlay = idAlbum;
        if (state.visibile === false){
            state.visibile = true;
        }
        if (state.playShuffleAllArtists === true){
            state.playShuffleAllArtists = false;
        }
        if (state.playShuffleAlbumsOfArtist === true){
            state.playShuffleAlbumsOfArtist = false;
        }
    },

    switchPlaySong(state) {
        state.playSong = !state.playSong;
    },

    fetchPlayList(state, payload) {
        state.playList = payload;
    },

    setAudio(state, song) {
        if (!state.audio.src){
            state.audio = new Audio();
        }
        state.audio.meta = song.id;
        state.audio.src = '/storage/songs/'+song.id + '.mp3';
        state.audio.play();
    },

    pauseAudio(state){
        state.audio.pause();
    },

    playAudio(state){
        state.audio.play();
    },

    destroyAudio(state){
        state.audio.pause();
        state.audio = {};
    },
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
