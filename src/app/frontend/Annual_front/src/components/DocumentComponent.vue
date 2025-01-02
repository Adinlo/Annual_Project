<template>
  <div class="q-pa-md">
    <q-card flat bordered>
      <q-card-section>
        <div class="text-h6 text-center">Gestion des Documents</div>
      </q-card-section>

      <q-card-section>
        <q-form @submit.prevent="addDocument">
          <q-input
            v-model="documentTitle"
            label="Titre du document"
            outlined
            dense
            clearable
            :error="!!errors.title"
            :error-message="errors.title"
          />

          <!-- upload des docs -->
          <q-file
            v-model="documentFile"
            label="Ajouter un fichier"
            filled
            bottom-slots
            counter
            max-files="1"
            :error="!!errors.file"
            :error-message="errors.file"
          >
            <template v-slot:before>
              <q-icon name="folder_open" />
            </template>
            <template v-slot:hint>
              Sélectionnez un fichier
            </template>
          </q-file>

          <q-btn
            type="submit"
            label="Enregistrer"
            color="primary"
            class="q-mt-md full-width"
          />
        </q-form>
      </q-card-section>

      <q-card-section>
        <q-list bordered class="q-mt-md">
          <q-item v-for="(doc, index) in documents" :key="index">
            <q-item-section>
              <span><b>{{ doc.title }}</b></span>
            </q-item-section>
          </q-item>
        </q-list>
      </q-card-section>
    </q-card>
  </div>
</template>

<script>
import { ref } from 'vue';

export default {
  name: 'DocumentComponent',
  setup() {
    const documents = ref([]); 
    const documentTitle = ref(''); 
    const documentFile = ref([]); 
    const errors = ref({ title: '', file: '' }); 

    const addDocument = () => {
      // Réinitialisation des erreurs
      errors.value.title = '';
      errors.value.file = '';

      if (!documentTitle.value.trim()) {
        errors.value.title = 'Le titre est requis.';
      }
      if (documentFile.value.length === 0) {
        errors.value.file = 'Un fichier est requis.';
      }

      if (!errors.value.title && !errors.value.file) {
        documents.value.push({
          title: documentTitle.value.trim(),
          file: documentFile.value[0], 
        });

        documentTitle.value = '';
        documentFile.value = [];
      }
    };

    return {
      documents,
      documentTitle,
      documentFile,
      errors,
      addDocument,
    };
  },
};


</script>

<style scoped>
.q-pa-md {
  max-width: 400px;
  margin: auto;
}
.q-list {
  max-height: 300px;
  overflow-y: auto;
}
</style>
