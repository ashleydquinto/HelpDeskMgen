<template>
      
            <v-col lg="12">
                <v-data-table
                caption="INCIDENTS"
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
                </v-data-table>
            </v-col>
    
</template>

<script>
import axios from 'axios'
export default {
    name: "IncidentsTab",
    data(){
        return{
             headers: [
                { text: 'TICKET NO.', value: 'ticket' },
                { text: 'REQUEST CATEGORY', value: 'request_category' },
                { text: 'REQUESTOR', value: 'requestor' },
                { text: 'DEPARTMENT', value: 'department' },
                { text: 'CATEGORY', value: 'category' },
                { text: 'DESCRIPTION', value: 'description' },
                { text: 'STATE', value: 'state' },
                { text: 'CREATED', value: 'created' },
                { text: 'RESOLVED', value: 'resolved' },
                { text: 'ASSIGNED ENGR', value: 'assignedengr' },
                //{ text: 'ACTION', value: 'action' },

            ],
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
      getPosts(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/tabs.php?action=category2')
            .then((response)=>{
                console.log(response.data)
                this.tickets=response.data;
            })
            .catch((error)=> {
                console.log(error)
            })
       },
    },
    created: function(){
      this.getPosts();
    }
};

</script>