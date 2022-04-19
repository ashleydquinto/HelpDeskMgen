<template>
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
                    label="Full Name"
                    outlined
                    clearable
                    ></v-text-field>

                    <!--Email Address-->
                    <v-text-field
                    label="Email Address"
                    outlined
                    clearable
                    ></v-text-field>

                    <!--Password-->
                     <v-text-field
                     v-model="password"
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

                    <!--Justification-->
                     <v-select
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
            </v-subheader><br>
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
                <template v-slot:[`item.actions`]="{ }">
                    <v-btn color="success">View</v-btn>
                </template>
                </v-data-table>
            </v-col>
    
    </div>   
</template>

<script>
export default {
    name: "UsersApp",
    data(){
        return{
            search: '',
            headers: [
          { text: 'USERS', value: 'users' },
          { text: 'ROLE', value: 'role' },
          { text: 'CREATED AT', value: 'createdat' },
        ],
        users: [
          {
            users: 'Ashley Dominique Quinto',
            role: 'User',
            createdat: '3/22/2022 1:44pm',
          },
          {
            users: 'Jules Stephen Mayo',
            role: 'Manager',
            createdat: '3/22/2022 1:44pm',
          },
          {
            users: 'John Eric Diwa',
            role: 'User',
            createdat: '3/22/2022 1:44pm',
          },
          {
            users: 'Louise Sarmiento',
            role: 'User',
            createdat: '3/22/2022 1:44pm',
          },
          {
            users: 'Ashley Quinto',
            role: 'User',
            createdat: '3/22/2022 1:44pm',
          },
        ],
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
        }
    }
}
</script>

<style scoped>
    .v-btn {
       background-color: #1e6097;
    }

</style>