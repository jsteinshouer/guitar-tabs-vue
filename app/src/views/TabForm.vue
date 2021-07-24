<template>
  <v-flex xs12>
	<v-card class="lighten-5">
		<v-card-title primary-title>
			<div class="headline">Add Tab</div>
		</v-card-title>
		<v-card-text>
		<v-flex xs6>
			<v-text-field
			box
			name="title"
			label="Title"
			single-line
			v-model="tab.title"
			type="string"
			browser-autocomplete="off"
			></v-text-field>
		</v-flex>
		<v-textarea
			name="content"
			label="Tab"
			box
			v-model="tab.content"
			hint="Tab Content"
			rows="15"
		></v-textarea>
	</v-card-text>
		<v-card-actions>
			<v-btn @click="saveTab">Save</v-btn>
		</v-card-actions>
	</v-card>
	</v-flex>
</template>

<script>
export default {
	data() {
		return {
			tab: {
				title: "",
				content: ""
			}
		}
	},
	created() {
		this.$store.commit("setToolbarTitle", "My Tabs");
	},
	methods: {
		saveTab() {
			this.$store.dispatch('createTab', this.tab)
				.then(data => {
					this.$router.push( { name: "viewTab", params: { id: data.tablatureID } });
				})
				.catch(error => {
					console.log(error);
				});
		}
	}
}
</script>

<style scoped>
	textarea {
		font-family: monospace !important;
	}
</style>