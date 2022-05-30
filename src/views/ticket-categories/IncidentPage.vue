<template>

    <!-- THIS IS THE INCIDENT PAGE OF THE USER -->

    <div class="ticketapp">
        <v-subheader class="d-flex justify-space-between align-center">
              <v-col
          
            >
            <h1>Incidents</h1>
            </v-col>
            <v-row justify="end">
    
      <!-- v-dialog is the modal <this modal is for creating new tickets> -->
      <v-dialog
        transition="dialog-bottom-transition"
        max-width="900"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn style="background-color: #1e6097; color: white;"
            v-bind="attrs"
            v-on="on"
          >New Incident</v-btn>
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

                    
                    <label style="font-weight:600; font-size: 120%;" class="pl-5">Upload File: </label>
                    <input class="pl-5" type="file" id="file" ref="file" v-on:change="onChangeFileUpload()"/>

                     </v-col>

                     <v-col>

                    <!--Issue-->
                    <v-select
                      :items="issues"
                      item-text="title"
                      item-value="id"
                      label="Issue"
                      outlined
                      v-model="addTicket.issue" 
                      @input="selectCategory()"
                    ></v-select>
                     

                    <!--Issue-->
                    <v-select
                      :items="sub"
                      label="Sub-category"
                      outlined
                      v-model="addTicket.sub" 
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
                            @click="editItem(item, item.id)"
                          >
                            <v-icon>mdi-comment</v-icon>
                          </v-btn>
                        </div>
                    </template>
                    
                    
                </v-data-table>
            </v-col>
        </v-row>

        <!-- v-dialog is the modal <if the action button is clicked, it shows the comment modal> -->
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
                        @click="updateModal = false;responseNotNaN = false; deletep()">
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
                        <div id="comm">
                          
                        
                        </div>
                        <p v-if="this.convo == '' && editedItem.status != 'Resolved'" class="comment-content">No comments yet.</p>

                        <v-textarea
                        label="Comments"
                        rows="4"
                        outlined
                        clearable
                        no-resize
                        v-model="editedItem.comments"
                        v-if="editedItem.status != 'Resolved'"
                        ></v-textarea> <!-- no v-model yet -->
                        
                        

                        <!--<p v-if="editedItem.status == 'Resolved'"> Your satisfaction rating would be highly appreciated. </p>-->

                        <v-row>
                          <v-col cols="6">
                            <h3 class="mb-2" v-if="editedItem.status == 'Resolved'">Employee Rating for <i> {{editedItem.assigned_engineer}} </i></h3>
                          </v-col>
                          
                          <v-col cols="6">
                            <p class ='ticket-resolved' v-if="editedItem.status == 'Resolved'">Ticket {{editedItem.status}}</p>
                          </v-col>
                        </v-row>

                        

                        <v-tabs 
                        fixed-tabs
                        background-color="#565656"
                        slider-color="white"
                        v-if="editedItem.status == 'Resolved'"
                        >

                          <!--Responsiveness-->
                          <v-tab href="#Responsiveness" style=" color: white;" @click="show_submit = false">
                            Responsiveness
                          </v-tab>

                          <v-tab-item id="Responsiveness" key="Responsiveness" class="custom-tab-items">

                              <br>

                              <!--Review form starts here - Responsiveness -->
                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">Timely Coordination with the User</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>

                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">SLA Awareness</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>
                            

                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">Resiliency Plan</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>

                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">Proper use of Channel of Communications</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>
                          </v-tab-item>

                          <!--Quality of Work-->
                          <v-tab href="#Quality_of_Work" style="color: white;" @click="show_submit = false"> 
                            Quality of Work
                          </v-tab>

                          <v-tab-item id="Quality_of_Work" key="Quality_of_Work" class="custom-tab-items">
                            
                            <br>

                              <!--Review form starts here - Quality of Work -->
                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">Overall Comprehension of the Problem</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>

                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">1st Call Resolution</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>
                            

                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">Root Cause Analysis and Quality Assurance</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>


                          </v-tab-item>

                          <!--Delivery-->
                          <v-tab href="#Delivery" style="color: white;" @click="show_submit = false"> 
                            Delivery
                          </v-tab>

                          <v-tab-item id="Delivery" key="Delivery" class="custom-tab-items" > 
                            
                            <br>

                              <!--Review form starts here - Delivery -->
                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">No Task Overdue</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>

                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">Proper utilization of Tools</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>
                            
                              

                          </v-tab-item>


                          <!--Soft Skills-->
                          <v-tab href="#Soft_skills" style="color: white;" @click="show_submit = true"> 
                            Soft Skills
                          </v-tab>

                          <v-tab-item id="Soft_skills" key="Soft_skills" class="custom-tab-items" > 
                            
                            <br>

                              <!--Review form starts here - Soft Skills -->
                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">Customer Management</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>

                              <v-row>
                                <v-col cols="2">

                                  <p class="review-text labels">Relationship and Conflict Management</p>

                                </v-col>

                                <v-col cols="10">

                                  <v-radio-group
                                  v-model="selectedOptionId" mandatory
                                  row
                                  v-if="editedItem.status == 'Resolved'"
                                  >
                                    <v-radio class="review-text" v-for="option in options" :key="option.id" :label="option.label" :value="option.id"></v-radio>
                                  </v-radio-group>

                                </v-col>

                              </v-row>
                            
                              

                          </v-tab-item>

                        </v-tabs>

                        <br>

                      </v-col>

                      
                      </v-row>
                     
                      <!--buttons-->
                      <v-card-actions class="justify-center">
                        

                        <!-- SUBMIT COMMENT NOT YET ADDED -->


                        <!--if ticket is closed or not resolved, this will show-->
                        <v-btn
                        style="background-color: #388E3C; color: white;"
                        text
                        v-if="editedItem.status != 'Resolved' || editedItem.status == 'Closed'"
                        @click="submitComment()"
                        >
                          Submit Comment
                        </v-btn>

                        <!--if ticket is closed or resolved, this will show (note: NEEDS FURTHER DEVELOPMENT, this must not show if rating is already submitted)-->
                        <v-btn
                        style="background-color: #1e6097; color: white;"
                        text
                        v-if="(editedItem.status == 'Resolved' || editedItem.status == 'Closed') && show_submit == true"
                        @click="submitRating(selectedOptionId)"
                        >
                          Submit Rating
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
//Javascript

import axios from 'axios' //axios - tool being used for DB interaction
export default {
    name:'IncidentPage',

    //Data declaration
    data(){
        return{
          convo: [],
          issues:'',
          sub: [],
          priority:[
            'Low',
            'Medium',
            'High',
            'Critical'
          ],
          updateModal:false,
          editedItem:{
          },
          headers: [
            { text: 'TICKET NO.', value: 'ticket' },
            { text: 'REQUESTOR', value: 'requestor' },
            { text: 'DEPARTMENT', value: 'department' },
            { text: 'CATEGORY', value: 'category' },
            { text: 'SUB-CATEGORY', value: 'sub' },
            { text: 'DESCRIPTION', value: 'description', align:' d-none' },
            { text: 'JUSTIFICATION', value: 'justification', align:' d-none'}, //' d-none' hides the column but is still part of the array
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
            { id: 1, label: '4 (Very Satisfactory)', value: 4 },
            { id: 2, label: '3 (Satisfactory)', value: 3 },
            { id: 3, label: '2 (Unsatisfactory)', value: 2 },
            { id: 4, label: '1 (Poor)', value: 1 },
          ],
          show_submit:false,
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
      selectCategory() {

        
        axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_sub.php',
                    {
                        
                        id:this.addTicket.issue
                        
                    })
                    .then((response)=>{
                        this.sub = response.data;
                        
                    })
      }
      
      ,
      submitComment(){
          const myNode = document.getElementById("comm");
        myNode.textContent = '';
          axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/submit_comment.php',
                    {
                        commentname: localStorage.getItem('name'),
                        id: this.editedItem.id,
                        comments: this.editedItem.comments,
                        action: 'incident'
                    })
                    .then((response)=>{
                        alert(response.data.message);
                        location.reload()
                    })
                    .catch((error)=> {
                        console.log(error)
                    });
            
            
        },
      deletep() {
        const myNode = document.getElementById("comm");
        myNode.textContent = '';
      },
      //opens new ticket modal
      openAddTicket(){
           this.ticketOpen =true; 
           console.log('openticket')
        },
      //closes new ticket modal
      closeAddTicket(){
        this.ticketOpen =false;
        }, 
      //gets all the incident tickets
      getPosts(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/incidents/get_incidents.php')
            .then((response)=>{
                console.log(response.data)
                this.tickets=response.data;
            })
            .catch((error)=> {
                console.log(error)
            })
       },
       //gets all the issue categories that the user will choose in the new ticket modal
       getIssue(){
            axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_issue.php')
                .then((response)=>{
                    console.log(response.data)
                    this.issues=response.data
                })
                .catch((error)=> {
                console.log(error)
                })
        },
        //submit ticket function
        submitTicket(){
            if(this.addTicket.requestor != '' && this.addTicket.department != '' && this.addTicket.contact_no != '' && this.addTicket.issue != '' ){

              let formData = new FormData();

              formData.append('file', this.addTicket.file);

              //IF FILE IS NOT EMPTY, THIS WILL EXECUTE (26-04-2022)
              if(this.addTicket.file != ''){
                
                axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/upload.php',
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

                axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/incidents/addincident_with-file.php',
                    {
                        requestor:this.addTicket.requestor,
                        department:this.addTicket.department,
                        contact_no:this.addTicket.contact_no,
                        issue:this.addTicket.issue,
                        description:this.addTicket.description,
                        justification:this.addTicket.justification,
                        status:this.addTicket.status,
                        priority:this.addTicket.priority,
                        attached_file:this.imgFetcher,
                        sub:this.addTicket.sub
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
                        this.addTicket.sub=""
                      location.reload()
                    })
                    .catch((error)=> {
                        console.log(error)
                    });


                  
              }
              //ELSE IF FILE IS EMPTY/NULL/UNDEFINED, THIS WILL EXECUTE (26-04-2022)
              else if(this.addTicket.file == '' || this.addTicket.file == null || this.addTicket.file == undefined){

               axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/incidents/add_incident.php',
                    {
                        requestor:this.addTicket.requestor,
                        department:this.addTicket.department,
                        contact_no:this.addTicket.contact_no,
                        issue:this.addTicket.issue,
                        description:this.addTicket.description,
                        justification:this.addTicket.justification,
                        status:this.addTicket.status,
                        priority:this.addTicket.priority,
                        sub:this.addTicket.sub
                        
                    })
                    .then((response)=>{
                        alert(response.data.message);

                        this.addTicket.requestor=""
                        this.addTicket.department=""
                        this.addTicket.contact_no=""
                        this.addTicket.issue=""
                        this.addTicket.description=""
                        this.addTicket.priority=""
                        this.addTicket.sub=""                        
                        
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
        //to assign the values when you want to update a ticket
        editItem (item, comid) {
          axios.post(
            'http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/ticket-categories_php/incidents/incident_comment.php',
            {
              id2:comid
            })
            .then((response2)=>{ 
              if(this.editedItem.status != 'Resolved') {
              this.convo = response2.data; 
            var length = this.convo.length;
            if (length != 0) {
            var i = 1;
            
            while(length >= i) {
              
            var k = i-1;
            const para = document.createElement("p");
            const node = document.createTextNode(this.convo[k]);
            para.appendChild(node);
            const element = document.getElementById("comm");
            element.appendChild(para);
            i++;
            }
            }
            }
            })
          //assign values to editedItem
          this.editedItem = Object.assign({}, item)
          this.editedItem.comments = '';
          //open update ticket modal
          this.updateModal = true;
        }
    },
    created: function(){
      //when the page is created, these functions execute
     this.getPosts()
     this.getIssue()
   },
}
</script>

<style>

/*css*/
#comm {
    font-family: 'Roboto', sans-serif;
    color: black;
    font-size: 16px;
  }

</style>