import help from "../../help";

const state = () => ({
    visibile:false,
    playShuffleAllArtists:false,
    playShuffleAlbumsOfArtist:false,
    playShuffleOfAlbum:false,
    playSong:false,
    idArtistPlay:0,
    idAlbumPlay:0,
    nameOfSongPlayed:'',
    playList:[],
    audio:{}
});

const getters = {
    getNameOfSongPlayed(state){
        return state.nameOfSongPlayed;
    },

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

    runPlayShuffleAlbumsOfArtist(state, artistWithAlbums) {
        state.playShuffleAlbumsOfArtist = !state.playShuffleAlbumsOfArtist;
        state.idArtistPlay = artistWithAlbums.id;
        if (state.visibile === false){
            state.visibile = true;
        }
        if (!state.audio.src){
            state.audio = new Audio();
        }
        artistWithAlbums.albums.forEach(album => {
            state.playList.push(...album.songs)
        });

        let i = 0;
        state.audio.meta = state.playList[i].id;
        state.nameOfSongPlayed = state.playList[i].name;
        state.audio.src = '/storage/songs/'+state.playList[i].id + '.mp3';
        state.audio.play();
        state.playSong = true;

        state.audio.onended = function() {
            i++;
            state.audio.meta = state.playList[i].id;
            state.nameOfSongPlayed = state.playList[i].name;
            state.audio.src = '/storage/songs/'+state.playList[i].id + '.mp3';
            state.audio.play();
            state.playSong = true;
            if(i === state.playList.length-1) // this is the end of the songs.
            {
                i = -1;
            }
        };
        /*if (state.playShuffleAllArtists === true){
            state.playShuffleAllArtists = false;
        }
        if (state.playShuffleOfAlbum === true){
            state.playShuffleOfAlbum = false;
        }*/
    },

    runPlayShuffleOfAlbum(state, albumWithSongs) {
        state.playShuffleOfAlbum = !state.playShuffleOfAlbum;
        state.idAlbumPlay = albumWithSongs.id;
        if (state.visibile === false){
            state.visibile = true;
        }
        if (!state.audio.src){
            state.audio = new Audio();
        }
        state.playList = albumWithSongs.songs;

        let i = 0;
        state.audio.meta = state.playList[i].id;
        state.nameOfSongPlayed = state.playList[i].name;
        state.audio.src = '/storage/songs/'+state.playList[i].id + '.mp3';
        state.audio.play();
        state.playSong = true;

        state.audio.onended = function() {
            i++;
            state.audio.meta = state.playList[i].id;
            state.nameOfSongPlayed = state.playList[i].name;
            state.audio.src = '/storage/songs/'+state.playList[i].id + '.mp3';
            state.audio.play();
            state.playSong = true;
            if(i === state.playList.length-1) // this is the end of the songs.
            {
                i = -1;
            }
        };

/*        state.playList.forEach(song => {
            state.audio.meta = song.id;
            state.nameOfSongPlayed = song.name;
            state.audio.src = '/storage/songs/'+song.id + '.mp3';
            state.audio.play();
            state.playSong = true;
        });*/
        /*if (state.playShuffleAllArtists === true){
            state.playShuffleAllArtists = false;
        }
        if (state.playShuffleAlbumsOfArtist === true){
            state.playShuffleAlbumsOfArtist = false;
        }*/
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
        state.nameOfSongPlayed = song.name;
        state.audio.src = '/storage/songs/'+song.id + '.mp3';
        state.audio.play();
        state.playSong = true;
    },

    pauseAudio(state){
        state.audio.pause();
        state.playSong = false;
    },

    playAudio(state){
        state.audio.play();
        state.playSong = true;
    },

    destroyAudio(state){
        state.audio.pause();
        state.audio = {};
        state.playSong = false;
    },
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
