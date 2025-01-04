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

          <!-- Upload des docs -->
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
            label="Sauvegarder"
            color="primary"
            class="q-mt-md full-width"
          />
        </q-form>
      </q-card-section>

      <q-card-section>
        <q-list bordered class="q-mt-md">
          <q-item
            v-for="(doc, index) in documents"
            :key="index"
            class="q-items-between"
          >
            <q-item-section>
              <span><b>{{ doc.title }}</b></span>
            </q-item-section>
            <q-item-section side>
              <q-btn
                flat
                round
                dense
                icon="link"
                label="Télécharger"
                @click="downloadFile(doc.file)"
              />
            </q-item-section>
            <q-item-section side>
              <q-btn
                flat
                round
                dense
                icon="delete"
                color="negative"
                @click="removeDocument(index)"
              />
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
    const documents = ref([]); // Liste des documents ajoutés
    const documentTitle = ref(''); // Titre du document
    const documentFile = ref(null); // Fichier sélectionné
    const errors = ref({ title: '', file: '' }); // Gestion des erreurs

    const addDocument = () => {
      // Réinitialisation des erreurs
      errors.value.title = '';
      errors.value.file = '';

      // Validation
      if (!documentTitle.value.trim()) {
        errors.value.title = 'Le titre est requis.';
      }

      if (!documentFile.value || !(documentFile.value instanceof File)) {
        errors.value.file = 'Un fichier valide est requis.';
      }

      // Si pas d'erreurs, ajouter le document
      if (!errors.value.title && !errors.value.file) {
        documents.value.push({
          title: documentTitle.value.trim(),
          file: documentFile.value,
        });

        // Réinitialisation des champs
        documentTitle.value = '';
        documentFile.value = null;
      }
    };

    const removeDocument = (index) => {
      documents.value.splice(index, 1);
    };

    const downloadFile = (file) => {
      if (!file || !(file instanceof File)) {
        console.error('Fichier invalide ou inexistant.');
        return;
      }

      const url = URL.createObjectURL(file);
      const link = document.createElement('a');
      link.href = url;
      link.download = file.name || 'document';
      link.click();

      URL.revokeObjectURL(url);
    };

    return {
      documents,
      documentTitle,
      documentFile,
      errors,
      addDocument,
      downloadFile,
      removeDocument,
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
