<template>
  <div id="app">
  <v-app
    dark
    id="inspire"
  >
    <v-navigation-drawer
      fixed
      clipped
      v-model="drawer"
      app
    >
      <v-list dense>
        <v-list-tile v-for="item in items" :key="item.text"  router :to="item.route" ripple active-class
>
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              {{ item.text }}
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar
      dense
      fixed
      clipped-left
      app
    >
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-icon class="mx-3">fa-youtube</v-icon>
      <v-toolbar-title class="mr-5 align-center">
        <span class="title">{{title}}</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <!-- <v-layout row align-center style="max-width: 650px">
        <v-text-field
          placeholder="Search..."
          single-line
          append-icon="search"
          :append-icon-cb="() => {}"
          color="white"
          hide-details
        ></v-text-field>
      </v-layout> -->
    </v-toolbar>
    <v-content>
      <v-container fill-height>
        <v-layout justify-center>
          <v-flex>
            <router-view></router-view>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
        <v-btn
      fab
      bottom
      right
      color="pink"
      dark
      fixed
      router to="/add"
    >
      <v-icon>add</v-icon>
    </v-btn>
  </v-app>
</div>
</template>

<script>

export default {
  name: 'App',
  data: () => ({
      drawer: true,
      items: [
        { icon: 'music_note', text: 'Browse Tabs', route: "/" },
        { icon: 'add', text: 'New Tab', route: "/add" }
      ]
    }),
    computed: {
      title() {
        return this.$store.state.toolbarTitle;
      }
    }
}
</script>
