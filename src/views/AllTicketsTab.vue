<template>


  <!--NOTICE: THIS WON'T BE USED ANYMORE, BUT WE CAN STILL USE IT AS REFERENCE-->

  <!-- again, OBSOLETE COMPONENT (for reference nalang) -->

  
    <!--added for support content here (5:11pm - 04-08-2022)-->
    <div>
        <v-row>
            <v-col lg="4" cols="8" > <!--v-for="(item,index) in activities" :key="index"-->
                <!--
                <v-card elevation="2" class="rounded-lg" v-bind:class="{ active: boxActive }" @click="toggleBox()">
                    <v-card-text class="d-flex justify-space-between align-center">
                        <div class="">
                            <regular >{{item.title}}</regular><br><br>
                            <h1 >{{item.amounts}}</h1>
                        </div>
                    </v-card-text>
                </v-card>
                -->
                <v-card elevation="2" class="rounded-lg" v-bind:class="{ active: activeness.new }" @click="filterNew()">
                  <v-card-text class="justify-space-between align-center">
                    <regular >{{this.activities[0].title}}</regular><br><br>
                    <h1 >{{this.activities[0].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" v-bind:class="{ active: activeness.ongoing }" @click="filterOngoing()">
                  <v-card-text class="justify-space-between align-center">
                    <regular >{{this.activities[1].title}}</regular><br><br>
                    <h1 >{{this.activities[1].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" v-bind:class="{ active: activeness.pending }" @click="filterPending()">
                  <v-card-text class="justify-space-between align-center">
                    <regular >{{this.activities[2].title}}</regular><br><br>
                    <h1 >{{this.activities[2].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" v-bind:class="{ active: activeness.resolved }" @click="filterResolved()">
                  <v-card-text class="justify-space-between align-center">
                    <regular >{{this.activities[3].title}}</regular><br><br>
                    <h1 >{{this.activities[3].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" v-bind:class="{ active: activeness.closed }" @click="filterClosed()">
                  <v-card-text class="justify-space-between align-center">
                    <regular >{{this.activities[4].title}}</regular><br><br>
                    <h1 >{{this.activities[4].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>

            <v-col lg="4" cols="8" >
                <v-card elevation="2" class="rounded-lg" v-bind:class="{ active: activeness.cancelled }" @click="filterCancelled()">
                  <v-card-text class="justify-space-between align-center">
                    <regular >{{this.activities[5].title}}</regular><br><br>
                    <h1 >{{this.activities[5].amounts}}</h1>
                  </v-card-text>
                </v-card>
            </v-col>
          </v-row>
          
     <v-row>
            <v-col lg="12">
                <v-data-table
                caption="TICKETS"
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
                        <!-- (THIS IS A COMMENT) item.id must be fetched............... @click="openUpdate(item)" DI MAGAMIT AS FUCK-->

                        <!--
                        <v-icon
                          medium
                          @click="editItem(item)"
                        >
                          mdi-clipboard-edit-outline
                        </v-icon>
                        -->

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
                        @click="updateModal = false">
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

                    <v-col sm = "6" cols="12">

                      <!--Justification-->
                      <h3 class="title">Attached File</h3>
                      <p class="body-2 update-font" v-if="editedItem.attached_file != '' && editedItem.attached_file != NULL">{{this.editedItem.attached_file}}</p>
                      <p class="body-2 update-font" v-if="editedItem.attached_file == '' || editedItem.attached_file == NULL || editedItem.attached_file == undefined">No file was uploaded for this ticket.</p>

                    </v-col>

                    <v-col sm = "6" cols="12">

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
                      <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title mb-1">Ticket Category</h3>
                      <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.request_category != ''" class="body-2 update-font">{{this.editedItem.request_category}}</p>
                      <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.request_category == ''" class="body-2 update-font">No ticket category.</p>
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
                        :items="request_categories"
                        class="ml-1"
                        label="Ticket Category"
                        outlined
                        v-model="editedItem.request_category" 
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
                        

                      <v-col>

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

                        <v-textarea
                        label="Resolution"
                        rows="3"
                        outlined
                        clearable
                        no-resize
                        v-model="editedItem.resolution"
                        v-if="editedItem.status != 'Closed' && editedItem.status != 'Resolved'"
                        ></v-textarea>

                        <!--Resolution pag closed/resolved na-->
                        <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title  mb-1">Resolution</h3>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.resolution != ''" class="body-2 update-font">{{this.editedItem.resolution}}</p>
                        <p v-if="(editedItem.status == 'Closed' || editedItem.status == 'Resolved') && this.editedItem.resolution == ''" class="body-2 update-font">No resolution.</p>

                        <!--SLA-->
                        <h3 v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="title  mb-1">Resolution Time</h3>
                        <p v-if="editedItem.status == 'Closed' || editedItem.status == 'Resolved'" class="body-2 update-font sla-fontstyle">Resolution time should be placed here.</p>


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
export default {
    name: "AllTicketsTab",

    //<!--added for support content here (5:11pm - 04-08-2022)-->
    data(){
        return{
          activeness:{
            'new':false,
            'ongoing':false,
            'pending':false,
            'resolved':false,
            'closed':false,
            'cancelled':false,
          },
          state:[
            'Ongoing',
            'Pending',
            'Cancelled'
          ],
          request_categories:[
            'Request',
            'Problem',
            'Incident'
          ],
            activities:[
                {title:'New Tickets',amounts:0},
                {title:'Ongoing Tickets',amounts:0},
                {title:'Pending Tickets',amounts:0},
                {title:'Resolved Tickets',amounts:0},
                {title:'Closed Tickets',amounts:0},
                {title:'Cancelled Tickets',amounts:0},
             ],  
             xValues:[
               "Total Tickets", "New Tickets", "Available Tickets", "Ongoing Tickets", "Pending Tickets", "Resolved Tickets", "Closed Tickets", "Cancelled Tickets"
             ],
             yValues:{
               'total':0,
               'new':0,
               'available':0,
               'ongoing':0,
               'pending':0,
             },
             headers: [
          { text: 'TICKET NO.', value: 'ticket' },
          { text: 'TICKET CATEGORY', value: 'request_category' },
          { text: 'REQUESTOR', value: 'requestor' },
          { text: 'DEPARTMENT', value: 'department' },
          { text: 'CATEGORY', value: 'category' },
          { text: 'DESCRIPTION', value: 'description' },
          { text: 'STATE', value: 'state' },
          { text: 'CREATED', value: 'date_created' },
          { text: 'RESOLVED', value: 'date_resolved' },
          { text: 'ASSIGNED ENGR', value: 'assigned_engineer' },
          { text: 'SLA', value: 'sla', align:' d-none' },
          { text: 'ACTION', value: 'action' },

        ],
          updateModal:false,
          editedItem:{
            id:'',
            ticket:'',
            status:'',
            created:'',
            assigned_engineer:'',
            request_category:'',
            sla:''
          },
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
        ]
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
      getPosts(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_tickets.php?action=show')
            .then((response)=>{
                console.log(response.data)
                this.tickets=response.data;
            })
            .catch((error)=> {
                console.log(error)
            })
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
      filterNew(){
        //filter new (ginawa 8:12pm apr22)
        
        this.activeness.new = !this.activeness.new
        //everything else false
        this.activeness.ongoing = false
        this.activeness.pending = false
        this.activeness.resolved = false
        this.activeness.closed = false
        this.activeness.cancelled = false
        //this.activeness.new = true

        if(this.activeness.new  == true){
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_tickets.php?action=new')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_tickets.php?action=ongoing')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_tickets.php?action=pending')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_tickets.php?action=resolved')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_tickets.php?action=closed')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_tickets.php?action=cancelled')
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


      editItem (item) {

          //assign values to editedItem
          this.editedItem = Object.assign({}, item)
          //console.log(this.editedItem)
          //console.log(this.editedItem.id)
          
          //open update ticket modal
          this.updateModal = true;

      },

      //to update a ticket

      updateTicket(){
          /* console.log(this.editedItem.id, this.editedItem.requestor, this.editedItem.contact_no, this.editedItem.issue, this.editedItem.description,this.editedItem.diagnostic)
          alert("Update functionality" + " "+ this.editedItem.id); */
          console.log(this.editedItem.request_category)
          
          axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/update_ticket.php',
                    {
                        id: this.editedItem.id,
                        assigned_engineer: this.editedItem.assigned_engineer,
                        sla: this.editedItem.sla,
                        status:this.editedItem.status,
                        request_category:this.editedItem.request_category,
                        diagnostic:this.editedItem.diagnostic,
                        resolution: this.editedItem.resolution,
                        comments: this.editedItem.comments
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
              id:this.editedItem.id
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
              id:this.editedItem.id
            })
            .then((response)=>{
              alert(response.data.message);
              location.reload()
            })
            .catch((error)=> {
              console.log(error)
            });
          }
        }
    },
    created: function(){
      this.getTicketNum();
      this.getPosts();
      this.trial();
    }
};

</script>

<style scoped>

.active{
  background-color:rgb(206, 204, 204);
}

.sla-fontstyle{
  font-style: italic;
}
</style>