import Home from './components/Home.vue';
import Login from './components/auth/Login.vue';
import Register from './components/auth/Register.vue';
import notesMain from './components/notes/Main.vue';
import notesList from './components/notes/List.vue';
import Newnote from './components/notes/New.vue';
import note from './components/notes/View.vue';
import noteEdit from './components/notes/Edit.vue';

export const routes = [
    {
        path: '/',
        component: Home,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/register',
        component: Register
    },	
    {
        path: '/login',
        component: Login
    },
    {
        path: '/notes',
        component: notesMain,
        meta: {
            requiresAuth: true
        },
        children: [
            {
                path: '/',
                component: notesList
            },
            {
                path: 'new',
                component: Newnote
            },
            {
                path: ':id',
                component: note
            },
			{
			  path: 'edit/:id',
			  component: noteEdit
			}
        ]
    }
];