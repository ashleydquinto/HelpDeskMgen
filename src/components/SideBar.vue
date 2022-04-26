<template>
    <v-navigation-drawer style="background-color: #2d78b1" v-model="drawer" app>
      <v-sheet
        class="pa-7 bg-primary"
      >
        <div class="text-center">
        <v-icon color="white">mdi-help-box</v-icon> 
        <h2 class="white-text">HELPDESK</h2>
        </div>
      </v-sheet>
      <v-divider></v-divider>
      <v-list fill-height>

        <h5 class="ml-3 pt-3 pb-1 white-text">GENERAL</h5>

        <v-list-item to="/">
          <v-list-item-icon>
            
            <v-icon color="white">mdi-view-dashboard</v-icon>

          </v-list-item-icon>
            
          
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">Dashboard</v-list-item-title>
          </v-list-item-content>

          
        </v-list-item>

        <v-list-item to="/TicketApp">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-ticket-confirmation</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">Ticket</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list><h5 v-if="role == 'Administrator' || role == 'Manager' || role == 'Engineer'" class="ml-3 white-text">MSP</h5></v-list>

        <v-list-item to="/ForSupport"  v-if="role == 'Administrator' || role == 'Manager' || role == 'Engineer'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-face-agent</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">For Support</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item to="/GraphicalReport" v-if="role == 'Administrator'|| role == 'Manager'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-chart-line</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">Graphical Report</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
          <v-list-item to="/ExportReport" v-if="role == 'Administrator'|| role == 'Manager'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-file-export</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">Export Report</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list  v-if="role == 'Administrator'"><h5 class="ml-3 white-text">ADMINISTRATOR</h5></v-list>
        <v-list-item to="/UsersApp" v-if="role == 'Administrator'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-account-multiple</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">Users</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item to="/CategoryApp" v-if="role == 'Administrator'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-newspaper-variant</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">Issue Category</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
      
      <template v-slot:append>
        <v-list class="pl-4 pb-4" fill-height>
          <v-menu>
            <template v-slot:activator="{ on, attrs }">
              <v-icon
                dark
                v-bind="attrs"
                v-on="on"
              >
                mdi-power
              </v-icon>
            </template>
            <v-list>
              <v-list-item
                link
              >
                <v-list-item-title v-on:click="logout(logkey)">Logout</v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>
        </v-list>
      </template>
    </v-navigation-drawer>
</template>

<script>
    export default {
        data: () => ({
          logkey:"false",
      items: [
        { title: 'Logout' },
      ],
    }),
        props:{/*"drawer",*/ 
          logout:Function,
          role:String
        },
        name: "SideBar",

       
        }
    
</script>


<style scoped>
  .bg-primary{
    background-color: #1e6097;
    }
  .white-text {
    color: white;
  }
  .bg-secondary {
    background-color: #2d78b1;
  }
  .red_list .v-list-item-group .v-list-item--active{
  background-color: #1e6097;
  color: white;
} 
</style>