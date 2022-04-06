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
      <v-list>

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

        <v-list><h5 class="ml-3 white-text">MSP</h5></v-list>

        <v-list-item to="/ForSupport">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-face-agent</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">For Support</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item to="/GraphicalReport">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-chart-line</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">Graphical Report</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
          <v-list-item to="/ExportReport">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-file-export</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">Export Report</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list><h5 class="ml-3 white-text">ADMINISTRATOR</h5></v-list>
        <v-list-item to="/UsersApp">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="white">mdi-account-multiple</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="white-text">Users</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
</template>

<script>
    export default {
        props:"drawer",
        name: "SideBar",
        data(){
            return{
              //data here
            }
        }
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