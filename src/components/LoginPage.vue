<!-- GAWA NI ASH


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

-->

<template>

  <v-container class='primary-color' fill-height fluid >

      <v-row align="center" justify="center" >
          <v-col cols="12" sm="10">
            <v-card class="elevation-6"  >
             <v-window>
                <v-window-item>
                  <v-row>
                    <v-col cols="12" md="6" class="trial rounded-br-xl">
                       <v-container fill-height fluid>
                        <v-img
                        max-height="400"
                        max-width="400"
                        src="../assets/mgen-logo.png"
                        class="mx-auto"
                        ></v-img>
                     </v-container>
                    </v-col>
                    <v-col cols="12" md="6" class="" >
                    <div style="  text-align: center; padding: 25% 0;">

                       <!--
                      <v-card-text class="white--text" >
                        <h3 class="text-center ">Don't Have an Account Yet?</h3>
                        <h6
                          class="text-center"
                        >Let's get you all set up so you can start creating your your first<br>  onboarding experience</h6>
                      </v-card-text>
                      -->
                      <!--
                      <div class="text-center">
                        <v-btn tile outlined dark @click="step++">SIGN UP</v-btn>
                      </div>
                      -->
                      <v-card-text>
                        <h1
                          class="text-center"
                        >Login in to Your Account</h1>
                        
                        <br>

                        <h3
                          class="text-center grey--text "
                        >Log in to your account so you can continue builiding <br>and editing your onboarding flows</h3>
                        <v-row align="center" justify="center">
                          <v-col cols="12" sm="8">
                           
                          <v-text-field
                           v-model="FormData.username"
                            label="Username"
                            outlined
                            dense
                            color="blue"
                            autocomplete="false"
                           class="mt-5"
                          />
                          <v-text-field
                           v-model="FormData.password"
                            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                            :rules="[rules.required, rules.min]"
                            :type="show1 ? 'text' : 'password'"
                            name="input-10-1"
                            label="Password"
                            outlined
                            dense
                            color="blue"
                            autocomplete="false"
                            @click:append="show1 = !show1"
                          
                          />
                            
                          <v-btn type="submit" v-on:click="getlogin(FormData.username,FormData.password)" color="#2d78b1" dark block tile>Log in</v-btn>
                     
                         
                         
                          </v-col>
                        </v-row>  
                      </v-card-text>


                      </div>
                    </v-col>
                  </v-row>
                </v-window-item>
                
              </v-window>
            </v-card>
          </v-col>
      </v-row>
  </v-container>
</template>


<!--

GAWA ULIT NI ASH

<script>
export default {

};
</script>

<style scoped>
  .bg-primary{
    background-color: #1e6097;
    
} 
</style>
--> 


<script>

import axios from 'axios'
  export default {
  name: 'LoginPage',

  data(){
    
            return{
              show1: false,
              show2: true,
              show3: false,
              show4: false,
            rules: {
          required: value => !!value || 'Required.',
          min: v => v.length >= 8 || 'Min 8 characters',
          emailMatch: () => (`The email and password you entered don't match`),
        },
                FormData:{
                    username:"",
                    password:""
                    
                },
                loggedin: "false"
            }
        },
        props: {
          
          getlogin:Function
          
        },
        methods: {
          submitData: function(){
            
            axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/login.php',
                    {
                        username:this.FormData.username,
                        password:this.FormData.password,
                        
                    })
                    
                    .then((response)=>{
                      
                            
                            
                            

                            this.FormData.username ='';
                            this.FormData.password ='';
                            this.loggedin = "true";
                            
                            /*
                            console.log(
                                this.formData.username,
                                this.formData.password,
                              
                            )
                            */

                            
                            alert(response.data.message);
                            
                            

                        })
          }
        }
    
  }
</script>
<style scoped>
.v-application .rounded-bl-xl {
    border-bottom-left-radius: 300px !important;
}
.v-application .rounded-br-xl {
    border-bottom-right-radius: 300px !important;
}
.trial{
   background-image: url(../assets/sample-lang2_blurred_bnw.png);
}
.primary-color{
   background-color: #1e6097;
}
.secondary-color {
    background-color: #2d78b1;
  }
</style>
