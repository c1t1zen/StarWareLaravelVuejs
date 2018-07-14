<template>
    <div>
        <div class="btn-wrapper">
            <router-link to="/notes/new" class="btn btn-primary btn-sm">New</router-link>
        </div>
        <table class="table">
            <thead>
                <th>ID</th>
                <th>Title</th>
                 <th>Tags</th>
            </thead>
            <tbody>
          <template v-if="!laravelCheck.length">
                    <tr>
                        <td colspan="4" class="text-center ">No Customers Available</td>
                    </tr> 
                </template>
                <template v-else>
                    <tr v-for="note in laravelData.data" :key="note.id">
                        <td>{{ note.id }}</td>                        
                        <td>{{ note.title  }} </td>
                         <td> 
                    
                        <input-tag   :tags.sync="note.tags" :read-only="true" :limit="limit" :addTagOnBlur="false"></input-tag></td>
                
                        
                        <td>
                            <div class='row'>
                               
                                <router-link :to="`/notes/edit/${note.id}`" tag="button" class="btn btn-success btn-xs col-md-4" style="padding-right:5px">edit</router-link>
                                <button type="button" class="btn btn-danger btn-xs col-md-4"  @click="deleteData( note.id )" style="padding-right:5px">Delete</button>   
                            </div>

                        </td>
                    </tr>
                </template>
            </tbody>
        </table>
        <pagination :data="laravelData" @pagination-change-page="getResults">
             <span slot="prev-nav">&lt; Previous</span>
            <span slot="next-nav">Next &gt;</span>            
        </pagination>
    </div>
</template>

<script>
 import InputTag from 'vue-input-tag';
    
export default {

	data() {
		return {
			// Our data object that holds the Laravel paginator data
			laravelData: {},
                                                      laravelCheck: {},
		}
	},
	mounted() {
		// Fetch initial results
		this.getResults();
	},

	methods: {
		// Our method to GET results from a Laravel endpoint
		getResults(page = 1) {
			axios.get('/api/notes?page=' + page)
				.then(response => {
					this.laravelData = response.data.notes;
                                                                                          this.laravelCheck=this.laravelData.data;
   				});
		},
		deleteData(id) {
			axios.delete('/api/notes/' + id)
				.then(response => {
                                                                           this.getResults( this.laravelData.current_page) ;   
				});
		},                
	}

}
 
    /*export default {
        name: 'list',
        mounted() {
            if (this.notes.length) {
                return;
            }
            
            this.$store.dispatch('getCustomers');
        },
        computed: {
            notes() {
                return this.$store.getters.notes;
            }
        }
    }*/
</script>

<style scoped>
.btn-wrapper {
    text-align: right;
    margin-bottom: 20px;
}
</style>
