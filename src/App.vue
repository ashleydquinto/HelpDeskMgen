<template>

  <v-app id="inspire">
  <HeaderApp v-if="loggedin=='true'"/>
  <SideBar v-if="loggedin=='true'"/>
  <LoginPage v-if="loggedin=='false'" :getlogin="getstatus"/>
  <!--<TryLang v-if="loggedin==true"/>-->
  <!--<HeaderApp @handeDrawer="drawer = !drawer" />
  <SideBar :drawer="drawer" />-->
    <v-main v-if="loggedin=='true'" class="grey lighten-4">
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
import SideBar from "./components/SideBar.vue" 
import LoginPage from "./components/LoginPage.vue"; 
import axios from 'axios';
//import TryLang from "./components/may-try-lang.vue";
  export default {
    components: {HeaderApp,SideBar,LoginPage},// TryLang
    data(){
    
            return{
                
                
                loggedin:'false'
            }
        },
        methods: {
          getstatus(username,password) {
            axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/login.php',
                    {
                        username:username,
                        password:password,
                        
                    })
                    
                    .then((response)=>{
                      
                            
                            
                            

                            username ='';
                            password ='';
                            if(response.data.message != ""){
                            alert(response.data.message);
                            }
                            this.loggedin = response.data.loginstatus;
                            
                            /*
                            console.log(
                                this.formData.username,
                                this.formData.password,
                              
                            )
                            */

                            
                            
                            
                            

                        })
          
          }
        }
}
</script>