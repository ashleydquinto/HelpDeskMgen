<template>
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
                      

                      <!--Justification
                      <v-textarea
                      label="Justification"
                      class="ml-1"
                      rows="3"
                      outlined
                      no-resize
                      v-model="editedItem.justification"
                      >
                      </v-textarea>
                      -->
                      
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

                    

                    <v-col cols="12">
                    <!--State pag closed na-->
                    <h3 v-if="editedItem.status == 'Closed'" class="title  mb-1">State</h3>
                    <p v-if="editedItem.status == 'Closed'" style="color: #D32F2F" class="body-2 update-font">{{this.editedItem.status}}</p>

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
                      >
                      </v-text-field>
                      
                    </v-col>

                    <v-col
                      cols="12"
                      sm="6"                    
                      >
                    <!--SLA-->
                        <v-text-field
                        class="ml-1"
                        label="SLA"
                        outlined
                        v-model="editedItem.sla"
                        >
                        </v-text-field>

                    </v-col>


                      <v-col>
                        <!--Request Category-->
                        <v-select
                        :items="request_categories"
                        class=""
                        label="Request Category"
                        outlined
                        v-model="editedItem.request_category" 
                        ></v-select>

                        <!--State-->
                        <v-select
                        :items="state"
                        class=""
                        item-text="title"
                        label="State"
                        outlined
                        v-model="editedItem.status" 
                        v-if="editedItem.status != 'Closed'"
                        ></v-select>

                        <v-textarea
                        label="Diagnostic"
                        rows="3"
                        outlined
                        clearable
                        no-resize
                        v-model="editedItem.diagnostic"
                        ></v-textarea>

                        <v-textarea
                        label="Resolution"
                        rows="3"
                        outlined
                        clearable
                        no-resize
                        v-model="editedItem.resolution"
                        ></v-textarea>

                        <v-textarea
                        label="Comments"
                        rows="3"
                        outlined
                        clearable
                        no-resize
                        v-model="editedItem.comments"
                        ></v-textarea>

                      </v-col>

                      
                      </v-row>


                      

                      
                        

                        

                      


                     
                      

                      
                      

                     
                      <!--buttons-->
                      <v-card-actions class="justify-center">

                        

                        <v-btn
                        style="background-color: #388E3C; color: white;"
                        text
                        @click="updateTicket()">
                        Update
                        </v-btn>


                        <v-btn
                        style="background-color: yellow; color: black;"
                        text
                        @click="settoClosed()"
                        v-if="editedItem.status != 'Closed'"
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
            'Resolved',
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
          { text: 'REQUEST CATEGORY', value: 'request_category' },
          { text: 'REQUESTOR', value: 'requestor' },
          { text: 'DEPARTMENT', value: 'department' },
          { text: 'CATEGORY', value: 'category' },
          { text: 'DESCRIPTION', value: 'description' },
          { text: 'STATE', value: 'state' },
          { text: 'CREATED', value: 'date_created' },
          { text: 'RESOLVED', value: 'resolved' },
          { text: 'ASSIGNED ENGR', value: 'assigned_engineer' },
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
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_tickets.php?action=show')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_tickets.php?action=new')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_tickets.php?action=ongoing')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_tickets.php?action=pending')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_tickets.php?action=resolved')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_tickets.php?action=closed')
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
          axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_tickets.php?action=cancelled')
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
          
          axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/update_ticket.php',
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
          axios.post(
            'http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/close_ticket.php',
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
</style>