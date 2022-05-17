<template>
    <div class="GraphicalReport">
        <v-header>
            <h2 class="pr-10 header-text">Graphical Report</h2>
        </v-header><br>
        <v-row>
            <v-col lg="2" cols="8" v-for="(item,index) in activities" :key="index">
                <v-card elevation="2" class="rounded-lg">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular style="font-size: 12px;">{{item.title}}</regular><br><br>
                            <h1>{{item.amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
         <v-row>
            <v-col lg="12" cols="8" v-for="(item,index) in total" :key="index">
                <v-card elevation="2" class="rounded-lg" style="background-color: #EEEEEE; color: #FFFFFF;">
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
            <v-col lg="12" cols="8" v-for="(item,index) in total" :key="index">
                <v-card elevation="2" class="rounded-lg" style="background-color: #EEEEEE; color: #FFFFFF;">
                    <v-card-text class="d-flex justify-space-between align-center">
                       
                            <canvas id="myChart" width="900" height="400"></canvas>
                        
                    </v-card-text>
                </v-card>
            </v-col>
        
            
        </v-row>
        <v-row>
            <v-col lg="6" cols="8" v-for="(item,index) in total" :key="index">
                <v-card elevation="2" class="rounded-lg" style="background-color: #EEEEEE; color: #FFFFFF;">
                    <v-card-text class="d-flex justify-space-between align-center">
                        
                            <canvas id="satischart" width="400" height="400"></canvas>
                       
                    </v-card-text>
                </v-card>
            </v-col>
            <v-col lg="6" cols="8" v-for="(item,index) in total" :key="index">
                <v-card elevation="2" class="rounded-lg" style="background-color: #EEEEEE; color: #FFFFFF;">
                    <v-card-text class="d-flex justify-space-between align-center">
                      
                            <canvas id="donutstatus" width="400" height="400"></canvas>
                        
                    </v-card-text>
                </v-card>
            </v-col>
        
            <v-col lg="12" cols="8" v-for="(item,index) in total" :key="index">
                <v-card elevation="2" class="rounded-lg" style="background-color: #EEEEEE; color: #FFFFFF;">
                    <v-card-text class="d-flex justify-space-between align-center">
                       
                            <canvas id="categchart" width="900" height="400"></canvas>
                        
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
       
        <br>  
    </div>
</template>

<script>
import Chart from 'chart.js/auto';
import axios from 'axios';
var yValues = [];
var yValues2 = [7 ,4, 15];

var yValues4 = [];
export default {
    name: "GraphicalReport",
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
            total:[
              {title: 'Total Tickets', amounts: 0}
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
    methods: {
getTicketNum(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/getanalytics.php')
          .then((response)=>{
              
            console.log(response.data)
            yValues[0] = response.data.total_rows;
            yValues[1] = response.data.new_rows;
            yValues[2] = response.data.ongoing_rows;
            yValues[3] = response.data.pending_rows;
            yValues[4] = response.data.resolved_rows;
            yValues[5] = response.data.closed_rows;
            yValues[6] = response.data.cancelled_rows;
           
            this.total[0].amounts = response.data.total_rows; 
            this.activities[0].amounts = response.data.new_rows; 
            this.activities[1].amounts = response.data.ongoing_rows; 
            this.activities[2].amounts = response.data.pending_rows; 
            this.activities[3].amounts = response.data.resolved_rows; 
            this.activities[4].amounts = response.data.closed_rows; 
            this.activities[5].amounts = response.data.cancelled_rows; 
            yValues4[0] = response.data.incident;
            yValues4[1] = response.data.problem;
            yValues4[2] = response.data.requests;
            
            console.log(this.yValues.total);
          })
      }
    },
    
   mounted: async function(){
       
       this.getTicketNum();
       
       var xValues4 = ["Incident", "Problem", "Requests"];

     var xValues = ["Total Tickets", "New Tickets", "Ongoing Tickets", "Pending Tickets", "Resolved Tickets", "Closed Tickets", "Cancelled Tickets"];
     
    var xValues2 = ["Satisfied", "Unsatisfied", "No Rating"];
        var barColors2 = [
  "#2D6D9B",
  "#57C6E1",
  
  "#48AAD9"
  
];
var barColors = [
  "#2D6D9B",
  "#3780A1",
  
  "#4093A7",
  "#4AA6AD",
 "#54B8B2",
  "#5DCBB8",
  "#67DEBE",
  
];
var barColors3 = [
    "#99E2B4",
  "#88D4AB",
  "#78C6A3",
  "#67B99A",
 "#56AB91",
  "#469D89",
  "#358F80",
  "#248277",
 "#14746F",
  "#036666",
  "#3FC1C0",
  "#20BAC5",
  "#00B2CA",
  "#04A6C2",
 "#0899BA",
  "#0F80AA",
  "#16679A",
  "#1A5B92",
 "#1C558E",
  "#1D4E89",
  "#2D00F7",
  "#6A00F4",
  "#8900F2",
  "#A100F2",
 "#B100E8",
  "#BC00DD",
  "#D100D1",
  "#DB00B6",
 "#E500A4",
  "#F20089",
   "#c05299",
  "#ea698b",
  "#d55d92",
  "#FBB1BD",
 "#FF99AC",
  "#FF85A1",
  "#FF7096",
  "#FF5C8A",
 "#FF477E",
  "#FF0A54",
  "#641220",
  "#6E1423",
  "#85182A",
  "#A11D33",
 "#A71E34",
  "#B21E35",
  "#BD1F36",
  "#C71F37",
 "#DA1E37",
  "#E01E37",
  "#FF4800",
  "#FF5400",
  "#FF6000",
  "#FF6D00",
 "#FF7900",
  "#FF8500",
  "#FF9100",
  "#FF9E00",
 "#FFAA00",
  "#FFB600",
  "#e2a837",
  "#e5b63d",
  "#e7c343",
  "#e9d048",
 "#ebdd4e",
  "#edea54",
  "#eed800",
  "#dcd000",
 "#bac101",
  "#97b201",
   
];
var barColors4 = [
  "#8900F2",
  "#B100E8",
  "#DB00B6"
];
new Chart("satischart", {
  type: "pie",
  data: {
    labels: xValues2,
    datasets: [{
      backgroundColor: barColors2,
      data: yValues2
    }]
  },
  options: {
      plugins: {
      title: {
            display: true,
            text: 'Satisfaction Analytics'
        },
        
         },
      indexAxis: 'y',
    
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }],
    }
  }
});
new Chart("myChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
      plugins: {
      title: {
            display: true,
            text: 'Ticket Analytics by Status'
        },
        legend: {display: false},
         },
      indexAxis: 'y',
    
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }],
    }
  }
});

new Chart("donutstatus", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors3,
      data: yValues
    }]
  },
  options: {
      plugins: {
      title: {
            display: true,
            text: 'Count of Created by Status'
        },
        legend: {display: false},
         },
      indexAxis: 'y',
    
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }],
    }
  }
});

new Chart("categchart", {
  type: "bar",
  data: {
    labels: xValues4,
    datasets: [{
      backgroundColor: barColors4,
      data: yValues4
    }]
  },
  options: {
      plugins: {
      title: {
            display: true,
            text: 'Count of Category by Request Category'
        },
        legend: {display: false},
         },
      
    
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }],
    }
  }
});
   },
}

</script>

<style scoped>
    .header-text {
       color: #616161;
    }
    canvas {
       display:inline !important;
       margin-left: auto;
       margin-right: auto;
       left:0;
       right: 0;
}
</style>