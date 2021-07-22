<template>
  <div class="about">
    <h1>{{myContent}}</h1>
    <button @click="loadData()">Click</button>
  </div>
</template>

<script>
// import './plugins/axios';
import Vue from 'vue';
export default {
  data() {
    return {
      myContent: "This is an about page"
    }
  },
  methods: {
    loadData() {
      let vm = this;
      Vue.http.get("/echo").then(response => {
					// Get unique identifier
          //request.body.name
          vm.myContent = response.data.data;
					console.log(response);
				}, error => {
					console.log(error);
				});
    }
  }  
}
</script>

