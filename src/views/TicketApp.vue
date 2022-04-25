<template>
    <div class="ticketapp">
        <v-subheader class="d-flex justify-space-between align-center">
              <v-col
          
            >
            <h1>Ticket</h1>
            </v-col>
            <v-row justify="end">
    
      <v-dialog
        transition="dialog-bottom-transition"
        max-width="900"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn style="background-color: #1e6097; color: white;"
            v-bind="attrs"
            v-on="on"
          >New Ticket</v-btn>
        </template>
        
        <!--new ticket form starts here-->
        <template v-slot:default="dialog">
          <v-card>
            <v-toolbar style="background-color: #1e6097; color: white;"
              dark
            >New Ticket Form</v-toolbar>
            <br>
            <v-card-text>
             <v-form>
                <v-container>
                    <v-row no-gutters>

                      
                      
                     <v-col
                     cols="12"
                     sm="6"  
                                      
                     >
                     <!--Requestor-->
                     <v-text-field
                      label="Requestor"
                      outlined
                      clearable
                      v-model="addTicket.requestor"
                      >
                      </v-text-field>
                    <!--Contact Number-->
                    </v-col>
                     <v-col
                    cols="12"
                    sm="6"                    
                     >
                     <v-text-field
                    label="Contact Number"
                    class="pl-4" 
                    outlined
                    clearable
                    v-model="addTicket.contact_no"
                    maxlength="11"
                    >
                    </v-text-field>
                    </v-col>

                     <v-col                 
                     >
                     <!--Department-->
                     <v-text-field
                    label="Department"
                    outlined
                    clearable
                    v-model="addTicket.department"
                    ></v-text-field>

                    <!--Issue-->
                    <v-select
                      :items="issues"
                      item-text="title"
                      label="Issue"
                      outlined
                      v-model="addTicket.issue" 
                    ></v-select>

                    <!--
                    Description
                    changed to textarea (04-11)
                    -->
                     <v-textarea
                    label="Description"
                    rows="3"
                    outlined
                    clearable
                    no-resize
                    v-model="addTicket.description"
                    ></v-textarea>

                    <!--
                    Justification
                    changed to textarea (04-11)
                    -->
                     <v-textarea
                    label="Justification"
                    rows="3"
                    outlined
                    clearable
                    no-resize
                    v-model="addTicket.justification"
                    ></v-textarea>
                    </v-col>
                    </v-row>

                    <!--buttons-->
                    <v-card-actions class="justify-center">

                      <v-btn
                      style="background-color: #388E3C; color: white;"
                      text
                      @click="submitTicket(), dialog.value = false">
                      Submit
                      </v-btn>

                      <v-btn
                      style="background-color: #D32F2F; color: white;"
                      text
                      @click="dialog.value = false">
                      Close
                      </v-btn>
                      
                    </v-card-actions>

                 </v-container>
             </v-form>
            </v-card-text>
          </v-card>
        </template>
      </v-dialog>
    </v-row>
            </v-subheader><br>
            <v-row>
            <v-col lg="12">
                <v-data-table
                caption="TICKETS"
                :headers="headers"
                :items="tickets"
                class="pt-4 elevation-1"
                >
                <!--@click:row="rowClick"-->
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
                    
                    
                    <!--
                    <template v-slot:[`item.action`]="{ item }">
                        <!-!- (THIS IS A COMMENT) item.id must be fetched............... @click="openUpdate(item)" DI MAGAMIT AS FUCK-!->

                        <!-!-
                        <v-icon
                          medium
                          @click="editItem(item)"
                        >
                          mdi-clipboard-edit-outline
                        </v-icon>
                        -!->

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
                    -->
                    
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
              >Update Ticket {{this.editedItem.id}}</v-toolbar>
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
                        style="background-color: #D32F2F; color: white;"
                        text
                        @click="updateModal = false">
                        Close
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
    name: "TicketApp",
    data(){
        return{
          issues:'',
          /*
          state:[
            'New',
            'Ongoing',
            'Pending',
            'Resolved',
            'Closed',
            'Cancelled'
          ],
          request_categories:[
            'Request',
            'Problem',
            'Incident'
          ],
          */
          editedItem:{
            id:'',
            ticket:'',
            status:'',
            created:'',
            assigned_engineer:'',
            request_category:'',
          },
          headers: [
            { text: 'TICKET NO.', value: 'ticket' },
            { text: 'REQUESTOR', value: 'requestor' },
            { text: 'DEPARTMENT', value: 'department' },
            { text: 'CATEGORY', value: 'category' },
            { text: 'DESCRIPTION', value: 'description' },
            { text: 'JUSTIFICATION', value: 'justification', align:' d-none'}, //' d-none' hides the column but keeps the search ability
            { text: 'STATE', value: 'state' },
            { text: 'CREATED', value: 'date_created' },
            { text: 'RESOLVED', value: 'date_resolved' },
            { text: 'ASSIGNED ENGR', value: 'assigned_engineer' },
            { text: 'SLA', value: 'sla', align:' d-none'},
            { text: 'DIAGNOSTIC', value: 'diagnostic', align:' d-none'},
            { text: 'RESOLUTION', value: 'resolution', align:' d-none'},
            { text: 'COMMENTS', value: 'comments', align:' d-none'},
            //{ text: 'ACTION', value: 'action', align: 'center'},
          ],
          tickets: [
            //Deleted na yung nilagay ni ash
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
            'Action'
          ],
          addTicket:{
            hiddenId:'',
            requestor:'',
            department:'',
            contact_no:'',
            issue:'',
            description:'',
            justification:'',
            status:'New'
          },
          /*
          updateModal:false,
          */
        }
    },
    methods: {
      openAddTicket(){
           this.ticketOpen =true; 
           console.log('openticket')
        },
      closeAddTicket(){
        this.ticketOpen =false;
        }, 
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
       getIssue(){
            axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_issue.php')
                .then((response)=>{
                    console.log(response.data)
                    this.issues=response.data
                })
                .catch((error)=> {
                console.log(error)
                })
        },
        submitTicket(){
            if(this.addTicket.requestor != '' && this.addTicket.department != '' && this.addTicket.contact_no != '' && this.addTicket.issue != ''){
               axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/add_ticket.php',
                    {
                        requestor:this.addTicket.requestor,
                        department:this.addTicket.department,
                        contact_no:this.addTicket.contact_no,
                        issue:this.addTicket.issue,
                        description:this.addTicket.description,
                        justification:this.addTicket.justification,
                        status:this.addTicket.status,
                        
                    })
                    .then((response)=>{
                        console.log(response.data.message);
                        this.addTicket.requestor=""
                        this.addTicket.department=""
                        this.addTicket.contact_no=""
                        this.addTicket.issue=""
                        this.addTicket.description=""
                        
                        //location.reload();
                        alert(response.data.message);
                        location.reload()
                        //this.closeAddTicket()
                        //this.refreshPage()
                    })
                    .catch((error)=> {
                        console.log(error)
                    });
            }
           else{
               alert("Fill all the fields");
           }

          
        },
        /* 
        //update function (cinomment na dahil di na magagamit for this page)


        updateTicket(){
          console.log(this.editedItem.id, this.editedItem.requestor, this.editedItem.contact_no, this.editedItem.issue, this.editedItem.description,this.editedItem.diagnostic)
          alert("Update functionality" + " "+ this.editedItem.id); 
          
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
        */

        /*
        editItem (item) {

          //assign values to editedItem
          this.editedItem = Object.assign({}, item)
          //console.log(this.editedItem)
          console.log(this.editedItem.id)
          
          //open update ticket modal
          this.updateModal = true;

        }
        */

        /*
          USELESS STUFF BELOW

        rowClick: function(item,row){
          row.select(false);

          //assign value
          this.updateVariables.requestor = item.requestor;
          this.updateVariables.contact_no = item.contact_no;
          this.updateVariables.department = item.department;
          this.updateVariables.issue = item.issue;
          this.updateVariables.description = item.description;
          this.updateVariables.justification = item.justification;


          //open update ticket modal
          this.updateTicket = true;

          console.log(
            "item id: " + item.id,
            "item requestor: " + item.requestor,
            "item justification: " + item.justification
            
            this.updateVariables.requestor,
            this.updateVariables.issue
          )

        },
        */
        /*
        openUpdate(item){
          //HAYST DI KO LAM PANO GAMITIN YUNG BUTTON
          this.updateTicket = true;
          //row.select(true);
          //this.selected = item.ticket
          //console.log(e);
          this.editedItem = item
          console.log(this.editedItem)

        },
        */
    },
    created: function(){
     this.getPosts()
     this.getIssue()
   },
}
</script>

<style scoped>
   
.update-font{
  font-size:125%
}
</style>