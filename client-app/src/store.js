import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
	state: {
		tabs: [],
		currentTab: {
			tablatureID: 0,
			title: "",
			content: ""
		},
		toolbarTitle: "My Tabs"
	},
	mutations: {
		addTab(state, payload) {
			state.tabs.push( payload );
		},
		setTabs(state, payload) {
			state.tabs = payload;
			state.toolbarTitle = "My Tabs";
		},
		setCurrentTab(state, payload) {
			state.currentTab = payload;
			state.toolbarTitle = payload.title;
		}
	},
	actions: {
		createTab( context, payload ) {

			Vue.http.post('/tablature', payload)
				.then(response => {
					// console.log(response);
					context.commit("addTab", response.data.data );
				}, error => {
					console.log(error);
				});
		},
		getTabs( context ) {

			Vue.http.get('/tablature')
				.then(response => {
					// console.log(response);
					context.commit("setTabs", response.data.data );
				}, error => {
					console.log(error);
				});
		},
		getTab( context, payload ) {

			Vue.http.get('/tablature/' + payload.id )
				.then(response => {
					// console.log(response);
					context.commit("setCurrentTab", response.data.data );
				}, error => {
					console.log(error);
				});
		}
	}
})
