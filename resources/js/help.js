const help = () => {
    let base = '';
    if(window.location.host === 'vuextommify.test'){
        //console.log('locale');
        base = 'http://vuextommify.test/api/';
    } else {
        //console.log('web');
        base = 'https://www.centrouditogroup.it/api/';
    }
    return {
        linkusers: base+'users',
        linkuserspaginate: base+'usersPaginate?page=',
        linkregister: base+'auth/register',
        linklogin: base+'auth/login',
        linklogout: base+'auth/logout',
        linkgetuserfromtoken: base+'getUserFromToken',
        linkgetallartists: base+'getAllArtists',
        linkgetartistwithalbums: base+'getArtistWithAlbums',
        linkgetartistwithmyalbums: base+'getArtistWithMyAlbums',
        linkfinduser: base+'findUser',
        linkfindartist: base+'findArtist',
        linkfindalbum: base+'findAlbum',
        linkstatisticfirstthreealbumsales: base+'statisticFirstThreeAlbumSales',
        linkgetalbums: base+'albums',
        linkdeleteuser: base+'deleteUser',
        linkdeleteartist: base+'deleteArtist',
        linkdeletealbum: base+'deleteAlbum',
        linkgetalbumwithsongs: base+'getSongsOfAlbum',
        linkdeletesong: base+'deleteSong',
        linkaddalbum: base+'album/create',
        linkaddsong: base+'album/create/addSong',
    };
};
export default help;
