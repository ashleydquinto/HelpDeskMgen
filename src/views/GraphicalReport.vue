<template>
    <div class="GraphicalReport">
        <v-header>
            <h2 class="pr-10 header-text">Graphical Report</h2>
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
         <v-row>
            <v-col lg="4" cols="8" v-for="(item,index) in total" :key="index">
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
        <br>  
    </div>
</template>

<script>
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
    }
}
</script>

<style scoped>
    .header-text {
       color: #616161;
    }
</style>