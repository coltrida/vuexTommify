import help from "../../help";

const state = () => ({
    visibile:false,
    playSong:false,
    playList:[],
    audio:{}
});

const getters = {
    getVisibile(state){
        return state.visibile;
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
    }
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
