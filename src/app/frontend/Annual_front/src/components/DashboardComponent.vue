<template>
    <q-card class="card">
      <div class="dash_center q-pa-md">
        <div class="text-h5 q-pa-md ">Tableau de Bord</div>
        <q-list>
          <q-item clickable v-ripple to="/user">
            <q-item-section avatar>
              <q-icon name="account_circle" />
            </q-item-section>
            <q-item-section>Profil </q-item-section>
          </q-item>
          
          <q-item clickable v-ripple to="/workspace">
            <q-item-section avatar>
              <q-icon name="workspaces" />
            </q-item-section>
            <q-item-section>Workspaces</q-item-section>
          </q-item>

          <q-item clickable v-ripple to="/connexion">
            <q-item-section avatar>
              <q-icon name="login" />
            </q-item-section>
            <q-item-section>Connexion</q-item-section>
          </q-item>

          <q-item clickable v-ripple to="/documents">
            <q-item-section avatar>
              <q-icon name="folder" />
            </q-item-section>
            <q-item-section>Documents</q-item-section>
          </q-item>

          <q-item clickable v-ripple to="/chatbot">
            <q-item-section avatar>
              <q-icon name="smart_toy" />
            </q-item-section>
            <q-item-section>RaggyChat</q-item-section>
          </q-item>

          <!-- <q-item clickable v-ripple to="/connexion">
            <q-item-section avatar>
              <q-icon name="person_add" />
            </q-item-section>
            <q-item-section>Inscription</q-item-section>
          </q-item> -->

        </q-list>
      </div>
    </q-card>
  </template>
  
  <script>
  export default {
    name: "DashboardComponent",
  };
  </script>

<style>
.dash_center {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100px; 
  text-align: center;
  margin-right: auto;
}

.card {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 350px;  
  max-width: 250px;  
  margin: 0 auto;  
  background-color: #abf1ec;

}
</style>
  