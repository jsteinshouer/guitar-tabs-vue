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
		deleteTab(state, payload) {
			state.tabs = state.tabs.filter(function(value){ 
				return value == payload.tablatureID;
			});
		},
		setTabs(state, payload) {
			state.tabs = payload;
			state.toolbarTitle = "My Tabs";
		},
		setCurrentTab(state, payload) {
			state.currentTab = payload;
			state.toolbarTitle = payload.title;
		},
		setToolbarTitle(state, payload) {
			state.toolbarTitle = payload;
		}
	},
	actions: {
		createTab( context, payload ) {

			return new Promise((resolve, reject) => { 
				Vue.http.post('/tablature', payload)
					.then(response => {
			
						context.commit("addTab", response.data.data );

						resolve(response.data.data);
					}, error => {
						reject(error);
					});
			});
		},
		deleteTab( context, payload ) {

			return new Promise((resolve, reject) => { 
				Vue.http.delete('/tablature/' + payload.id)
					.then(response => {
						console.log(response )
						context.commit("deleteTab", { tablatureID: payload.id } );

						resolve(response.data.data);
					}, error => {
						reject(error);
					});
			});
		},
		getTabs( context ) {

			Vue.http.get('/tablature')
				.then(response => {
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
