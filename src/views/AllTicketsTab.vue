<template>
    <!--added for support content here (5:11pm - 04-08-2022)-->
    <div class="container-padding">
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
                    <!--for ticket ID-->
                    <template v-slot:[`item.ticket`]="{item}">
                        {{item.id}}
                    </template>
                    <!--for ticket status from DB-->
                    <template v-slot:[`item.state`]="{item}">
                        {{item.status}}
                    </template>
                     <!--for ticket category chosen by user-->
                    <template v-slot:[`item.category`]="{item}">
                        {{item.issue}}
                    </template>
                </v-data-table>
            </v-col>
        </v-row>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    name: "AllTicketsTab",

    //<!--added for support content here (5:11pm - 04-08-2022)-->
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
      getPosts(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_tickets.php')
            .then((response)=>{
                console.log(response.data)
                this.tickets=response.data;
            })
            .catch((error)=> {
                console.log(error)
            })
       },
       getTicketNum(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_ticketno.php')
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
      }
    },
    created: function(){
      //this.changeNum();
      this.getTicketNum();
      this.getPosts();
    }
};

</script>

<style scoped>

</style>