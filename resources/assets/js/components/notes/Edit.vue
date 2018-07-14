<template>
    <div class="note-new">
        <form @submit.prevent="edit">
            <input type="hidden" class="form-control" v-model="note.id" />
            <input type="hidden" class="form-control" v-model="note.user_id"  />            
            <table class="table">
                <tr>
                    <th>Title</th>
                    <td>
                          <input type="text" class="form-control" v-model="note.title" placeholder="title"/>    
                    </td>
                </tr>
            
                <tr>
                    <th>Content</th>
                    <td> <wysiwyg v-model="note.content" /> </td>
                </tr>
                <tr>
                    <th>Tags</th>
                    <td>     
                       <input-tag placeholder="Edit Tag" :tags.sync="note.tags" :limit="limit"></input-tag>
                      
                     </td>
                </tr>                
                <tr>
                    <td>
                        <router-link to="/notes" class="btn">Cancel</router-link>
                    </td>
                    <td class="text-right">
                        <input type="submit" value="Update" class="btn btn-primary">
                    </td>
                </tr>
            </table>
        </form>
        <div class="errors" v-if="errors">
            <ul>
                <li v-for="(fieldsError, fieldName) in errors" :key="fieldName">
                    <strong>{{ fieldName }}</strong> {{ fieldsError.join('\n') }}
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    import validate from 'validate.js';
    import InputTag from 'vue-input-tag';
    import { getLocalUser } from "../../helpers/auth";    
    const user = getLocalUser();
    
    export default {
        name: 'edit',
        created() {
              this.note.user_id =  this.$store.getters.currentUser.id;
              
            if (this.notes.length) {
                this.note = this.notes.find((note) => note.id == this.$route.params.id);

            } else {
                axios.get(`/api/notes/${this.$route.params.id}`)
                    .then((response) => {
                        this.note = response.data.note;
                    });
            }
 
 
          
        },        
        data() {
            return {
                note: {
                    user_id:'',      
                    title:'',
                    content: '',  
                    tags: [],
                },
                errors: null
            };
        },
        computed: {
            currentUser() {
                return this.$store.getters.currentUser;
            },
            notes() {
                return this.$store.getters.notes;
            }
        },
        methods: {
            edit() {
                this.errors = null;

                const constraints = this.getConstraints();

                const errors = validate(this.$data.note, constraints);

                if(errors) {
                    this.errors = errors;
                    return;
                }

                axios.put('/api/notes/update/' + this.$route.params.id, this.$data.note)
                    .then((response) => {
                        this.$router.push('/notes');
                    });
            },
            getConstraints() {
              return {
                    title: {
                        presence: true,
                        length: {
                            minimum: 3,
                            message: 'Must be at least 3 characters long'
                        }
                    },

                    content: {
                        presence: true,
                        length: {
                            minimum: 10,
                            message: 'Must be at least 10 characters long'
                        }
                    }

                   
                };
            }
        }
    }
</script>

<style>
@import "~vue-wysiwyg/dist/vueWysiwyg.css";    
.errors {
    background: lightcoral;
    border-radius:5px;
    padding: 21px 0 2px 0;
}
</style>

