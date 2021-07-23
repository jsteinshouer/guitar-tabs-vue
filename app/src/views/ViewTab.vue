<template>
	<v-card>
		<!-- <v-card-title>{{tab.title}}</v-card-title> -->
		<v-card-text>
			<pre>{{tab.content}}</pre>
		</v-card-text>
	</v-card>
</template>

<script>
export default {
	data() {
		return {
			id: this.$route.params.id
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
		this.$store.commit("setCurrentTab", {tablaureID: 0, title: "", content: ""});
		this.$store.dispatch("getTab", {id: this.id});
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