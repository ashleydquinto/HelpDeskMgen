<template>

    <!-- Header Component ( Welcome, <name> )-->
    <v-app-bar app
      color="white"
      elevate-on-scroll
      elevation="4"
    >

      <v-spacer></v-spacer>

      <h4  class=" mx-5 mr-10 font-italic primary-text">Welcome, {{user}}</h4>
      
    </v-app-bar>
</template>

<script>

export default{
  name:'HeaderApp',

  data(){
    return{
      //Gets name that is locally stored
      user:localStorage.getItem('name'),
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

