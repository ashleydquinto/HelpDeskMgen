<template>

    <!-- USERS APP COMPONENT -->

    <!-- THIS COMPONENT IS USED TO CREATE NEW USERS AND/OR UPDATE THEIR STATUS OR NAME -->
    <div class="ticketapp">
        <v-subheader class="d-flex justify-space-between align-center">
              <v-col
            cols="12"
            sm="6"
            md="9"
            >
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
          >Create Users</v-btn>
        </template>
        <template v-slot:default="dialog">

          <!--start of modal-->
  
          <v-card>
            <v-toolbar style="background-color: #1e6097; color: white;"
              dark
            >Create User Form</v-toolbar>
            <br>
            <v-card-text>
             <v-form>
                <v-container>
                    <v-row no-gutters>
                     <v-col                 
                     >
                     <!--Full Name-->
                     <v-text-field
                     v-model="FormData.name"
                    label="Full Name"
                    outlined
                    clearable
                    ></v-text-field>
                    <!--Username-->
                    <v-text-field
                    label="Username"
                    v-model="FormData.username"
                    outlined
                    clearable
                    ></v-text-field>
                    <!--Password-->
                     <v-text-field
                     v-model="FormData.password"
                     :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                     :rules="[rules.required, rules.min]"
                     :type="show1 ? 'text' : 'password'"
                     name="input-10-1"
                     label="Password"
                     hint="At least 8 characters"
                     counter
                     @click:append="show1 = !show1"
                    outlined
                    ></v-text-field>
                    <!--Email Address-->
                    <v-text-field
                    v-model="FormData.email"
                    label="Email Address"
                    outlined
                    clearable
                    ></v-text-field>

                    

                    <!--Justification-->
                     <v-select
                     v-model="FormData.role"
                    label="Select User Role"
                    :items="items"
                    outlined
                    clearable
                    ></v-select>
                    </v-col>
                    </v-row>

                    <!--buttons-->
                    <v-card-actions class="justify-center">

                      <v-btn
                      type="submit"
                      style="background-color: #388E3C; color: white;"
                      text
                      @click="submitData">
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

          <!--end of modal-->

        </template>
      </v-dialog>
    </v-col>
    </v-row>
            <v-col
            md="2"
            >
            <v-combobox
             v-model="select"
             class="pt-7 pr-8"
            :items="items"
             label="Filter"
            multiple
            outlined
            dense
            ></v-combobox>
            </v-col>
            </v-subheader>
            <br>

            <v-card-title>
            Users
            <v-spacer></v-spacer>
            <v-text-field
            v-model="search"
            append-icon="mdi-magnify"
            label="Search"
            single-line
            hide-details
            ></v-text-field>
    </v-card-title>
            
            <v-col lg="14">
                <v-data-table
                :headers="headers"
                :items="users"
                :search="search"
                 class="elevation-1"
                >
                <template v-slot:[`item.actions`]="{item}">
                    <v-btn
                            color="#1e6097"
                            fab
                            small
                            dark
                            @click="editUser(item)"
                          >
                            <v-icon>mdi-pencil</v-icon>
                          </v-btn>
                </template>
                </v-data-table>
            </v-col>
            <v-dialog
        transition="dialog-bottom-transition"
        max-width="500"
        v-model="updateModal" 
        >


            <v-card>
              <v-toolbar style="background-color: #1e6097; color: white;"
                dark
              >
              <v-col>
              Update User
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
                      >
                      <!--Name-->
                      <v-text-field
                      label="Name"
                      outlined
                      v-model="editedUser.name"
                      >
                      </v-text-field>

                      <!--Status-->
                        <v-select
                        :items="user_status"
                        label="Status"
                        outlined
                        v-model="editedUser.status" 
                        ></v-select>
                      </v-col>

                      <!--column 2 STARTS HERE
                      <v-col
                      cols="12"
                      sm="6"                    
                      >
                        
                      
                      </v-col>
                      -->
                      
                      </v-row>
                      <!--buttons-->
                      <v-card-actions class="justify-center">
                        <v-btn
                        style="background-color: #388E3C; color: white;"
                        text
                        @click="updateUser()">
                        Update
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
import axios from 'axios' // AXIOS DB INTERACTION
export default {
    name: "UsersApp",
    data(){
        return{
            search: '',
            headers: [
          { text: 'USERS', value: 'name' },
          { text: 'ROLE', value: 'role' },
          { text: 'CREATED AT', value: 'datecreated' },
          { text: 'STATUS' , value:'status'},
          { text: 'ACTION', value: 'actions' }
          
        ],
        users: [],
        items: [
          'Users',
          'Manager',
          'Engineer',
          'Administrator',
        ],
        show1: false,
        show2: true,
        show3: false,
        show4: false,
        rules: {
          required: value => !!value || 'Required.',
          min: v => v.length >= 8 || 'Min 8 characters',
          emailMatch: () => (`The email and password you entered don't match`),
        },
        FormData:{
                    username:"",
                    password:"",
                    email:"",
                    name:"",
                    role:""
                    
                },
                updateModal:false,
          editedUser:{
          },
        //user status, data that is used for select tags in update user (added 4-20)
          user_status:[
            'Active',
            'Disabled'
          ],
        }
    },
    
        methods: {
          editUser (item) {

          //assign values to editedItem
          //this.editedItem = Object.assign({}, item)
          this.editedUser = Object.assign({}, item)
          console.log(item)
          //console.log(this.editedItem)
          //console.log(this.editedItem.id)
          
          //open update ticket modal
          this.updateModal = true;

      },
      getUsers(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/get_user.php')
            .then((response)=>{
                console.log(response.data)
                console.log(response.data.status)
                this.users=response.data;
            })
            .catch((error)=> {
                console.log(error)
            })
      },
          submitData: function(){
            
            axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/register.php',
                    {
                        username:this.FormData.username,
                        password:this.FormData.password,
                        email:this.FormData.email,
                        name:this.FormData.name,
                        role:this.FormData.role,
                        
                    })
                    
                    .then((response)=>{
                      
                            
                            
                            

                            this.FormData.username ='';
                            this.FormData.password ='';
                            this.FormData.email ='';
                            this.FormData.name ='';
                            this.FormData.role ='';
                            
                            
                            /*
                            console.log(
                                
                                this.formData.password,
                                this.FormData.email,
                                this.FormData.name,
                                this.FormData.role
                              
                            )
                            */

                            
                            alert(response.data.message);
                            location.reload()
                            

                        })
          },
          updateUser(){
          
          axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen-main/php-files/update_user.php',
                    {
                        id: this.editedUser.id,
                        name: this.editedUser.name,
                        status: this.editedUser.status
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
      this.getUsers();
      
    }
}
</script>

<style scoped>
    .v-btn {
       background-color: #1e6097;
    }

</style>