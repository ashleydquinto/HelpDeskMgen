<template>

  <v-app id="inspire">
  <HeaderApp v-if="loggedin=='true'" :name="name_of_user"/>
  <SideBar v-if="loggedin=='true' " :logout="getLoggedOut" :role="user_role"/>
  <LoginPage v-if="loggedin=='false' || loggedin==null || loggedin=='null'" :getlogin="getstatus"/>
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
          getSession() {
            if (localStorage.getItem('ses') != '' || localStorage.getItem('ses') != undefined) {
              let val = localStorage.getItem('ses');
              let val2 = localStorage.getItem('uRole');
              
              this.loggedin = val;
              this.user_role = val2;
            }
            
          },
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
                              localStorage.setItem('ses', 'true');
                              localStorage.setItem('uRole', response.data.role);
                              localStorage.setItem('name', response.data.name);
                              localStorage.setItem('id', response.data.id);
                              
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
            
            this.loggedin = "false";
            localStorage.setItem('ses', 'false');
            localStorage.setItem('name', '');
            localStorage.setItem('uRole', '');
            localStorage.setItem('id', '');
            this.name_of_user = "";
            this.user_role = "";
            
            alert('You have logged out of the system')
          }
        },
        
        created: function(){
          
          this.getSession();
        }
}
</script>