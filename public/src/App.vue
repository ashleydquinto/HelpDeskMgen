<template>

  <!--This is the main component, this is where the output is shown for all the other components-->
  <v-app id="inspire">
  <HeaderApp v-if="loggedin==true"/>
  <SideBar v-if="loggedin==true"/>
  <LoginPage v-if="loggedin==false"/>
    <v-main v-if="loggedin==true" class="grey lighten-4">
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
import LoginPage from "./components/LoginPage.vue";

//Javascript
  export default {
    components: {SideBar, HeaderApp, LoginPage},
    data: () => ({
      "loggedin":true
    }),
}
</script>