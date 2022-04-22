<template>
  <div class="ExportReport">
        <v-header>
            <h2 class="pr-10 header-text">Export Report</h2>
        </v-header><br>
        <v-row>
    <v-col class="pl-12"
      cols="12"
      sm="4"
    >
      <v-date-picker  v-on:click="getPosts()" header-color="#1e6097"
      color="#2d78b1"
        v-model="dates"
        range
        :max = currentdate
        @click:date="getPosts"
        @click:month="getPosts"
        @click:year="getPosts"
      ></v-date-picker>
      </v-col>
      <v-col
      cols="12"
      sm="6"
    >
      <v-text-field

        v-model="dateRangeText"
        label="Date range"
        prepend-icon="mdi-calendar"
        readonly
      ></v-text-field>
        <v-btn type=submit @click="successCheck">
        <JsonExcel
    class            = "btn"
    :data   = "tickets"
    :fields = "headers"
    
    name    = "helpdeskreport.xls"
    >
 
    Export to Excel
 
</JsonExcel>
</v-btn>

      
    </v-col>
  </v-row>
  </div>
</template>

<script>
import JsonExcel from "vue-json-excel";
import axios from 'axios';

 const current = new Date();
var date;
var getmonth = parseInt((current.getMonth()+1));
 if (getmonth > 10) {
        date = current.getFullYear()+'-'+(current.getMonth()+1)+'-'+(current.getDate());
        }
        else {
          date = current.getFullYear()+'-0'+(current.getMonth()+1)+'-'+(current.getDate())
        }       
        
  export default {
    name: "ExportReport",
  components: {
    JsonExcel
  },
    data: () => ({
      dates: [],
      currentdate: date,
    

      tickets: [],
      headers: 
            {
       'TICKET NO.': 'ticket',
             'REQUESTOR': 'requestor' ,
             'DEPARTMENT': 'department' ,
             'CATEGORY': 'category' ,
             'DESCRIPTION':'description' ,
             'JUSTIFICATION':'justification', //' d-none' hides the column but keeps the search ability
             'STATE': 'state' ,
             'CREATED':'date_created' ,
             'RESOLVED':'resolved' ,
             'ASSIGNED ENGR': 'assigned_engineer' ,
             'SLA': 'sla',
             'DIAGNOSTIC': 'diagnostic',
             'RESOLUTION': 'resolution',
            'COMMENTS': 'comments',
    },
            //{ text: 'ACTION', value: 'action', align: 'center'},
          
    }),
    methods: {
      getPosts(){
        
        var firstdate = this.dates[0];
        var seconddate = this.dates[0];
        
                   if (this.dates[1] != null) {
                  seconddate = this.dates [1];
                  if (this.dates[1] < this.dates[0]) {
                    firstdate = this.dates [1];
            seconddate = this.dates [0];
                  }
                  
                }
                
        
        axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/export_tickets.php', {
          date1:firstdate,
          date2:seconddate
        })
        
            .then((response)=>{
              
                console.log(response.data)
                this.tickets=response.data;
                
                
                
            })
            .catch((error)=> {
                console.log(error)
            })
        },
       successCheck(){
         if(this.tickets == null || this.tickets == '') {
        alert('No tickets existed on the date(s) selected');
        }
    }
    
    },
    computed: {
      dateRangeText () {
        
        return this.dates.join(' - ')
      },
      
    },
    
  }
</script>