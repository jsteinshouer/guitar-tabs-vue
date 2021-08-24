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
        <v-list-item v-for="item in items" :key="item.text"  router :to="item.route" ripple active-class
>
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>
              {{ item.text }}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar
      dense
      fixed
      clipped-left
      app
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-icon class="mx-3">fa-youtube</v-icon>
      <v-app-bar-title class="mr-5 align-center">
        <span class="title">{{title}}</span>
      </v-app-bar-title>
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
    </v-app-bar>
    <v-main>
      <v-container fill-height>
        <v-layout justify-center>
          <v-flex>
            <router-view></router-view>
          </v-flex>
        </v-layout>
      </v-container>
    </v-main>
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
