<template>

          <div>

            <v-row>
            <v-col lg="4" cols="8" > 
                <v-card elevation="2" class="rounded-lg active"  @click="filterNew()"> <!--v-bind:class="{ active: activeness.new }"-->
                  <v-card-text class="justify-space-between align-center" v-bind:class="{ active: activeness.new == true }">
                    <regular >{{this.activities[0].title}}</regular><br><br>
                    <h1 >{{this.activities[0].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" @click="filterOngoing()"> <!--v-bind:class="{ active: activeness.ongoing }"-->
                  <v-card-text v-bind:class="{ active: activeness.ongoing }" class="justify-space-between align-center">
                    <regular >{{this.activities[1].title}}</regular><br><br>
                    <h1 >{{this.activities[1].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" @click="filterPending()"> <!--v-bind:class="{ active: activeness.pending }"-->
                  <v-card-text v-bind:class="{ active: activeness.pending }" class="justify-space-between align-center">
                    <regular >{{this.activities[2].title}}</regular><br><br>
                    <h1 >{{this.activities[2].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" @click="filterResolved()"><!--v-bind:class="{ active: activeness.resolved }"-->
                  <v-card-text  v-bind:class="{ active: activeness.resolved }" class="justify-space-between align-center">
                    <regular >{{this.activities[3].title}}</regular><br><br>
                    <h1 >{{this.activities[3].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" @click="filterClosed()"> <!--v-bind:class="{ active: activeness.closed }"-->
                  <v-card-text v-bind:class="{ active: activeness.closed }" class="justify-space-between align-center">
                    <regular >{{this.activities[4].title}}</regular><br><br>
                    <h1 >{{this.activities[4].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" @click="filterCancelled()"><!--v-bind:class="{ active: activeness.cancelled }"-->
                  <v-card-text v-bind:class="{ active: activeness.cancelled }" class="justify-space-between align-center">
                    <regular >{{this.activities[5].title}}</regular><br><br>
                    <h1 >{{this.activities[5].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>
          </v-row>


          <v-row>
            <v-col lg="12">
                <v-data-table
                caption="REQUESTS"
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

                    <template v-slot:[`item.action`]="{ item }">
                        <div class="my-2">
                          <v-btn
                            color="#1e6097"
                            fab
                            small
                            dark
                            @click="editItem(item)"
                          >
                            <v-icon>mdi-pencil</v-icon>
                          </v-btn>
                        </div>
                    </template>
                </v-data-table>
              </v-col>
            </v-row>

                <!--UPDATE DIALOG-->
        <v-dialog
        transition="dialog-bottom-transition"
        max-width="900"
        v-model="updateModal" 
        persistent
        >


            <v-card>
              <v-toolbar style="background-color: #1e6097; color: white;"
                dark
              >
              <v-col>
              Update Ticket {{this.editedItem.id}}
              </v-col>
              <v-col align="right">
                <v-btn
                        style="background-color: #D32F2F; color: white;"
                        text
                        @click="updateModal = false;responseNotNaN = false">
                        <v-icon
                          small
                        >
                          mdi-window-close
                        </v-icon>
                        Exit 
                </v-btn>
              </v-col>
              
              </v-toolbar>
              <br>
              <v-card-text>
              <v-form>
                  <v-container>
                      <v-row no-gutters>


                        
                        
                      <!--column 1 STARTS HERE-->
                      <v-col
                      cols="12"
                      sm="6"  
                                        
                      >
                      <!--Requestor-->
                      <h3 class="title  mb-1">Requestor</h3>
                      <p class="body-2 update-font">{{this.editedItem.requestor}}</p>

                      <!--Department-->

                      <!-- use this pag kailangan pa 
                      <h3 class="title  mb-1">Department</h3>
                      <p class="body-2 update-font">{{this.editedItem.department}}</p>
                      -->

                      <h3 class="title  mb-1">Department</h3>
                      <p class="body-2 update-font">{{this.editedItem.department}}</p>

                      

                      <!--Description
                      <v-textarea
                      label="Description"
                      class="mr-1"
                      rows="3"
                      outlined
                      no-resize
                      v-model="editedItem.description"
                      >
                      
                      </v-textarea>
                      -->

                      


                      </v-col>


                      <!--column 2 STARTS HERE-->
                      <v-col
                      cols="12"
                      sm="6"                    
                      >
                      <!--Contact Number-->
                      <h3 class="title  mb-1">Contact Number</h3>
                      <p class="body-2 update-font">{{this.editedItem.contact_no}}</p>

                      <!--Issue-->
                      <h3 class="title  mb-1">Issue</h3>
                      <p class="body-2 update-font">{{this.editedItem.issue}}</p>


                      
                      </v-col>

                    <v-col cols="12">

                      <!--Description-->
                      <h3 class="title">Description</h3>
                      <p class="body-2 update-font">{{this.editedItem.description}}</p>

                    </v-col>

                    <v-col cols="12">

                      <!--Justification-->
                      <h3 class="title">Justification</h3>
                      <p class="body-2 update-font">{{this.editedItem.justification}}</p>

                    </v-col>

                    <v-col sm = "4" cols="12">

                      <!--Attached File-->
                      <h3 class="title">Attached File</h3>
                      <v-row>
                        
                      <v-col cols="4">
                      <p class="body-2 update-font" v-if="editedItem.attached_file != '' && editedItem.attached_file != NULL">{{this.editedItem.attached_file}}</p>
                      </v-col>

                      <v-col cols="8">
                      <v-btn height="30px" width="125px" @click="downloadFile(editedItem.attached_file)" v-if="editedItem.attached_file != '' && editedItem.attached_file != NULL"><v-icon>mdi-download</v-icon> Download</v-btn>
                      
                      </v-col>

                      </v-row>

                      <p class="body-2 update-font" v-if="editedItem.attached_file == '' || editedItem.attached_file == NULL || editedItem.attached_file == undefined">No file was uploaded for this ticket.</p>

                    </v-col>

                    <v-col sm = "4" cols="12">

                      <!--Response Time-->
                      <h3 class="title">Response Time</h3>
                      <p class="body-2 update-font" v-if="responseNotNaN == true">{{this.responseTimeHandler}}</p> <!--v-if="editedItem.response_time != '' && editedItem.response_time != NULL"-->
                      <p class="body-2 update-font" v-if="editedItem.date_responded == '' || editedItem.date_responded == undefined || editedItem.date_responded ==  null">Response time not computed yet.</p>
                      <!--<p class="body-2 update-font" v-if="editedItem.response_time == '' || editedItem.response_time == NULL || editedItem.response_time == undefined">Response time not computed.</p>-->

                    </v-col>

                    <v-col sm = "4" cols="12">

                      <!--SLA-->
                      <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title">SLA</h3>
                      <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && editedItem.sla != ''" style="font-style:italic;" class="body-2 update-font">{{this.editedItem.sla}}</p>
                      <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && editedItem.sla == ''" style="font-style:italic;" class="body-2 update-font">SLA not found.</p>

                    </v-col>

                    

                    <v-col sm="4" cols="12">
                      <!--State pag closed na-->
                      <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title  mb-1">State</h3>
                      <p v-if="editedItem.status == 'Closed'" style="color: #D32F2F" class="body-2 update-font">{{this.editedItem.status}}</p>
                      <p v-if="editedItem.status == 'Resolved'" style="color: green" class="body-2 update-font">{{this.editedItem.status}}</p>

                    </v-col>

                    
                    <v-col sm="4" cols="12">
                      <!---->
                      <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title mb-1">Priority</h3>
                      <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.request_category != ''" class="body-2 update-font">{{this.editedItem.priority}}</p>
                      <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.request_category == ''" class="body-2 update-font">Priority not defined.</p>
                    </v-col>

                    <v-col sm="4" cols="12">
                      <!--Assigned Engineer pag closed/resolved na-->
                      <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title  mb-1">Assigned Engineer</h3>
                      <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.assigned_engineer != ''" class="body-2 update-font">{{this.editedItem.assigned_engineer}}</p>
                      <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.assigned_engineer == ''" class="body-2 update-font">No engineer assigned.</p>
                    </v-col>


                    <v-col
                      cols="12"
                      sm="6"                    
                      >
                      <!--Assigned Engineer-->
                      <v-text-field
                      label="Assigned Engineer"
                      class="mr-1"
                      outlined
                      v-model="editedItem.assigned_engineer"
                      v-if="editedItem.status != 'Closed' && editedItem.status != 'Resolved'"
                      >
                      </v-text-field>

                    </v-col>

                    <v-col
                      cols="12"
                      sm="6"                    
                      >
                        <!--SLA no longer needed (this will be automatically computed)
                        <v-text-field
                        class="ml-1"
                        label="SLA"
                        outlined
                        v-model="editedItem.sla"
                        >
                        </v-text-field>
                        -->

                        <!--Request Category change to ticket category-->
                        <v-select
                        :items="priority"
                        class="ml-1"
                        label="Priority"
                        outlined
                        v-model="editedItem.priority" 
                        v-if="editedItem.status != 'Closed' && editedItem.status != 'Resolved'"
                        ></v-select>

                        

                    </v-col>

                    <v-col sm="6" cols="12">
                    <!--State-->
                        <v-select
                        :items="state"
                        class="mr-1"
                        item-text="title"
                        label="State"
                        outlined
                        v-model="editedItem.status" 
                        v-if="editedItem.status != 'Closed' && editedItem.status != 'Resolved'"
                        ></v-select>

                      </v-col>

                      <v-col sm="6" cols="12">
                      <!--State-->
                        <v-select
                        :items="sla"
                        class="ml-1"
                        item-text="title"
                        label="SLA"
                        outlined
                        v-model="editedItem.sla" 
                        v-if="editedItem.status != 'Closed' && editedItem.status != 'Resolved'"
                        ></v-select>
                      </v-col>
                        

                      <v-col cols="12">

                        <v-textarea
                        label="Diagnostic"
                        rows="3"
                        outlined
                        clearable
                        no-resize
                        v-model="editedItem.diagnostic"
                        v-if="editedItem.status != 'Closed' && editedItem.status != 'Resolved'"
                        ></v-textarea>

                        <!--Diagnostic pag closed/resolved na-->
                        <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title  mb-1">Diagnostic</h3>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.diagnostic != ''" class="body-2 update-font">{{this.editedItem.diagnostic}}</p>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.diagnostic == ''" class="body-2 update-font">No diagnostics.</p>


                        <!-- 
                          useless resolution textarea 

                        <v-textarea
                        label="Resolution"
                        rows="3"
                        outlined
                        clearable
                        no-resize
                        v-model="editedItem.resolution"
                        v-if="editedItem.status != 'Closed' && editedItem.status != 'Resolved'"
                        ></v-textarea>
                        -->
                      </v-col>

                      

                      <v-col sm="6" cols="12">
                        <!--Date Created pag closed/resolved na-->
                        <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title  mb-1">Date Created</h3>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.date_created != ''" class="body-2 update-font">{{this.editedItem.date_created}}</p>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.date_created == ''" class="body-2 update-font">No resolution.</p>

                      </v-col>

                      <v-col sm="6" cols="12">
                        <!--Date Created pag closed/resolved na-->
                        <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title  mb-1">Date Resolved</h3>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.date_resolved != ''" class="body-2 update-font">{{this.editedItem.date_resolved}}</p>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.date_resolved == ''" class="body-2 update-font">Not resolved yet.</p>
                      </v-col>

                      <v-col>
                        <!--Resolution pag closed/resolved na-->
                        <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title  mb-1">Resolution Duration</h3>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.resolution != ''" class="body-2 update-font">{{this.editedItem.resolution}}</p>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.resolution == ''" class="body-2 update-font">No resolution.</p>


                        <v-textarea
                        label="Comments"
                        rows="3"
                        outlined
                        clearable
                        no-resize
                        v-model="editedItem.comments"
                        v-if="editedItem.status != 'Closed'"
                        ></v-textarea>

                        <!--Comment pag closed na-->
                        <h3 v-if="editedItem.status == 'Closed'" class="title  mb-1">Comments</h3>
                        <p v-if="(editedItem.status == 'Closed') && this.editedItem.resolution != ''" class="body-2 update-font">{{this.editedItem.comments}}</p>
                        <p v-if="(editedItem.status == 'Closed') && this.editedItem.resolution == ''" class="body-2 update-font">No comment inserted.</p>

                      </v-col>

                      
                      </v-row>


                      

                      
                        

                        

                      


                     
                      

                      
                      

                     
                      <!--buttons-->
                      <v-card-actions class="justify-center">

                        

                        <v-btn
                        style="background-color: #388E3C; color: white;"
                        text
                        @click="updateTicket()"
                        v-if="editedItem.status != 'Closed'"
                        >
                        Update
                        </v-btn>

                        <v-btn
                        style="background-color:#0275d8; color: white;"
                        class="color-primary"
                        text
                        v-if="editedItem.status != 'Resolved' && editedItem.status != 'Closed'"
                        @click="settoResolved()"
                        >
                        Resolve Ticket
                        </v-btn>


                        <v-btn
                        style="background-color: yellow; color: black;"
                        text
                        @click="settoClosed()"
                        v-if="editedItem.status == 'Resolved'"
                        >
                        Close Ticket
                        </v-btn>
                        
                        
                        
                      </v-card-actions>

                  </v-container>
              </v-form>
              </v-card-text>
            </v-card>


        </v-dialog>
            
          </div>

            
</template>

<script>
import axios from 'axios'
import moment from 'moment'
export default {
    name: "AllTicketsTab",
    data(){
        return{
             headers: [
                { text: 'TICKET NO.', value: 'ticket' },
                //changed from request-category to priority (05-04)
                { text: 'PRIORITY', value: 'priority' },
                { text: 'REQUESTOR', value: 'requestor' },
                { text: 'DEPARTMENT', value: 'department' },
                { text: 'CATEGORY', value: 'category' },
                { text: 'DESCRIPTION', value: 'description', align:' d-none' },
                { text: 'STATE', value: 'state' },
                { text: 'CREATED', value: 'date_created' },
                { text: 'RESPONDED', value: 'date_responded' },
                { text: 'RESOLVED', value: 'date_resolved' },
                { text: 'ASSIGNED ENGR', value: 'assigned_engineer' },
                { text: 'RESPONSE TIME', value: 'response_time', align:' d-none' },
                { text: 'ACTION', value: 'action' },

            ],
            activities:[
                {title:'New Tickets',amounts:0},
                {title:'Ongoing Tickets',amounts:0},
                {title:'Pending Tickets',amounts:0},
                {title:'Resolved Tickets',amounts:0},
                {title:'Closed Tickets',amounts:0},
                {title:'Cancelled Tickets',amounts:0},
             ],  
             activeness:{
              'new':false,
              'ongoing':false,
              'pending':false,
              'resolved':false,
              'closed':false,
              'cancelled':false,
            },
            priority:[
            'Low',
            'Medium',
            'High',
            'Critical'
            ],
            tickets: [],
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
            editedItem:{},
            responseTimeHandler:'none',
            responseNotNaN:false,
            updateModal:false,
            response_mins:false,
            response_days:false,
            mins:false,
            days:false,
            state:[
            'Ongoing',
            'Pending',
            'Cancelled'
            ],
            sla:[
            '30 minutes',
            '1 hour',
            '2 hours',
            '4 hours',
            '8 hours',
            '1 day',
            '3 days',
            '7 days',
            '14 days',
            '30 days',
            'More'
            ],
            date1:'2022-09-14 12:00:00',
            date2:'2022-12-15 12:21:00' ,
            downloadURL:'skills.png'
            //gawin mo naman incident and problem

        }
    },
    methods:{
      getPosts(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/requests/get_requests.php')
            .then((response)=>{
                console.log(response.data)
                this.tickets=response.data;
            })
            .catch((error)=> {
                console.log(error)
            })
       },
       getTicketNum(){
        axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_ticketno.php?action=request',{
          action:'request'
        })
          .then((response)=>{
            console.log(response.data)
            this.activities[0].amounts = response.data.new_rows;
            this.activities[1].amounts = response.data.ongoing_rows;
            this.activities[2].amounts = response.data.pending_rows;
            this.activities[3].amounts = response.data.resolved_rows;
            this.activities[4].amounts = response.data.closed_rows;
            this.activities[5].amounts = response.data.cancelled_rows;
          })
      },
       editItem (item) {

          //assign values to editedItem
          this.editedItem = Object.assign({}, item)
          //open update ticket modal
          this.updateModal = true;

          axios.post(
            'http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/requests/get-closed-resolved.php',
            {
              id:this.editedItem.id
            })
            .then((response)=>{
              console.log("id: " + response.data.id + " date created: " + response.data.date_created + " date resolved: " + response.data.date_resolved +  " date responded: " + response.data.date_responded)
              
              this.date1 = response.data.date_created;
              this.date2 = response.data.date_resolved;
              this.date3 = response.data.date_responded;
              

              //own assigned values
              var date3 = moment(this.date3,"YYYY-MM-DD HH:mm:ss"); //responded date
              var date2 = moment(this.date2,"YYYY-MM-DD HH:mm:ss"); //resolved date
              var date1 = moment(this.date1,"YYYY-MM-DD HH:mm:ss"); //created date


              //differenciating here
              var diff = moment.duration(date2.diff(date1));
              var response_diff = moment.duration(date3.diff(date1));

              /* response diff declaration */
              let response_diff_mins = 0;
              let response_diff_days = 0;
              let response_diff_hours = response_diff.asHours().toFixed(2);

              /* resolution diff declaration */
              //var moment1 = moment(diffdays).format('D[ day(s)] H[ hour(s)] m[ minute(s)] s[ second(s)]')\
              let diff_mins = 0;
              let diff_days = 0;
              let diff_hours = diff.asHours().toFixed(2);


              //getting difference (getting response time) 
              if(response_diff_hours < 1){
                  this.response_mins = true;
                 response_diff_mins = response_diff.asMinutes().toFixed(2);
                 console.log(" 1st statement "+ response_diff_mins)
              }
              else if (response_diff_hours >= 24){
                this.response_mins = false;
                this.response_days = true;
                 response_diff_days = response_diff.asDays().toFixed(2);
                 console.log(" 2nd statement "+ response_diff_days)
              }
              else{
                 response_diff_hours = response_diff.asHours().toFixed(2);
                 console.log(" 3rd statement "+ response_diff_hours)
              }


              //getting difference (getting resolution time) 
              if(diff_hours < 1){
                  this.mins = true;
                 diff_mins = diff.asMinutes().toFixed(2);
              }
              else if (diff_hours >= 24){
                this.mins = false;
                this.days = true;
                 diff_days = diff.asDays().toFixed(2);
              }
              else{
                 diff_hours = diff.asHours().toFixed(2);
              }

              
              //depends on which is satisfied (resolution time) 
              if(this.days == true && this.mins == false ){
                this.editedItem.resolution = diff_days + " days ";
              }
              else if(this.mins == true){
                this.editedItem.resolution = diff_mins + " minutes ";
              }
              else if(this.mins == false){
                this.editedItem.resolution = diff_hours + " hours ";
              }
              else{
                this.editedItem.resolution = "could not proceed";
              }

              //depends on which is satisfied (response time) 
              if(this.response_days == true && this.response_mins == false ){
                this.responseTimeHandler = response_diff_days + " days ";
                if((this.editedItem.date_responded != '' || this.editedItem.date_responded != undefined || this.editedItem.date_responded !=  null) && response_diff_days != 0){
                  this.responseNotNaN = true
                  console.log(this.responseTimeHandler)
                }
              }
              else if(this.response_mins == true){
                this.responseTimeHandler  = response_diff_mins + " minutes ";
                if((this.editedItem.date_responded != '' || this.editedItem.date_responded != undefined || this.editedItem.date_responded !=  null) && response_diff_mins != 0){
                  this.responseNotNaN = true
                  console.log(this.responseTimeHandler)
                }
              }
              else if(this.response_mins == false){
                this.responseTimeHandler  = response_diff_hours + " hours ";
                if((this.editedItem.date_responded != '' || this.editedItem.date_responded != undefined || this.editedItem.date_responded !=  null) && response_diff_hours != 0){
                  this.responseNotNaN = true
                  console.log(this.responseTimeHandler)
                }
              }
              else{
                this.responseTimeHandler  = "could not proceed";
              }

              console.log("Resolution Time: " + this.editedItem.resolution);
              console.log("Response Time: " + this.responseTimeHandler );
              
            })
            .catch((error)=> {
              console.log(error)
            });

      },
      updateTicket(){
          /* console.log(this.editedItem.id, this.editedItem.requestor, this.editedItem.contact_no, this.editedItem.issue, this.editedItem.description,this.editedItem.diagnostic)
          alert("Update functionality" + " "+ this.editedItem.id); */
          
          axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/update_ticket.php',
                    {
                        id: this.editedItem.id,
                        assigned_engineer: this.editedItem.assigned_engineer,
                        sla: this.editedItem.sla,
                        status:this.editedItem.status,
                        diagnostic:this.editedItem.diagnostic,
                        resolution: this.editedItem.resolution,
                        comments: this.editedItem.comments,
                        priority: this.editedItem.priority,
                        action:'request'
                    })
                    .then((response)=>{
                        alert(response.data.message);
                        location.reload()
                    })
                    .catch((error)=> {
                        console.log(error)
                    });
            
            
        },

        settoClosed(){
          console.log(this.editedItem.id)
          if(confirm('Are you sure you want to close this ticket?')){
            axios.post(
            'http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/close_ticket.php',
            {
              id:this.editedItem.id,
              action:'request'
            })
            .then((response)=>{
              alert(response.data.message);
              location.reload()
            })
            .catch((error)=> {
              console.log(error)
            });
          }
        },

        settoResolved(){
          console.log(this.editedItem.id)
          if(confirm('Are you sure you want to resolve this ticket?')){
            axios.post(
            'http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/resolve_ticket.php',
            {
              id:this.editedItem.id,
              action:'request'
            })
            .then((response)=>{
              alert(response.data.message);
              location.reload()
            })
            .catch((error)=> {
              console.log(error)
            });

            
          }
        },
        trial(){
          console.log("bat ayaw")

          // GINAGAWA MO NA YUNG DIFFERENCE PERO DI KAYA, UNAHIN MO RAW MUNA FILTER
          // UNAHIN MUNA RAW FILTER FOR STATUS
              
          //own assigned values
          var date2 = moment(this.date2,"YYYY-MM-DD HH:mm:ss");
          var date1 = moment(this.date1,"YYYY-MM-DD HH:mm:ss");

          //differenciating here
          //var diffdays = date2.diff(date1)
          //let diffdays = moment.duration(date2.diff(date1), "days")


          var diff = date2.diff(date1)
          var hello = diff.format('M [months] D [day(s)] H [Hour(s)]')

          //let days = diffdays.asDays();
          //let duration = moment.duration(end.diff(start));

          //var moment1 = moment(diffdays).format('M [month(s)] D[ day(s)] H[ hour(s)] m[ minute(s)] s[ second(s)]')
          console.log(hello)
            
        },

        //For filtering

        filterNew(){
          
          this.activeness.new = !this.activeness.new

          //everything else false
          this.activeness.ongoing = false
          this.activeness.pending = false
          this.activeness.resolved = false
          this.activeness.closed = false
          this.activeness.cancelled = false

          
          if(this.activeness.new  == true){
            axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/requests/get_requests.php?action=new ')
              .then((response)=>{
                  console.log(response.data)
                  this.tickets=response.data;
              })
              .catch((error)=> {
                  console.log(error)
            })
          }
          
          

          else if(this.activeness.new  == false || this.activeness.ongoing  == false || this.activeness.pending  == false || this.activeness.resolved  == false || this.activeness.closed  == false || this.activeness.cancelled  == false){
            this.getPosts()
          }

          console.log(this.activeness.new)
          //change tickets based on response (must be new tickets only)
        },

        filterOngoing(){
          this.activeness.ongoing = !this.activeness.ongoing
          //everything else false
          this.activeness.new = false
          this.activeness.pending = false
          this.activeness.resolved = false
          this.activeness.closed = false
          this.activeness.cancelled = false

          if(this.activeness.ongoing  == true){
            axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/requests/get_requests.php?action=ongoing')
              .then((response)=>{
                  console.log(response.data)
                  this.tickets=response.data;
              })
              .catch((error)=> {
                  console.log(error)
            })
          }
          

        else if(this.activeness.new  == false || this.activeness.ongoing  == false || this.activeness.pending  == false || this.activeness.resolved  == false || this.activeness.closed  == false || this.activeness.cancelled  == false){
            this.getPosts()
          }
        },
        filterPending(){
        
        this.activeness.pending = !this.activeness.pending
        //everything else false
        this.activeness.ongoing = false
        this.activeness.new = false
        this.activeness.resolved = false
        this.activeness.closed = false
        this.activeness.cancelled = false

        if(this.activeness.pending  == true){
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/requests/get_requests.php?action=pending')
            .then((response)=>{
                console.log(response.data)
                this.tickets=response.data;
            })
            .catch((error)=> {
                console.log(error)
          })
        }
        

        else if(this.activeness.new  == false || this.activeness.ongoing  == false || this.activeness.pending  == false || this.activeness.resolved  == false || this.activeness.closed  == false || this.activeness.cancelled  == false){
          this.getPosts()
        }
        },
        filterResolved(){
        
        this.activeness.resolved = !this.activeness.resolved
        //everything else false
        this.activeness.ongoing = false
        this.activeness.pending = false
        this.activeness.new = false
        this.activeness.closed = false
        this.activeness.cancelled = false

        if(this.activeness.resolved  == true){
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/requests/get_requests.php?action=resolved')
            .then((response)=>{
                console.log(response.data)
                this.tickets=response.data;
            })
            .catch((error)=> {
                console.log(error)
          })
        }
        

        else if(this.activeness.new  == false || this.activeness.ongoing  == false || this.activeness.pending  == false || this.activeness.resolved  == false || this.activeness.closed  == false || this.activeness.cancelled  == false){
          this.getPosts()
        }
      },
      filterClosed(){
        
        this.activeness.closed = !this.activeness.closed
        //everything else false
        this.activeness.ongoing = false
        this.activeness.pending = false
        this.activeness.resolved = false
        this.activeness.new = false
        this.activeness.cancelled = false

        if(this.activeness.closed  == true){
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/requests/get_requests.php?action=closed')
            .then((response)=>{
                console.log(response.data)
                this.tickets=response.data;
            })
            .catch((error)=> {
                console.log(error)
          })
        }
        

        else if(this.activeness.new  == false || this.activeness.ongoing  == false || this.activeness.pending  == false || this.activeness.resolved  == false || this.activeness.closed  == false || this.activeness.cancelled  == false){
          this.getPosts()
        }
      },
      filterCancelled(){
        
        this.activeness.cancelled = !this.activeness.cancelled
        //everything else false
        this.activeness.ongoing = false
        this.activeness.pending = false
        this.activeness.resolved = false
        this.activeness.closed = false
        this.activeness.new = false

        if(this.activeness.cancelled  == true){
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/requests/get_requests.php?action=cancelled')
            .then((response)=>{
                console.log(response.data)
                this.tickets=response.data;
            })
            .catch((error)=> {
                console.log(error)
          })
        }
        

        else if(this.activeness.new  == false || this.activeness.ongoing  == false || this.activeness.pending  == false || this.activeness.resolved  == false || this.activeness.closed  == false || this.activeness.cancelled  == false){
          this.getPosts()
        }
      },
      downloadFile(file){
        axios.get('http://localhost:8080/HelpDeskMgen-main2/HelpDeskMgen-main/src/upload/'+file,{
          responseType:'blob'
        }
        ).then((response)=>{
          var fileUrl = window.URL.createObjectURL(new Blob([response.data]))
          var fileLink = document.createElement('a')
          fileLink.href = fileUrl

          fileLink.setAttribute('download', file);
          document.body.appendChild(fileLink);
          fileLink.click();
        })  
        .catch((error)=> {
            console.log(error)
            alert('File does not exist. (The file may have been deleted)')
        })
      }
      
    },
    created: function(){
      this.getPosts();
      this.getTicketNum();
    }
};

</script>

<style>
  .active{
    background-color:rgb(206, 204, 204);
  }
</style>