<template>
  <q-card>
    <q-card-section>
      <div class="text-h5">Profil Utilisateur</div>
    </q-card-section>
    <q-card-section>
      <q-input v-model="userData.name" label="Nom" />
      <q-input v-model="userData.email" label="Email" type="email" readonly />
    </q-card-section>
    <q-card-actions align="right">
      <q-btn label="Mettre à jour" color="primary" @click="updateProfile" />
    </q-card-actions>
  </q-card>
</template>

<script>
import { ref } from "vue";

export default {
  name: "UserProfile",
  props: {
    user: {
      type: Object,
      required: true,
    },
  },
  setup(props, { emit }) {
    // Données locales pour le formulaire utilisateur
    const userData = ref({ ...props.user });

    // Met à jour le profil
    const updateProfile = () => {
      emit("update", userData.value);
    };

    return {
      userData,
      updateProfile,
    };
  },
};
</script>
