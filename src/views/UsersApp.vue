<template>
    <div class="ticketapp">
        <v-subheader class="d-flex justify-space-between align-center">
              <v-col
            cols="12"
            sm="6"
            md="9"
            >
            </v-col>
            <v-btn class="pa-5" style="background-color: #1e6097; color: white">Create User</v-btn>
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
        }
    }
}
</script>

<style scoped>
    .v-btn {
       background-color: #1e6097;
    }

</style>