<template>
    <q-page class="q-pa-md">
      <q-card class="q-mb-md">
        <q-card-section>
          <h2>Inscription</h2>
        </q-card-section>
        <q-card-section>
          <q-input v-model="name" label="Nom" />
          <q-input v-model="email" label="Email" type="email" />
          <q-input v-model="password" label="Mot de passe" type="password" />
        </q-card-section>
        <q-card-actions align="right">
          <q-btn label="S'inscrire" color="secondary" @click="signup" />
        </q-card-actions>
      </q-card>
    </q-page>
  </template>
  
  <script>
  export default {
    name: "SignupPage",
    data() {
      return {
        name: "",
        email: "",
        password: "",
      };
    },
    methods: {
      signup() {
        // blabla
      },
    },
  };
  </script>
  