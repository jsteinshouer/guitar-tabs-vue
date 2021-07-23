<template>
<v-card>
  <v-list two-line subheader>
    <v-subheader inset>Tabs</v-subheader>
     <v-list-tile
          v-for="tab in tabs"
          :key="tab.tablatureID"
          avatar
          @click="viewTab(tab.tablatureID)"
        >
          <v-list-tile-avatar>
            <v-icon class="grey lighten-1 white--text">music_note</v-icon>
          </v-list-tile-avatar>

          <v-list-tile-content>
            <v-list-tile-title>{{ tab.title }}</v-list-tile-title>
            <!-- <v-list-tile-sub-title>{{ tab.subtitle }}</v-list-tile-sub-title> -->
          </v-list-tile-content>
        </v-list-tile>
  </v-list>
</v-card>
</template>

<script>
export default {
  data() {
    return {
      
    }
  },
  computed: {
    tabs() {
      return this.$store.state.tabs;
    }  
  },
  created() {
    this.$store.dispatch('getTabs');
  },
  methods: {
    viewTab( id ) {
      console.log("view tab");
      this.$router.push( { name: "viewTab", params: {id: id}});
    }
  }
}
</script>

