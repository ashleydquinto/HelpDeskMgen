import Vue from 'vue'
import VueRouter from 'vue-router'
import ForSupport from '../views/ForSupport.vue'
import TicketApp from '../views/TicketApp.vue'
import ExportReport from '../views/ExportReport.vue'
import GraphicalReport from '../views/GraphicalReport.vue'
import UsersApp from '../views/UsersApp.vue'




Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'DashboardApp',
    component: ()=> import('../views/DashboardApp.vue')
  },
  {
    path: '/ForSupport',
    name: 'ForSupport',
    component: ForSupport
  },
  {
    path: '/TicketApp',
    name: 'TicketApp',
    component:TicketApp
  },
  {
    path: '/ExportReport',
    name: 'ExportReport',
    component:ExportReport
  },
  {
    path: '/GraphicalReport',
    name: 'GraphicalReport',
    component:GraphicalReport
  },
  {
    path: '/UsersApp',
    name: 'UsersApp',
    component:UsersApp
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
