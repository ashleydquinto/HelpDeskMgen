<template>
  <div class="ForSupport">
    <v-header>
            <h2 class="pr-10 header-text">For Support</h2>
        </v-header><br>
  <v-tabs 
  fixed-tabs
  background-color="#1e6097"
  slider-color="white"
  >

    <!--EDITED TODAY (04-08-2022 3:58PM) -->

    <!--Header name AllTickets-->
    <v-tab href="#AllTickets" style="color: white;"> <!--to="/AllTicketsTab" style: background-color: #1e6097; -->
      All Tickets
    </v-tab>

    <v-tab-item id="AllTickets" key="AllTickets" class="custom-tab-items">
      <AllTicketsTab/> 
    </v-tab-item>

    <!--Header name Requests-->
    <v-tab href="#Requests" style=" color: white;" > <!--to="/RequestsTab" style: background-color: #1e6097;-->
      Requests
    </v-tab>

    <v-tab-item id="Requests" key="Requests" class="custom-tab-items">
      <RequestsApp/>
    </v-tab-item>

    <!--Header name Incidents-->
    <v-tab href="#Incidents" style="color: white;"> <!--to="/IncidentsTab" style: background-color: #1e6097;-->
      Incidents
    </v-tab>

    <v-tab-item id="Incidents" key="Incidents" class="custom-tab-items">
      <IncidentsTab/>
    </v-tab-item>

    <!--Header name Problems-->
    <v-tab href="#Problems" style="color: white;"> <!--to="/ProblemsTab" style: background-color: #1e6097;-->
      Problems
    </v-tab>

    <v-tab-item id="Problems" key="Problems" class="custom-tab-items">
      <ProblemsTab/>
    </v-tab-item>

  </v-tabs>


  <!--
  <br><br><br><br>
  
           <v-row>
            <v-col lg="4" cols="8" v-for="(item,index) in activities" :key="index">
                <v-card elevation="2" class="rounded-lg">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular>{{item.title}}</regular><br><br>
                            <h1>{{item.amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>
          </v-row>
     <v-row>
            <v-col lg="12">
                <v-data-table
                caption="ALL TICKETS"
                :headers="headers"
                :items="tickets"
                 class="pt-4 elevation-1"
                >
                <template v-slot:[`item.actions`]="{ }">
                    <v-btn color="success">View</v-btn>
                </template>
                </v-data-table>
            </v-col>
        </v-row>
  -->

  </div>
</template>

<script>
//EDITED TODAY (04-08-2022 3:58PM)

//import axios from 'axios'
import AllTicketsTab from './AllTicketsTab.vue' 
import RequestsApp from './RequestsApp.vue' 
import IncidentsTab from './IncidentsTab.vue' 
import ProblemsTab from './ProblemsTab.vue'

export default {
    name: "ForSupportApp",
    components:{
      AllTicketsTab,
      RequestsApp,
      IncidentsTab,
      ProblemsTab
    },
    data(){
        return{
            activities:[
                {title:'New Tickets',amounts:0},
                {title:'Ongoing Tickets',amounts:0},
                {title:'Pending Tickets',amounts:0},
                {title:'Resolved Tickets',amounts:0},
                {title:'Closed Tickets',amounts:0},
                {title:'Cancelled Tickets',amounts:0},
             ],  
             headers: [
          { text: 'TICKET NO.', value: 'ticket' },
          { text: 'REQUESTOR', value: 'requestor' },
          { text: 'DEPARTMENT', value: 'department' },
          { text: 'CATEGORY', value: 'category' },
          { text: 'DESCRIPTION', value: 'description' },
          { text: 'STATE', value: 'state' },
          { text: 'CREATED', value: 'created' },
          { text: 'RESOLVED', value: 'resolved' },
          { text: 'ASSIGNED ENGR', value: 'assignedengr' },
          { text: 'ACTION', value: 'action' },

        ],
        tickets: [
          {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5359',
            requestor: 'John Eric Diwa',
            deparment: 'Sales and Marketing',
            category: 'Others',
            description: 'For Client - helpdesk support -VPN configuration on PA',
            state: 'Resolved',
            created: '3/22/2022 4:12 pm',
            resolved: '3/23/2022 6:32 pm',
            assignedengr: 'Jules Stephen Mayo',
          },
           ],
        items: [
          'Ticket No.',
          'Requestor',
          'Department',
          'Category',
          'Description',
          'State',
          'Created',
          'Resolved',
          'Assigned Engr',
        ],
        }
    },
    methods:{
      /* MGA INIBA KO TODAY (04-08-2022) 1:30pm */
      //sample func
      changeNum(){
        this.activities[1].amounts = 2;
        var num = this.activities[1];
        console.log("var1",num);
      },
      /*
      getTicketNum(){
        axios.get('http://localhost/helpdesk/helpdesk/get_ticketno.php')
          .then((response)=>{
            console.log(response.data)
            this.activities[1].amounts = response.data.ongoing_rows;
            this.activities[2].amounts = response.data.pending_rows;
            this.activities[3].amounts = response.data.resolved_rows;
            this.activities[4].amounts = response.data.closed_rows;
            this.activities[5].amounts = response.data.cancelled_rows;
            //var num = this.activities[3]
            //console.log('resolved'+ num)
          })
      }*/
      
    },
    created: function(){
      //this.changeNum();
      this.getTicketNum();
    }
}
</script>

<style scoped>
    .tab-color {
       background-color: #1e6097;
    }
     .header-text {
       color: #616161;
    }
    .custom-tab-items {
        padding:2.5%;
        background-color: whitesmoke;
    }
</style>
