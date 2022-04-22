<template>
    <v-app-bar app
      color="white"
      elevate-on-scroll
      elevation="4"
    >
      <!--<v-app-bar-nav-icon @click="$emit('handeDrawer')"></v-app-bar-nav-icon>-->

      <v-spacer></v-spacer>

      <h4 v-if="name != ''" class=" mx-5 mr-10 font-italic primary-text">Welcome, {{name}}</h4>
      <h4 v-if="name == ''" class=" mx-5 mr-10 font-italic primary-text">Welcome, {{user}}</h4>
      
    </v-app-bar>
</template>

<script>

export default{
  name:'HeaderApp',

  data(){
    return{
      user:'User 1',
    }
  },
  props:{
    name
  }

}
  
   
</script>

<style scoped>
  .primary-text {
    color: #1e6097;
  }
</style>

