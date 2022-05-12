<template>
    <v-navigation-drawer v-model="drawer" style="background-color: white" app>
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

        <h5 class="ml-3 pt-3 pb-1 text-primary">GENERAL</h5>

        <v-list-item class="dashboard-item dashboardborder-left" to="/">
          <v-list-item-icon>
            
            <v-icon color="#00af52">mdi-view-dashboard</v-icon>

          </v-list-item-icon>
            
          
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="dashboard-color">Dashboard</v-list-item-title>
          </v-list-item-content>

          
        </v-list-item>


        <!-- this it the ticket tab
          (commented dahil di kailangan) 05-04-2022

        <v-list-item to="/TicketApp">

          <v-list-item-icon>
            <v-icon color="white">mdi-ticket-confirmation</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title class="white-text">Ticket</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        -->

        <!--tickets starts here-->

        <!--Requests-->
        <v-list-item class="request-item requestborder-left" to="/RequestPage">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="#ff6600">mdi-alpha-r-box</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="request-color">Request</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <!--Incident-->
        <v-list-item class="incident-item incidentborder-left" to="/IncidentPage">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="#0170c1">mdi-alpha-i-box</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="incident-color">Incident</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <!--Problem-->
        <v-list-item class="problem-item problemborder-left" to="/ProblemPage">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="#7030a2">mdi-alpha-p-box</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="problem-color">Problem</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list><h5 v-if="role == 'Administrator' || role == 'Manager' || role == 'Engineer'" class="ml-3 text-primary">MSP</h5></v-list>

        <v-list-item to="/ForSupport" class="msp mspborder-left" v-if="role == 'Administrator' || role == 'Manager' || role == 'Engineer'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="#bb0808">mdi-face-agent</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="msp-color">For Support</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item to="/GraphicalReport" class="msp mspborder-left" v-if="role == 'Administrator'|| role == 'Manager'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="#bb0808">mdi-chart-line</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="msp-color">Graphical Report</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
          <v-list-item to="/ExportReport" class="msp mspborder-left" v-if="role == 'Administrator'|| role == 'Manager'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="#bb0808">mdi-file-export</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="msp-color">Export Report</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list  v-if="role == 'Administrator'"><h5 class="ml-3 text-primary">ADMINISTRATOR</h5></v-list>
        <v-list-item to="/UsersApp" class="admin adminborder-left" v-if="role == 'Administrator'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="#000080">mdi-account-multiple</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="administrator-color">Users</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item to="/CategoryApp" class="admin adminborder-left" v-if="role == 'Administrator'">
          <!--icon-->
          <v-list-item-icon>
            <v-icon color="#000080">mdi-newspaper-variant</v-icon>
          </v-list-item-icon>
          <!--text-->
          <v-list-item-content>
            <v-list-item-title class="administrator-color">Issue Category</v-list-item-title>
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
        name: "SideBar"
       
        }
    
</script>


<style scoped>
  .bg-primary{
    background-color: #1e6097;
    }
  .text-primary{
    color: #1e6097;
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

  .border-left{
    border-left: 3px solid;
    border-color: white;
  }

  .sidebar-item:hover, .v-list-item--active{
    border-left: 7.5px solid;
    border-color: white;
    transition: 0.25s;
  }

  .dashboard-color{
    color:#00af52;
  }

  .request-color{
    color:#ff6600;
  }
  .incident-color{
    color: #0170c1;
  }
  .problem-color{
    color: #7030a2;
  }
 
  /* for dashboard hover and active */
  .dashboard-item:hover, .dashboard-item.v-list-item--active{
    border-left: 7.5px solid;
    border-color:  #00af52;
    transition: 0.25s;
  }
  .dashboardborder-left{
    border-left: 3px solid;
    border-color: #00af52;
  }

  /* for request hover and active */
  .request-item:hover, .request-item.v-list-item--active{
    border-left: 7.5px solid;
    border-color:  #ff6600;
    transition: 0.25s;
  }
  .requestborder-left{
    border-left: 3px solid;
    border-color: #ff6600;
  }

  /* for incident hover and active */
  .incident-item:hover, .incident-item.v-list-item--active{
    border-left: 7.5px solid;
    border-color:  #0170c1;
    transition: 0.25s;
  }
  .incidentborder-left{
    border-left: 3px solid;
    border-color: #0170c1;
  }

  /* for problem hover and active */
  .problem-item:hover, .problem-item.v-list-item--active{
    border-left: 7.5px solid;
    border-color:  #7030a2;
    transition: 0.25s;
  }
  .problemborder-left{
    border-left: 3px solid;
    border-color: #7030a2;
  }

  /* for msp hover and active */
  .msp:hover, .msp.v-list-item--active{
    border-left: 7.5px solid;
    border-color:  #bb0808;
    transition: 0.25s;
  }
  .mspborder-left{
    border-left: 3px solid;
    border-color: #bb0808;
  }

  .msp-color{
    color: #bb0808;
  }

  /* for msp hover and active */
  .admin:hover, .admin.v-list-item--active{
    border-left: 7.5px solid;
    border-color:  #000080;
    transition: 0.25s;
  }
  .adminborder-left{
    border-left: 3px solid;
    border-color: #000080;
  }


  .administrator-color{
    color:#000080;
  }
  
  /*
  .v-list-item-active{
    border-left: 5px solid;
    border-color: yellow;
  }
  */

</style>