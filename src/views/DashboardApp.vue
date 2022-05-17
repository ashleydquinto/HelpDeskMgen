<template>
    <div class="DashboardApp">
        <!--
        <v-header>
            <h2 class="pr-10 header-text">Dashboard</h2>
        </v-header><br>
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

        <br>
        <br>
        -->

        <v-header>
            <h2 class="pr-10 header-text">Request Categories</h2>
        </v-header><br>

        <v-row>
            <v-col lg="4" cols="8" > <!--v-for="(item,index) in requests" :key="index"-->
                <v-card elevation="2" class="rounded-lg orange-bg" v-bind:class="{ active: activeness.request }" @click="showRequestTix()">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular><b>Request</b></regular><br><br>
                            <h1>{{rq_ticketno.total_request}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" > <!--v-for="(item,index) in requests" :key="index"-->
                <v-card elevation="2" class="rounded-lg blue-bg" v-bind:class="{ active: activeness.incident }" @click="showIncidentTix()">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular><b>Incident</b></regular><br><br>
                            <h1>{{rq_ticketno.total_incident}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" > <!--v-for="(item,index) in requests" :key="index"-->
                <v-card elevation="2" class="rounded-lg violet-bg" v-bind:class="{ active: activeness.problem }" @click="showProblemTix()">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular><b>Problem</b></regular><br><br>
                            <h1>{{rq_ticketno.total_problem}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>


        <br>
        <br>

        <v-row v-if="activeness.request == true || activeness.incident == true || activeness.problem == true">
            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg new-tix">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular>New Tickets</regular><br><br>
                            <h1>{{ticket_nums[0].amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>
            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg ongoing-tix">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular>Ongoing Tickets</regular><br><br>
                            <h1>{{ticket_nums[1].amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>
            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg pending-tix">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular>Pending Tickets</regular><br><br>
                            <h1>{{ticket_nums[2].amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg resolved-tix">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular>Resolved Tickets</regular><br><br>
                            <h1>{{ticket_nums[3].amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>
            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg closed-tix">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular>Closed Tickets</regular><br><br>
                            <h1>{{ticket_nums[4].amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>
            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg cancelled-tix">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular>Cancelled Tickets</regular><br><br>
                            <h1>{{ticket_nums[5].amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
        
        <!--
        <v-row v-if="activeness.request == true || activeness.incident == true || activeness.problem == true">
            <v-col lg="4" cols="8" v-for="(item,index) in ticket_nums" :key="index" >
                <v-card elevation="2" class="rounded-lg active">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular>{{item.title}}</regular><br><br>
                            <h1>{{item.amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>

        -->

        <!--
        <br>
        <br>

        <v-header>
            <h2 class="pr-10 header-text">Incident</h2>
        </v-header><br>

        <v-row>
            <v-col lg="4" cols="8" v-for="(item,index) in incidents" :key="index">
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
        <br> 

        <br>
        <br>

        <v-header>
            <h2 class="pr-10 header-text">Problem</h2>
        </v-header><br>

        <v-row>
            <v-col lg="4" cols="8" v-for="(item,index) in problems" :key="index">
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

        
        <br> 
        -->

        <!--<v-card
    class="mt-4 mx-auto"
    max-width="700"
  >
    <v-sheet
      class="v-sheet--offset mx-auto"
      color="cyan"
      elevation="12 "
      max-width="calc(100% - 32px)"
    >
      <v-sparkline
        :labels="labels"
        :value="value"
        color="white"
        line-width="2"
        padding="16"
      ></v-sparkline>
    </v-sheet>

    <v-card-text class="pt-0"><br>
      <div class="text-h6 font-weight-light mb-2">
        Opened Tickets
      </div>
      <div class="subheading font-weight-light grey--text">
        Last opened tickets
      </div>
      <v-divider class="my-2"></v-divider>
      <v-icon
        class="mr-2"
        small
      >
        mdi-clock
      </v-icon>
      <span class="text-caption grey--text font-weight-light">last ticket 26 minutes ago</span>
    </v-card-text>
  </v-card>-->  
    </div>
</template>

<script>
import axios from 'axios'
import moment from 'moment'
export default {
    name: "DashboardApp",
    data(){
        return{
            date1: "2022-09-14 12:00:00",
            date2: "2022-12-15 12:21:00",
            activities:[
                {title:'New Tickets',amounts:0},
                {title:'Ongoing Tickets',amounts:0},
                {title:'Pending Tickets',amounts:0},
                {title:'Resolved Tickets',amounts:0},
                {title:'Closed Tickets',amounts:0},
                {title:'Cancelled Tickets',amounts:0},
            ],  
            rq_ticketno:{
              total_request:0,
              total_incident:0,
              total_problem:0
            },
            activeness:{
              request: false,
              incident:false,
              problem:false
            },
            ticket_nums:[
                {title:'New Tickets',amounts:0},
                {title:'Ongoing Tickets',amounts:0},
                {title:'Pending Tickets',amounts:0},
                {title:'Resolved Tickets',amounts:0},
                {title:'Closed Tickets',amounts:0},
                {title:'Cancelled Tickets',amounts:0},
            ],
            labels: [
        '12am',
        '3am',
        '6am',
        '9am',
        '12pm',
        '3pm',
        '6pm',
        '9pm',
      ],
      value: [
        200,
        675,
        410,
        390,
        310,
        460,
        250,
        240,
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
      getTicketNum(){
        axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_ticketno.php',{
          action:'tickets-table'
        })
          .then((response)=>{
            console.log(response.data)
            this.activities[0].amounts = response.data.new_rows;
            this.activities[1].amounts = response.data.ongoing_rows;
            this.activities[2].amounts = response.data.pending_rows;
            this.activities[3].amounts = response.data.resolved_rows;
            this.activities[4].amounts = response.data.closed_rows;
            this.activities[5].amounts = response.data.cancelled_rows;
            //var num = this.activities[3]
            //console.log('resolved'+ num)
          })
      },
      //TO GET TOTAL OF REQUEST (for the ticket numbers)
      getTotalRequest(action){
        axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_ticketno.php',{
          action:'request'
        })
          .then((response)=>{

            if(action == 'show'){
              this.rq_ticketno.total_request = response.data.total_rows;
            }
            else if(action == 'change'){

              this.rq_ticketno.total_request = response.data.total_rows;

              this.ticket_nums[0].amounts = response.data.new_rows;
              this.ticket_nums[1].amounts = response.data.ongoing_rows;
              this.ticket_nums[2].amounts = response.data.pending_rows;
              this.ticket_nums[3].amounts = response.data.resolved_rows;
              this.ticket_nums[4].amounts = response.data.closed_rows;
              this.ticket_nums[5].amounts = response.data.cancelled_rows;
            }
            
          })
      },
      //TO GET TOTAL OF INCIDENT (for the ticket numbers)
      getTotalIncident(action){
        axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_ticketno.php',{
          action:'incident'
        })
          .then((response)=>{
            if(action == 'show'){
              this.rq_ticketno.total_incident = response.data.total_rows;
            }
            else if(action == 'change'){

              this.rq_ticketno.total_incident = response.data.total_rows;

              this.ticket_nums[0].amounts = response.data.new_rows;
              this.ticket_nums[1].amounts = response.data.ongoing_rows;
              this.ticket_nums[2].amounts = response.data.pending_rows;
              this.ticket_nums[3].amounts = response.data.resolved_rows;
              this.ticket_nums[4].amounts = response.data.closed_rows;
              this.ticket_nums[5].amounts = response.data.cancelled_rows;
            }
          })
      },
      //TO GET TOTAL OF PROBLEM (for the ticket numbers)
      getTotalProblem(action){
        axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_ticketno.php',{
          action:'problem'
        })
          .then((response)=>{
            if(action == 'show'){
              this.rq_ticketno.total_problem = response.data.total_rows;
            }
            else if(action == 'change'){

              this.rq_ticketno.total_problem = response.data.total_rows;

              this.ticket_nums[0].amounts = response.data.new_rows;
              this.ticket_nums[1].amounts = response.data.ongoing_rows;
              this.ticket_nums[2].amounts = response.data.pending_rows;
              this.ticket_nums[3].amounts = response.data.resolved_rows;
              this.ticket_nums[4].amounts = response.data.closed_rows;
              this.ticket_nums[5].amounts = response.data.cancelled_rows;
            }
          })
      },

      //toggle buttons

      showRequestTix(){
        this.activeness.request = !this.activeness.request
        this.activeness.incident = false
        this.activeness.problem = false

        if(this.activeness.request == true){
          this.getTotalRequest('change');
        }
      },
      showIncidentTix(){
        this.activeness.incident = !this.activeness.incident
        this.activeness.request = false
        this.activeness.problem = false

        if(this.activeness.incident == true){
          this.getTotalIncident('change');
        }
      },
      showProblemTix(){
        this.activeness.problem = !this.activeness.problem
        this.activeness.incident = false
        this.activeness.request = false

        if(this.activeness.problem == true){
          this.getTotalProblem('change');
        }
      },
      //logic for SLA (time difference)
      differenciate(){
        //own assigned values
        var date2 = moment(this.date2,"YYYY-MM-DD HH:mm:ss");
        var date1 = moment(this.date1,"YYYY-MM-DD HH:mm:ss");
        //differenciating here
        var diffdays = date2.diff(date1)
        var moment1 = moment(diffdays).format('D[ day(s)] H[ hour(s)] m[ minute(s)] s[ second(s)]')
        console.log(moment1)
      }
    },
    created: function(){
      //this.changeNum();
      this.getTicketNum();
      this.getTotalRequest('show');
      this.getTotalIncident('show');
      this.getTotalProblem('show');
      //logic for SLA (time difference) execution
      //this.differenciate(); <cinomment ko muna>
    }
}
</script>

<style scoped>
    .header-text {
       color: #616161;
    }
    .active{
      filter: brightness(75%);
    }
    .orange-bg{
      background-color: #fddac3;
    }
    .violet-bg{
      background-color: #e9dcf4;
    }
    .blue-bg{
      background-color: #c8e8ff;
    }

    .new-tix{
      background-color: #90CB94;
    }
    .ongoing-tix{
      background-color: #F8F098;
    }
    .pending-tix{
      background-color: #FAC67C;
    }
    .resolved-tix{
      background-color: #7BBEF4;
    }
    .closed-tix{
      background-color: #BDBDBD;
    }
    .cancelled-tix{
      background-color: #EB756E;
    }
</style>