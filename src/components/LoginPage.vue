<template>
   <v-app>
      <v-content style="background-color: #1e6097">
         <v-container fluid fill-height fill-width>
            <v-layout align-center justify-center>
               <v-flex pr12 md4>
                  <v-card class="elevation-12">
                     <v-card-text>
                        <v-form>
                          <br>
                          <h2 class="text-center">
                           Login to your account
                          </h2><br>
                           <v-text-field
                              outlined
                              name="login"
                              label="Login"
                              type="text"
                           ></v-text-field>
                           <v-text-field
                              outlined
                              id="password"
                              name="password"
                              label="Password"
                              type="password"
                           ></v-text-field>
                        </v-form>
                     </v-card-text>
                     <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="primary">Login</v-btn>
                     </v-card-actions>
                  </v-card>
               </v-flex>
            </v-layout>
         </v-container>
      </v-content>
   </v-app>
</template>

<script>
export default {

};
</script>

<style scoped>
  .bg-primary{
    background-color: #1e6097;
    
} 
</style>
