<template>
	<div>
	<v-card>
		<!-- <v-card-title>{{tab.title}}</v-card-title> -->
		<v-skeleton-loader v-if="loading" type="article"></v-skeleton-loader>
		<v-card-text>
			<pre>{{tab.content}}</pre>
		</v-card-text>
		<v-card-actions>
		</v-card-actions>
	</v-card>
	<div class="my-2" v-if="!loading">
		<v-btn
			elevation="2"
			color="error"
			@click="deleteTab"
		>
			<v-icon left>delete</v-icon>
			DELETE
		</v-btn>
	</div>
</div>
</template>

<script>
export default {
	data() {
		return {
			id: this.$route.params.id,
			loading: true
		}
	},
	computed: {
		tab() {
			return this.$store.state.currentTab;
		}
	},
	watch: {
		'$route': function(to) {
			this.id = to.params.id;
			this.$store.commit("setCurrentTab", {tablaureID: 0, title: "", content: ""});
			this.$store.dispatch("getTab", {id: this.id});
		},

	},
	created() {
		let vm = this;
		this.$store.commit("setCurrentTab", {tablaureID: 0, title: "", content: ""});
		this.$store.dispatch("getTab", {id: this.id})
			.then(() => {
				vm.loading = false;
			})
			.catch(error => {
				console.log(error);
			});
	},
	methods: {
		deleteTab() {
			this.$store.dispatch("deleteTab", {id: this.id})
				.then(() => {
					this.$router.push( { name: "home" });
				})
				.catch(error => {
					console.log(error);
				});
		}
	}
}
</script>

<style scoped>
	pre {
		font-family: monospace;
		font-size: 1.2em;
		line-height: normal;
		letter-spacing: normal;
		color: white;
	}
</style>