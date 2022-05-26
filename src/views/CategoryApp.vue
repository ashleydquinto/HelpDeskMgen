<template>

    <!-- Issue category component -->

    <!-- Where administrators can add issue categories that will be chosen by the users during ticket creation -->
    <div class="ticketapp">

        <v-subheader class="d-flex justify-space-between align-center">
            <v-row justify="end">
                <v-col cols="auto">
                    <v-btn style="background-color: #1e6097; color: white;"
                                
                                class="d-flex justify-space-between align-center"
                                @click="addModal = true"
                            >Add Sub-category</v-btn>
                </v-col>
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
                        label="Category"
                        outlined
                        clearable
                        ></v-text-field>
                    <v-text-field
                     v-model="categoryData.sub"
                        label="Sub-category"
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
                        color="#1e6097"
                        fab
                        small
                        dark
                        @click="updateCategory(item)"
                        >
                            <v-icon>mdi-pencil</v-icon>
                          </v-btn>&nbsp;&nbsp;&nbsp;
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


        <v-dialog
        transition="dialog-bottom-transition"
        max-width="600"
        v-model="addModal" 
        persistent
        >
        <v-card>
              <v-toolbar style="background-color: #1e6097; color: white;"
                dark
              >
              <v-col>
              Add Sub-category
              </v-col>
              <v-col align="right">
                <v-btn
                        style="background-color: #D32F2F; color: white;"
                        text
                        @click="addModal = false">
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
                     <v-col                 
                     >
                     <v-select
                        :items="categories"
                        item-value="id"
                        item-text="title"
                        class="ml-1"
                        label="Title"
                        outlined
                        v-model="addSC.title" 
                        
                        ></v-select>
                   
                    <v-text-field
                     v-model="addSC.sub"
                        label="Sub-category"
                        outlined
                        clearable
                        ></v-text-field>
                    </v-col>
                    </v-row>

                    <!--buttons-->
                    <v-card-actions class="justify-center">

                      <v-btn
                  
                      style="background-color: #388E3C; color: white;"
                      text
                      @click="addSub()">
                      Submit
                      </v-btn>

                      <v-btn
                      style="background-color: #D32F2F; color: white;"
                      text
                      @click="addModal = false">
                      Close
                      </v-btn>
                      
                    </v-card-actions>

                 </v-container>

                 
             </v-form>
            </v-card-text>
        </v-card>
        </v-dialog>

        <v-dialog
        transition="dialog-bottom-transition"
        max-width="900"
        v-model="deleteModal" 
        persistent
        >
        <v-card>
              <v-toolbar style="background-color: #1e6097; color: white;"
                dark
              >
              <v-col>
              Delete Category or Sub-category?
              </v-col>
              <v-col align="right">
                <v-btn
                        style="background-color: #D32F2F; color: white;"
                        text
                        @click="deleteModal = false">
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
                    

                    <!--buttons-->
                    <v-card-actions class="justify-center">

                      <v-btn
                      
                      style="background-color: #D32F2F; color: white;"
                      text
                      @click="deleteTitle()"
                      >
                      Delete Category
                      </v-btn>

                      <v-btn
                      style="background-color: #ff6600; color: white;"
                      text
                      @click="deleteSub()"
                      >
                      Delete Sub-category
                      </v-btn>
                      
                    </v-card-actions>

                 </v-container>

                 
             </v-form>
            </v-card-text>
        </v-card>
        </v-dialog>
        

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
              Update Category
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
                        <v-col>
                        <v-text-field
                     v-model="categoryToBeUpdated.title"
                        label="Category"
                        outlined
                        clearable
                        ></v-text-field>
                    <v-text-field
                    v-if="categoryToBeUpdated.sub_category != undefined"
                     v-model="categoryToBeUpdated.sub_category"
                        label="Sub-category"
                        outlined
                        clearable
                        ></v-text-field>

                        

                        


                        </v-col>
                        </v-row>
                    

                    <!--buttons-->
                    <v-card-actions class="justify-center">

                      <v-btn
                     
                      style="background-color: #388E3C; color: white;"
                      text
                      @click="submitUpdate()">
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
import axios from 'axios'//axios - db interaction 

export default {
    name:'CategoryApp',

    //data declaration
    data(){
        return{
            title: [],
            addSC: {},
            addModal: false,
            updateModal: false,
            search: '',
            deleteModal: false,
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
            categoryToBeUpdated: {}
        }
    },


    methods:{
        getTitle() {
            axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_title.php')
            .then((response)=>{
                
                console.log(response.data)
                
                this.title = response.data;
                
            })
        },
        addSub() {
            
             axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/add_subcateg.php',
                    {
                        id:this.addSC.title,
                        sub:this.addSC.sub
                    })
                    
                    .then((response)=>{

                            
                            alert(response.data.message);
                            location.reload()
                            

                        })
        },
        //get categories from database (axios http request)
        getCategories(){
        axios.get('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/get_categories.php')
            .then((response)=>{
                
                console.log(response.data)
                
                this.categories = response.data;
                
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
                        sub:this.categoryData.sub
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

           this.deleteModal = true;
            
          },
          updateCategory(item1){
           this.categoryToBeUpdated = Object.assign({}, item1)
           this.tempoUpdate = Object.assign({}, item1)

           this.updateModal = true;
            
          },
        deleteTitle(){
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
        },
        deleteSub(){
            
            axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/delete_subcategory.php',
                    {
                        id: this.categoryToBeDeleted.id,
                        sub:this.categoryToBeDeleted.sub_category
                    })
                    .then((response)=>{
                        alert(response.data.message);
                        location.reload()
                    })
                    .catch((error)=> {
                        console.log(error)
                    });
        },
        submitUpdate(){
            
            axios.post('http://localhost/HelpDeskMgen-main2/HelpDeskMgen/php-files/update_category.php',
                    {
                        id: this.categoryToBeUpdated.id,
                        sub:this.categoryToBeUpdated.sub_category,
                        categ:this.categoryToBeUpdated.title,
                        tempo:this.tempoUpdate.sub_category,
                    })
                    .then((response)=>{
                        
                        alert(response.data.message);
                        location.reload()
                    })
                    .catch((error)=> {
                        console.log(error)
                    });
        },
    },

    created: function(){
        
        //upon creation, this function will execute
      this.getCategories();
      this.getTitle();
      
    }
}
</script>

<style scoped>


</style>