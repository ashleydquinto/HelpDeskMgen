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
        max-width="600"
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
                    <template v-slot:[`item.action`]>
                        <v-btn @click="insertFuncHere">
                            <v-icon>mdi-clipboard-edit-outline</v-icon>
                        </v-btn>
                    </template>
                </v-data-table>
            </v-col>
        </v-row>

    </div>   
</template>

<script>
import axios from 'axios'

export default {
    name: "TicketApp",
    data(){
        return{
          issues:'',
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
                        status:this.addTicket.status
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
    },
    created: function(){
     this.getPosts()
     this.getIssue()
   },
}
</script>

<style scoped>
   

</style>