<template>
<v-card>
  <v-card-title>Tabs</v-card-title>
  <v-list two-line subheader>
      <v-skeleton-loader type="list-item-avatar" v-if="loading"></v-skeleton-loader>
      <v-skeleton-loader type="list-item-avatar" v-if="loading"></v-skeleton-loader>
      <v-skeleton-loader type="list-item-avatar" v-if="loading"></v-skeleton-loader>
    <div v-if="!loading"> 
     <v-list-item
          v-for="tab in tabs"
          :key="tab.tablatureID"
          @click="viewTab(tab.tablatureID)"
        >
          <v-list-item-avatar>
            <v-icon class="grey lighten-1 white--text">music_note</v-icon>
          </v-list-item-avatar>

          <v-list-item-content>
            <v-list-item-title>{{ tab.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
    </div>
  </v-list>
</v-card>
</template>

<script>
export default {
  data() {
    return {
      loading: false
    }
  },
  computed: {
    tabs() {
      return this.$store.state.tabs;
    }  
  },
  created() {
    var vm = this;
    if ( this.tabs.length > 0 ) {
      vm.loading = true;
    }
    this.$store.dispatch('getTabs')
      .then(() => {
        vm.loading = false;
      })
      .catch(error => {
        console.log(error);
			});
  },
  methods: {
    viewTab( id ) {
      this.$router.push( { name: "viewTab", params: {id: id}});
    }
  }
}
</script>

