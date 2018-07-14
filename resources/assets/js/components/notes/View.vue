<template>
    <div class="note-view" v-if="note">
        <div class="user-img">
            <img src="https://www.scottsdaleazestateplanning.com/wp-content/uploads/2018/01/user.png" alt="">
        </div>
        <div class="user-info">
            <table class="table">
                <tr>
                    <th>ID</th>
                    <td>{{ note.id }}</td>
                </tr>
                <tr>
                    <th>title</th>
                    <td>{{ note.title }}</td>
                </tr>
                <tr>
                    <th>Content</th>
                    <td>{{ note.content }}</td>
                </tr>
                <tr>
                    <th>Tags</th>
                    <td> <input-tag   :tags.sync="note.tags" :read-only="true" :limit="limit"></input-tag></td>
                </tr>
            </table>
            <router-link to="/notes">Back to all notes</router-link>
        </div>
    </div>
</template>

<script>
    import InputTag from 'vue-input-tag';
    export default {
        name: 'view',
        created() {
            if (this.notes.length) {
                this.note = this.notes.find((note) => note.id == this.$route.params.id);
            } else {
                axios.get(`/api/notes/${this.$route.params.id}`)
                    .then((response) => {
                        this.note = response.data.note
                    });
            }
        },
        data() {
            return {
                note: null
            };
        },
        computed: {
            currentUser() {
                return this.$store.getters.currentUser;
            },
            notes() {
                return this.$store.getters.notes;
            }
        }
    }
</script>

<style scoped>
.note-view {
    display: flex;
    align-items: center;
}
.user-img {
    flex: 1;
}
.user-img img {
    max-width: 160px;
}
.user-info {
    flex: 3;
    overflow-x: scroll;
}
</style>
