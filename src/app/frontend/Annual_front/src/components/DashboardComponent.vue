<template>
    <q-card>
      <q-card-section>
        <div class="text-h5">Tableau de Bord</div>
      </q-card-section>
      <q-card-section>
        <q-list bordered>
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
          <q-item clickable v-ripple to="/login">
            <q-item-section avatar>
              <q-icon name="login" />
            </q-item-section>
            <q-item-section>Connexion</q-item-section>
          </q-item>
          <q-item clickable v-ripple to="/signup">
            <q-item-section avatar>
              <q-icon name="person_add" />
            </q-item-section>
            <q-item-section>Inscription</q-item-section>
          </q-item>
        </q-list>
      </q-card-section>
    </q-card>
  </template>
  
  <script>
  export default {
    name: "DashboardNavigation",
  };
  </script>
  