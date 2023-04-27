import help from "../../help";

const state = () => ({
    visibile:false
});

const getters = {
    getVisibile(state){
        return state.visibile;
    },
};

const actions = {

};

const mutations = {
    switchShaffle(state) {
        state.visibile = !state.visibile;
    },
};

export default{
    namespaced:true,
    state,
    getters,
    actions,
    mutations
}
