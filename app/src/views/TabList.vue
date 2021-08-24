<template>
<v-card>
  <v-card-title>Tabs</v-card-title>
  <v-list two-line subheader>
    <div v-if="loading"> 
      <v-skeleton-loader v-for="n in loaderItemCount" :key="n" type="list-item-avatar"></v-skeleton-loader>
    </div>
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
      loading: false,
      loaderItemCount: 0
    }
  },
  computed: {
    tabs() {
      return this.$store.state.tabs;
    }  
  },
  created() {
    this.loaderItemCount = this.tabs.length > 0 ? this.tabs.length : 3;
    var vm = this;
    vm.loading = true;
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

