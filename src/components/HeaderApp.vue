<template>
    <v-app-bar app
      color="white"
      elevate-on-scroll
      elevation="4"
    >
      <!--<v-app-bar-nav-icon @click="$emit('handeDrawer')"></v-app-bar-nav-icon>-->

      <v-spacer></v-spacer>

      <v-menu>
        <template v-slot:activator="{ on, attrs }">
          <span v-bind="attrs" v-on="on" class="mx-5 mr-10">
              <h4 class="font-italic primary-text">Welcome, Ashley Quinto</h4>
          </span>
        </template>
      </v-menu>
    </v-app-bar>
</template>

<script>
   
</script>

<style scoped>
  .primary-text {
    color: #1e6097;
  }
</style>

