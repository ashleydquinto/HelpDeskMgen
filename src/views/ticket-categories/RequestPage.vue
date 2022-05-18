<template>
    <!-- REQUEST PAGE FOR USERS -->

    <!-- same with request and incident, but fetches data from request_table -->

    <!-- FOR DETAILED COMMENTS, CHECK INCIDENT PAGE-->

    
    <div class="ticketapp">
        <v-subheader class="d-flex justify-space-between align-center">
              <v-col
          
            >
            <h1>Requests</h1>
            </v-col>
            <v-row justify="end">
      
      <!-- new ticket modal -->
      <v-dialog
        transition="dialog-bottom-transition"
        max-width="900"
      >
        <!-- new ticket button -->
        <template v-slot:activator="{ on, attrs }">
          <v-btn style="background-color: #1e6097; color: white;"
            v-bind="attrs"
            v-on="on"
          >New Request</v-btn>
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
                     cols="12"
                      sm="4"                     
                     >
                     <!--Department-->
                     <v-text-field
                    label="Department"
                    class="" 
                    outlined
                    clearable
                    v-model="addTicket.department"
                    ></v-text-field>
                    
                     </v-col>

                     <v-col     
                     cols="12"
                      sm="4"                     
                     >

                    <!--Priority-->
                    <v-select
                      :items="priority"
                      label="Priority"
                      outlined
                      class="pl-4" 
                      v-model="addTicket.priority" 
                    ></v-select>
                    
                     </v-col>

                     <v-col     
                     cols="12"
                      sm="4"                     
                     >
                     <!--Insert file
                     <v-text-field
                    label=""
                    outlined
                    clearable
                    v-model="addTicket.department"
                    ></v-text-field>
                    -->

                    
                    <label style="font-weight:600; font-size: 120%;" class="pl-5">Upload File: </label>
                    <input class="pl-5" type="file" id="file" ref="file" v-on:change="onChangeFileUpload()"/>

                     </v-col>

                     <v-col>

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

                    <!--to view comments-->
                    <template v-slot:[`item.action`]="{ item }">
                        <div class="my-2">
                          <v-btn
                            color="#1e6097"
                            fab
                            small
                            dark
                            @click="editItem(item)"
                          >
                            <v-icon>mdi-comment</v-icon>
                          </v-btn>
                        </div>
                    </template>
                    
                    
                    
                    
                </v-data-table>
            </v-col>
        </v-row>


        <!-- comment modal -->
        <!-- NOTE: comment function is still under development -->
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

                      <v-col col=12>
                        <h2 v-if="editedItem.status != 'Resolved'">Comments</h2>
                        <p v-if="editedItem.comments != '' && editedItem.status != 'Resolved'" class="comment-content">{{this.editedItem.comments}}</p> 
                        <p v-if="editedItem.comments == '' && editedItem.status != 'Resolved'" class="comment-content">No comments yet.</p> 

                        <v-textarea
                        label="Comments"
                        rows="4"
                        outlined
                        clearable
                        no-resize
                        v-if="editedItem.status != 'Resolved'"
                        ></v-textarea> <!-- no v-model yet -->
                        
                        <h2 v-if="editedItem.status == 'Resolved'">Ticket Resolved</h2>

                        <!--<p v-if="editedItem.status == 'Resolved'"> Your satisfaction rating would be highly appreciated. </p>-->

                        <br>


                        <h3 class="mb-2" v-if="editedItem.status == 'Resolved'">Employee Rating</h3>
                          <v-radio-group
                            v-model="selectedOptionId" mandatory
                            row
                            v-if="editedItem.status == 'Resolved'"
                            
                          >

                            <v-radio v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>


                          </v-radio-group>

                          
                        
                      </v-col>

                      

                      
                      </v-row>
                     
                      <!--buttons-->
                      <v-card-actions class="justify-center">
                        
                        

                        <!-- SUBMIT COMMENT NOT YET ADDED -->

                        <v-btn
                        style="background-color: #388E3C; color: white;"
                        text
                        v-if="editedItem.status != 'Resolved' || editedItem.status == 'Closed'"
                        >
                          Submit Comment
                        </v-btn>

                        <v-btn
                        style="background-color: #1e6097; color: white;"
                        text
                        v-if="editedItem.status == 'Resolved' || editedItem.status == 'Closed'"
                        @click="submitRating(selectedOptionId)"
                        >
                          Submit Rating
                        </v-btn>
                        
                        <!--
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
                        -->
                        
                        
                      </v-card-actions>

                  </v-container>
              </v-form>
              </v-card-text>
            </v-card>


        </v-dialog>


        
    </div>
</template>

<script>
import axios from 'axios' //axios - db interaction
export default {
    name:'RequestsPage',

    data(){
        return{
          issues:'',
          priority:[
            'Low',
            'Medium',
            'High',
            'Critical'
          ],
          updateModal:false,
          row:null,
          editedItem:{
          },
          headers: [
            { text: 'TICKET NO.', value: 'ticket' },
            { text: 'REQUESTOR', value: 'requestor' },
            { text: 'DEPARTMENT', value: 'department' },
            { text: 'CATEGORY', value: 'category' },
            { text: 'DESCRIPTION', value: 'description', align:' d-none' },
            { text: 'JUSTIFICATION', value: 'justification', align:' d-none'}, //' d-none' hides the column but keeps the search ability
            { text: 'STATE', value: 'state' },
            { text: 'CREATED', value: 'date_created' },
            { text: 'RESPONDED', value: 'date_responded' },
            { text: 'RESOLVED', value: 'date_resolved' },
            { text: 'ASSIGNED ENGR', value: 'assigned_engineer' },
            { text: 'SLA', value: 'sla', align:' d-none'},
            { text: 'DIAGNOSTIC', value: 'diagnostic', align:' d-none'},
            { text: 'RESOLUTION', value: 'resolution', align:' d-none'},
            { text: 'COMMENTS', value: 'comments', align:' d-none'},
            { text: 'ACTION', value: 'action', align: 'center'},
          ],
          rating_handler:{
            requestor:'',
            assigned_engineer:'',
            rating:''
          },
          options:[
            { id: 1, label: '5 (Outstanding)', value: 5 },
            { id: 2, label: '4 (Very Satisfactory)', value: 4 },
            { id: 3, label: '3 (Satisfactory)', value: 3 },
            { id: 4, label: '2 (Unsatisfactory)', value: 2 },
            { id: 5, label: '1 (Poor)', value: 1 },
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
            status:'New',
            file:'',
            priority:''
          },
          imgFetcher:''
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
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/ticket-categories_php/requests/get_requests.php')
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
            if(this.addTicket.requestor != '' && this.addTicket.department != '' && this.addTicket.contact_no != '' && this.addTicket.issue != '' ){

              let formData = new FormData();

              formData.append('file', this.addTicket.file);

              //IF FILE IS NOT EMPTY, THIS WILL EXECUTE (26-04-2022)
              if(this.addTicket.file != ''){
                
                axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/upload.php',
                  formData,
                  {
                    headers:{
                      'Content-Type': 'multipart/form-data'
                  }
                  }).then(function(response){
                      alert(response.data.message);
                  })
                    .catch((error) =>{
                      alert('FAILURE!!');
                      console.log(error)
                  });

                axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/ticket-categories_php/requests/addrequest_with-file.php',
                    {
                        requestor:this.addTicket.requestor,
                        department:this.addTicket.department,
                        contact_no:this.addTicket.contact_no,
                        issue:this.addTicket.issue,
                        description:this.addTicket.description,
                        justification:this.addTicket.justification,
                        status:this.addTicket.status,
                        priority:this.addTicket.priority,
                        attached_file:this.imgFetcher
                    })
                    .then((response)=>{
                      alert(response.data.message);
                      console.log('reponse message: ' + response.data.message);
                      this.addTicket.requestor=""
                      this.addTicket.department=""
                      this.addTicket.contact_no=""
                      this.addTicket.issue=""
                      this.addTicket.description=""
                      this.addTicket.priority=""
                      this.$refs.fileupload.value=null;
                    })
                    .catch((error)=> {
                        console.log(error)
                    });

                //RELOAD
                //location.reload()

                  
              }
              //ELSE IF FILE IS EMPTY/NULL/UNDEFINED, THIS WILL EXECUTE (26-04-2022)
              else if(this.addTicket.file == '' || this.addTicket.file == null || this.addTicket.file == undefined){

               axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/ticket-categories_php/requests/add_request.php',
                    {
                        requestor:this.addTicket.requestor,
                        department:this.addTicket.department,
                        contact_no:this.addTicket.contact_no,
                        issue:this.addTicket.issue,
                        description:this.addTicket.description,
                        justification:this.addTicket.justification,
                        status:this.addTicket.status,
                        priority:this.addTicket.priority
                        
                    })
                    .then((response)=>{
                        alert(response.data.message);

                        this.addTicket.requestor=""
                        this.addTicket.department=""
                        this.addTicket.contact_no=""
                        this.addTicket.issue=""
                        this.addTicket.description=""
                        this.addTicket.priority=""
                        
                        
                        location.reload()
                    })
                    .catch((error)=> {
                        console.log(error)
                    });
              }
            }
            //ELSE (FIELDS ARE INCOMPLETE)
            else{
               alert("Fill all the fields");
           }

          
        },
        //method for assigning the uploaded file
        onChangeFileUpload(){
          this.addTicket.file = this.$refs.file.files[0];
          this.imgFetcher = event.target.files[0].name;

        },
        editItem (item) {

          //assign values to editedItem
          this.editedItem = Object.assign({}, item)
          //open update ticket modal
          this.updateModal = true;
        },
        submitRating(rating){
          alert(
            "Your rating is: "+ rating 
          );
        }
    },
    created: function(){
     this.getPosts()
     this.getIssue()
   },
   computed: {
     //this is for the satisfaction rating, STILL UNDER DEVELOPMENT (request page pa lang ang meron ng code na ito)
    selectedOptionType() {
      if (!this.selectedOptionId) {
        return "";
      }
      return this.options.find(o => o.value === this.selectedOptionId).type;
    }
  }
}
</script>

<style>
  /* css */
  .comment-content{
    font-size:130%;
    margin-top: 2vh;
  }
  .radio{
    font-size:110%;
    margin-right: 20px;
  }
</style>