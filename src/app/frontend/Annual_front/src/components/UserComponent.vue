<template>
  <q-card>
    <q-card-section>
      <div class="text-h5">Profil Utilisateur</div>
    </q-card-section>
    <q-card-section>
      <!-- <q-input v-model="user.name" label="Nom" />
      <q-input v-model="user.email" label="Email" type="email" readonly /> -->
    </q-card-section>
    <q-card-actions align="right">
      <q-btn label="Mettre à jour" color="primary" @click="updateProfile" />
    </q-card-actions>
  </q-card>
</template>

<script>
export default {
  name: "UserProfile",
  props: {
    user: {
      type: Object,
      required: true,
    },
  },
  methods: {
    updateProfile() {
      // Logique de mise à jour
      this.$emit("update", this.user);
    },
  },
};
</script>
