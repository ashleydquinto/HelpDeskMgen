<template>
    <div class="ticketapp">
        <v-subheader class="d-flex justify-space-between align-center">
              <v-col
            cols="12"
            sm="6"
            md="9"
            >
            <h1>Ticket</h1>
            </v-col>
            <v-row justify="space-around">
    <v-col cols="auto">
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
        <template v-slot:default="dialog">
          <v-card>
            <v-toolbar style="background-color: #1e6097; color: white;"
              dark
            >New Ticket Form</v-toolbar>
            <br>
            <v-card-text>
             <v-form>
                <v-container>
                    <v-row>
                     <v-col
                    cols="12"
                    sm="6"                    
                     >
                     <v-text-field
                    label="Requestor"
                    outlined
                    clearable
                    ></v-text-field>
                    </v-col>
                     <v-col
                    cols="12"
                    sm="6"                    
                     >
                     <v-text-field
                    label="Contact Number"
                    outlined
                    clearable
                    ></v-text-field>
                    </v-col>
                     <v-col                 
                     >
                     <v-text-field
                    label="Department"
                    outlined
                    clearable
                    ></v-text-field>
                    <v-text-field
                    label="Issue"
                    outlined
                    clearable
                    ></v-text-field>
                     <v-text-field
                    label="Description"
                    outlined
                    clearable
                    ></v-text-field>
                     <v-text-field
                    label="Justification"
                    outlined
                    clearable
                    ></v-text-field>
                    </v-col>
                    </v-row>
            <v-card-actions class="justify-center">
              <v-btn
                style="background-color: #388E3C; color: white;"
                text
              >Submit</v-btn>
              <v-btn
                style="background-color: #D32F2F; color: white;"
                text
                @click="dialog.value = false"
              >Close</v-btn>
            </v-card-actions>
                 </v-container>
             </v-form>
            </v-card-text>
          </v-card>
        </template>
      </v-dialog>
    </v-col>
    </v-row>
            <v-col
            md="2"
            >
            <v-combobox
             v-model="select"
             class="pt-7 pr-2"
            :items="items"
             label="Filter"
            multiple
            outlined
            dense
            ></v-combobox>
            </v-col>
            </v-subheader><br>
            <v-row>
            <v-col lg="12">
                <v-data-table
                caption="TICKETS"
                :headers="headers"
                :items="tickets"
                 class="pt-4 elevation-1"
                >
                <template v-slot:[`item.actions`]="{ }">
                    <v-btn color="success">View</v-btn>
                </template>
                </v-data-table>
            </v-col>
        </v-row>
        <div v-if="ticketOpen == true">
            <transition name="modal">
                <div class="modal-mask">
                    <div class="modal-wrapper">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-lg-6">
                                        <h3 class="modal-title">
                                            {{dynamicTitle}}
                                        </h3>
                                    </div>
                                    <div class="col-lg-6">
                                        
                                        <button class="float-right btn btn-danger" @click="closeAddTicket">
                                            Close
                                        </button>
                                    </div>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="">Requestor</label>
                                        <input placeholder="Enter requestor" type="text" class="form-control" v-model="addTicket.requestor"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="">Department</label>
                                        <input placeholder="Enter department" type="text" class="form-control" v-model="addTicket.department"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Contact Number</label>
                                        <input placeholder="Enter contact number" type="text" class="form-control" v-model="addTicket.contact_no"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Issue</label>
                                        <!--<input placeholder="Enter issue" type="text" class="form-control" v-model="addTicket.issue"/>-->
                                        <br>
                                        <select class="form-control" v-model="addTicket.issue" required>
                                            <option></option>
                                            <option v-for="issue in issues" :key='issue.id'>{{issue.title}}</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Description</label>
                                        <!--<input type="text" class="form-control" v-model="addTicket.description"/>-->
                                        <textarea rows="5" cols="20" class="form-control issue" placeholder="Enter description" v-model="addTicket.description" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Justification</label>
                                        <!--<input type="text" class="form-control" v-model="addTicket.justification"/>-->
                                        <textarea rows="5" cols="20" class="form-control issue" placeholder="Enter justification" v-model="addTicket.justification" required></textarea>
                                    </div>
                                    <br>
                                    <div align="center">
                                        <input type="hidden" v-model="addTicket.hiddenId"/>
                                        <button class="btn btn-success" @click="submitTicket">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </transition>
        </div>
    </div>   
</template>

<script>
export default {
    name: "TicketApp",
    data(){
        return{
            ticketOpen: false,
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
          {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5359',
            requestor: 'John Eric Diwa',
            deparment: 'Sales and Marketing',
            category: 'Others',
            description: 'For Client - helpdesk support -VPN configuration on PA',
            state: 'Resolved',
            created: '3/22/2022 4:12 pm',
            resolved: '3/23/2022 6:32 pm',
            assignedengr: 'Jules Stephen Mayo',
          },
           {
            ticket: '5387',
            requestor: 'Louise Sarmiento',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop Lenovo E480 ',
            state: 'Resolved',
            created: '3/21/2022 2:45 pm',
            resolved: '3/22/2022 1:31 pm',
            assignedengr: 'John Eric Diwa',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
           {
            ticket: '5360',
            requestor: 'Jules Stephen Mayo',
            deparment: 'Technical Services Department',
            category: 'Laptop',
            description: 'Checking of Laptop (Left and Right Button on touch pad is not working) Lenovo E480 ',
            state: 'Resolved',
            created: '3/22/2022 2:45 pm',
            resolved: '3/22/2022 2:45 pm',
            assignedengr: 'Ashley Dominique Quinto',
          },
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
        ],
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
    }
}
</script>

<style scoped>
   

</style>