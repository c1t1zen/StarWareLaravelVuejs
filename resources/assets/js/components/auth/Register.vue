<template>
    <div class="login row justify-content-center">
        <div class="col-md-4">
 
            
            <div class="card">
       
                <div class="card-header">register</div>
                <div class="card-body">
                   <form @submit.prevent="add">
                        <div class="form-group row">
                            <label for="name">Name:</label>
                            <input type="text" v-model="form.name" class="form-control" placeholder="Name">
                        </div>                        
                        <div class="form-group row">
                            <label for="email">Email:</label>
                            <input type="text" v-model="form.email" class="form-control" placeholder="Email Address">
                        </div>
                        <div class="form-group row">
                            <label for="password">Password:</label>
                            <input type="password" v-model="form.password" class="form-control" placeholder="Password">
                        </div>
                        <div class="form-group row">
                            <label for="password">Password: confirmation</label>
                            <input type="password" v-model="form.password_confirmation" class="form-control" placeholder="password_confirmation">
                        </div>                       
                        <div class="form-group row">
                            <input type="submit" class ="btn btn-primary" value="Register">
                        </div>
                        <div class="errors" v-if="errors">
                            <ul>
                                <li v-for="(fieldsError, fieldName) in errors" :key="fieldName">
                                    <strong>{{ fieldName }}</strong> {{ fieldsError.join('\n') }}
                                </li>
                            </ul>
                        </div>                       
  
                    </form>
                </div>
         
            </div>
        </div>
    </div>
</template>

<script>
    import validate from 'validate.js';

    export default {
      name: 'register',
 
      data() {
        return {
          form: {
            name: '',
            email: '',
            password: '',
            password_confirmation:'',
          },
          errors: null
        }
      },
      methods: {
            add() {
        
                this.errors = null;
                
                    const constraints = this.getConstraints();
                const errors = validate(this.$data.form, constraints);
        
                if(errors) {
                    this.errors = errors;
                    return;
                }

                axios.post('/api/auth/register', this.$data.form)
                    .then((response) => {
                            console.log(response);
                            this.$router.push('/login');
                    }).catch((error) => {
                        alert("Warning :This  Email has been taken . Please select another one!");
                    });;
            },       
            getConstraints() {
              return {
                    name: {
                        presence: true,
                        length: {
                            minimum: 3,
                            message: 'Must be at least 3 characters long'
                        }
                    },
                    email: {
                       presence: true,
                       email: true
                    },
                    password: {
                      presence: true,
                      length: {
                        minimum: 6,
                        message: "must be at least 6 characters long"
                      }
                    },
                    password_confirmation: {
                      presence: true,
                      equality: "password"
                    }
                };
            }
      }
    }
</script>

<style scoped>
.errors {
    background: lightcoral;
    border-radius:5px;
    padding: 21px 0 2px 0;
}
</style>