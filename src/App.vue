<template>
  <v-app id="inspire">
  <HeaderApp />
  <SideBar />
  <!--<HeaderApp @handeDrawer="drawer = !drawer" />
  <SideBar :drawer="drawer" />-->
    <v-main class="grey lighten-4">
      <v-container
        class="py-8 px-6"
        fluid
      >
        <router-view>

        </router-view>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import HeaderApp from "./components/HeaderApp.vue";
import SideBar from "./components/SideBar.vue";
  export default {
    components: {SideBar, HeaderApp},
    data: () => ({
        //drawer: true, 
    }),
}
</script>