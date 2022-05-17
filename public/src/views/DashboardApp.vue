<template>
    <div class="DashboardApp">
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
export default {
    name: "DashboardApp",
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
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_ticketno.php')
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
      }
    },
    created: function(){
      //this.changeNum();
      this.getTicketNum();
    }
}
</script>

<style scoped>
    .header-text {
       color: #616161;
    }
</style>