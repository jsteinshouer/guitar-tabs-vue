<template>
<v-card>
  <v-list two-line subheader>
    <v-subheader inset>Tabs</v-subheader>
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
            <!-- <v-list-item-sub-title>{{ tab.subtitle }}</v-list-item-sub-title> -->
          </v-list-item-content>
        </v-list-item>
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
      this.$router.push( { name: "viewTab", params: {id: id}});
    }
  }
}
</script>

