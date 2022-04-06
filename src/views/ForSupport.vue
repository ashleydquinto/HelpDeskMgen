<template>
  <div class="ForSupport">
    <v-header>
            <h2 class="pr-10 header-text">For Support</h2>
        </v-header><br>
     <v-tabs 
    fixed-tabs
    dark
  >
    <v-tab to="/AllTicketsTab" style="background-color: #1e6097; color: white;">
      All Tickets
    </v-tab>
    <v-tab to="/RequestsTab" style="background-color: #1e6097; color: white;">
      Requests
    </v-tab>
    <v-tab to="/IncidentsTab" style="background-color: #1e6097; color: white;">
      Incidents
    </v-tab>
    <v-tab to="/ProblemsTab" style="background-color: #1e6097; color: white;">
      Problems
    </v-tab>
  </v-tabs>
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
  </div>
</template>

<script>
export default {
    name: "ForSupportApp",
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

</style>
