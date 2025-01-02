<template>
  <q-layout view="lHh LpR lFf">
    <q-page-container>
      <q-page class="flex flex-center">
        <q-card flat bordered class="q-pa-md q-mt-lg" style="max-width: 400px;">
          <q-card-section>
            <div class="text-h6 text-center">Connexion</div>
          </q-card-section>

          <q-card-section>
            <q-form @submit.prevent="handleLogin" ref="formRef">
              <q-input
                v-model="email"
                label="Adresse e-mail"
                type="email"
                outlined
                clearable
                dense
                :error="!!emailError"
                :error-message="emailError"
              />

              <q-input
                v-model="password"
                label="Mot de passe"
                type="password"
                outlined
                clearable
                dense
                class="q-mt-md"
              />

              <q-btn
                type="submit"
                label="Se connecter"
                color="primary"
                class="q-mt-lg full-width"
              />
            </q-form>
          </q-card-section>

          <q-card-actions align="center">
            <q-btn
              flat
              label="Créer un compte"
              color="secondary"
              @click="redirectToSignup"
            />
          </q-card-actions>
        </q-card>
      </q-page>
    </q-page-container>
  </q-layout>
</template>

<script>
import { ref } from 'vue';

export default {
  name: "ConnexionComponent",
  setup() {
    const email = ref('');
    const password = ref('');
    const emailError = ref('');
    const formRef = ref(null);

    const RegexEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    const emailValidation = () => {
      if (RegexEmail.test(email.value)) {
        emailError.value = ''; // Pas d'erreur si l'email est valide
        return true;
      } else {
        emailError.value = 'Adresse e-mail invalide';
        return false;
      }
    };

    const handleLogin = () => {
      const isEmailValid = emailValidation();

      if (!isEmailValid) {
        console.log('Erreur : Adresse e-mail invalide');
        return; // Arrête l'exécution si l'email est invalide
      }

      if (formRef.value.validate()) {
        console.log('Connexion réussie avec :', email.value, password.value); // implementation avec le back en attente
      }
    };

    const redirectToSignup = () => {
      console.log('Redirection vers la page de création de compte...');
    };

    return {
      email,
      password,
      emailError,
      formRef,
      handleLogin,
      redirectToSignup,
    };
  },
};
</script>
