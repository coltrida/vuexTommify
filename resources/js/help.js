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
        linkregister: base+'register',
    };
};
export default help;
