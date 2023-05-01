import help from "../../help";

const state = () => ({
    visibile:false,
    playSong:false,
    playList:[],
    audio:[]
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

    setAudio(state) {
        state.audio = [];
        state.audio.cancel();
        for (let index=0; index<state.playList.length; index++){
            state.audio[index] = new Audio();
            state.audio[index].src = '/storage/songs/'+state.playList[index].id + '.mp3';
            state.audio[index].play();
        }
    },
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
