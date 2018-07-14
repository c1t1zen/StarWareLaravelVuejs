require('./bootstrap');
import Vue from 'vue';
import VueRouter from 'vue-router';
import Vuex from 'vuex';
import {routes} from './routes';
import StoreData from './store';
import MainApp from './components/MainApp.vue';
import {initialize} from './helpers/general';
import wysiwyg from "vue-wysiwyg";
import InputTag from 'vue-input-tag';
import VeeValidate from 'vee-validate';



Vue.use(VueRouter);
Vue.use(Vuex);
Vue.component('pagination', require('laravel-vue-pagination'));
Vue.component('input-tag', InputTag);
Vue.use(wysiwyg, {}); // config is optional. more below
Vue.use(VeeValidate);

const store = new Vuex.Store(StoreData);

const router = new VueRouter({
    routes,
    mode: 'history'
});

initialize(store, router);

const app = new Vue({
    el: '#app',
    router,
    store,
    components: {
        MainApp,InputTag
    }
});
