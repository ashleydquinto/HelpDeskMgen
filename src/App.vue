<template>

  <v-app id="inspire">
  <HeaderApp v-if="loggedin=='true'" :name="name_of_user"/>
  <SideBar v-if="loggedin=='true' " :logout="getLoggedOut" :role="user_role"/>
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
                
                
                loggedin:'false',
                name_of_user:'',
                user_role:''
            }
        },
        methods: {
          getstatus(username,password) {
            axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/login.php',
                    {
                        username:username,
                        password:password,
                        
                    })
                    
                    .then((response)=>{
                            username ='';
                            password ='';
                            this.name_of_user = response.data.name;
                            this.user_role = response.data.role;
                            if(response.data.message == "" ||response.data.message == undefined){
                              alert("Hello, " + response.data.name + " you are logged in as a/an " + response.data.role);
                            }
                            else{
                              alert(response.data.message);
                            }
                            this.loggedin = response.data.loginstatus;

                            this.$router.push({name: 'DashboardApp'})
                            
                            /*
                            console.log(
                                this.formData.username,
                                this.formData.password,
                              
                            )
                            */
                        })
          
          },
          getLoggedOut(state){
            console.log(state);
            this.loggedin = state;
            alert('You have logged out of the system')
          }
        }
}
</script>