<template>

    <!-- Issue category component -->

    <!-- Where administrators can add issue categories that will be chosen by the users during ticket creation -->
    <div class="ticketapp">

        <v-subheader class="d-flex justify-space-between align-center">
            <v-row justify="end">
                <v-col cols="auto">
                    <!-- modal for new category -->
                    <v-dialog
                    transition="dialog-bottom-transition"
                    max-width="600"
                    >
                        <template v-slot:activator="{ on, attrs }">
                            <!-- create issue category button-->
                            <v-btn style="background-color: #1e6097; color: white;"
                                v-bind="attrs"
                                v-on="on"
                                class="d-flex justify-space-between align-center"
                            >Create Issue Category</v-btn>
                        </template>
            <template v-slot:default="dialog">
                        <v-card>
            <v-toolbar style="background-color: #1e6097; color: white;"
              dark
            >Create Issue Category</v-toolbar>
            <br>
            <v-card-text>
             <v-form>
                <v-container>
                    <v-row no-gutters>
                     <v-col                 
                     >
                     <v-text-field
                     v-model="categoryData.title"
                        label="Title"
                        outlined
                        clearable
                        ></v-text-field>
                    
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
            </template>
                    </v-dialog>
                </v-col>
            </v-row>
        </v-subheader>


        <!--search field-->
        <v-card-title>
            Issue Categories
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

                <!-- data table -->
                <v-data-table
                :headers="headers"
                :items="categories"
                :search="search"
                 class="elevation-1"
                >
                <!--for action button-->
                <template v-slot:[`item.actions`]="{item}">
                    <v-btn
                        color="#d23232"
                        fab
                        small
                        dark
                        @click="deleteCategory(item)"
                        >
                            <v-icon>mdi-delete</v-icon>
                          </v-btn>
                </template>
                </v-data-table>
        </v-col>
    </div>
</template>

<script>
import axios from 'axios'//axios - db interaction 

export default {
    name:'CategoryApp',

    //data declaration
    data(){
        return{
            search: '',
            headers: [
                { text: 'CATEGORY ID', value: 'id' },
                { text: 'TITLE', value: 'title' },
                { text: 'SUB-CATEGORY', value:'sub_category'},
                { text: 'ACTIONS', value: 'actions' }
            ],
            categories:[],
            categoryData:{
                title:'',
            },
            categoryToBeDeleted:{
                id:''
            },
        }
    },


    methods:{
        //get categories from database (axios http request)
        getCategories(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_categories.php')
            .then((response)=>{
                console.log(response.data)
                this.categories=response.data;
            })
            .catch((error)=> {
                console.log(error)
            })
        },
        //submit data (axios http request)
        submitData: function(){
            
            axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/add_issue-category.php',
                    {
                        title:this.categoryData.title,
                    })
                    
                    .then((response)=>{

                            
                            alert(response.data.message);
                            location.reload()
                            

                        })
                        
        },
        // delete category (axios http request)
        deleteCategory(item){
           this.categoryToBeDeleted = Object.assign({}, item)
           console.log ("categorychuchu: " + this.categoryToBeDeleted.id )

           if(confirm('Are you sure you want to delete category ' + ' "' +this.categoryToBeDeleted.title + '" ' + '?')){
               axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/delete_issue-category.php',
                    {
                        id: this.categoryToBeDeleted.id
                    })
                    .then((response)=>{
                        alert(response.data.message);
                        location.reload()
                    })
                    .catch((error)=> {
                        console.log(error)
                    });
           }
            
          }
    },

    created: function(){
        //upon creation, this function will execute
      this.getCategories()
      
    }
}
</script>

<style scoped>


</style>