import Vue from 'vue'
import Router from 'vue-router'
import TabList from './views/TabList.vue'
import TabForm from './views/TabForm.vue'
import ViewTab from './views/ViewTab.vue'
import StyleGuide from './views/StyleGuide.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'home',
      component: TabList
    },
    {
      path: '/add',
      name: 'add',
      component: TabForm
    },
    {
      path: '/tab/:id',
      name: 'viewTab',
      component: ViewTab
    },
    {
      path: '/styleguide',
      name: 'styleguide',
      component: StyleGuide
    }
  ]
})
