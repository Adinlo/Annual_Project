<template>
  <q-card>
    <q-card-section>
      <div class="text-h5">Gestion des Workspaces</div>
    </q-card-section>
    <q-card-section>
      <q-input 
        v-model="newWorkspace" 
        label="Nom du Workspace" 
        @keyup.enter="addWorkspace" 
      />
      <q-btn 
        label="Ajouter Workspace" 
        color="primary" 
        @click="addWorkspace" 
      />
    </q-card-section>
    <q-card-section>
      <q-list bordered separator>
        <q-item v-for="(workspace, index) in workspaces" :key="index">
          <q-item-section>{{ workspace.name }}</q-item-section>
          <q-item-section side>
            <q-btn 
              icon="delete" 
              color="negative" 
              flat 
              round 
              @click="removeWorkspace(index)" 
            />
          </q-item-section>
        </q-item>
      </q-list>
    </q-card-section>
  </q-card>
</template>

<script>
import { ref } from "vue";

export default {
  name: "WorkspaceComponent",
  setup() {
    const newWorkspace = ref("");
    const workspaces = ref([
      { name: "Workspace 1" },
      { name: "Workspace 2" },
    ]);

    const addWorkspace = () => {
      if (newWorkspace.value.trim() !== "") {
        workspaces.value.push({ name: newWorkspace.value });
        newWorkspace.value = "";
      }
    };

    const removeWorkspace = (index) => {
      workspaces.value.splice(index, 1);
    };

    return {
      newWorkspace,
      workspaces,
      addWorkspace,
      removeWorkspace,
    };
  },
};
</script>
