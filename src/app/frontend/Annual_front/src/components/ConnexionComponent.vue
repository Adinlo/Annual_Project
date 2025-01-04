<template>
  <q-layout view="lHh LpR lFf">
    <q-page-container>
      <q-page class="flex flex-center">
        <q-card flat bordered class="q-pa-md q-mt-lg login-card">
          <q-card-section class="text-center">
            <div class="text-h6 animated fadeIn">Connexion</div>
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
                class="login-input"
              />

              <q-input
                v-model="password"
                label="Mot de passe"
                type="password"
                outlined
                clearable
                dense
                class="login-input q-mt-md"
              />

              <q-btn
                type="submit"
                label="Se connecter"
                color="primary"
                class="submit-btn full-width"
              />
            </q-form>
          </q-card-section>

          <q-card-actions align="center">
            <q-btn
              flat
              label="Créer un compte"
              color="secondary"
              @click="redirectToSignup"
              class="signup-btn"
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
        emailError.value = '';
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
        return;
      }

      if (formRef.value.validate()) {
        console.log('Connexion réussie avec :', email.value, password.value);
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

<style scoped>
.login-card {
  background-color: #f7f9fb;
  border-radius: 20px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  margin: 100px auto;
  transition: transform 0.3s ease;
}

.login-card:hover {
  transform: translateY(-10px);
}

.text-h6 {
  color: #2196F3;
  font-weight: 600;
}

.login-input {
  transition: all 0.3s ease;
}

.login-input:focus {
  box-shadow: 0 0 5px rgba(33, 150, 243, 0.6);
}

.submit-btn {
  transition: transform 0.3s ease, background-color 0.3s ease;
}

.submit-btn:hover {
  transform: scale(1.05);
  background-color: #1976D2;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.signup-btn {
  color: #2196F3;
  font-weight: bold;
  transition: color 0.3s ease;
}

.signup-btn:hover {
  color: #1976D2;
}

.animated {
  animation-duration: 0.5s;
  animation-timing-function: ease-out;
}

.fadeIn {
  animation-name: fadeIn;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
