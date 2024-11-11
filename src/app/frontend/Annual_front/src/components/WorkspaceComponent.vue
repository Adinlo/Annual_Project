<template>
  <q-card>
    <q-card-section>
      <div class="text-h5">Gestion des Workspaces</div>
    </q-card-section>
    <q-card-section>
      <q-input v-model="newWorkspace" label="Nom du Workspace" @keyup.enter="addWorkspace" />
      <q-btn label="Ajouter Workspace" color="primary" @click="addWorkspace" />
    </q-card-section>
    <q-card-section>
      <q-list bordered separator>
        <q-item v-for="(workspace, index) in workspaces" :key="index">
          <q-item-section>{{ workspace.name }}</q-item-section>
          <q-item-section side>
            <q-btn icon="delete" color="negative" flat round @click="removeWorkspace(index)" />
          </q-item-section>
        </q-item>
      </q-list>
    </q-card-section>
  </q-card>
</template>

<script>
export default {
  name: "WorkspaceManager",
  data() {
    return {
      newWorkspace: "",
      workspaces: [
        { name: "Workspace 1" },
        { name: "Workspace 2" },
      ],
    };
  },
  methods: {
    addWorkspace() {
      if (this.newWorkspace) {
        this.workspaces.push({ name: this.newWorkspace });
        this.newWorkspace = "";
      }
    },
    removeWorkspace(index) {
      this.workspaces.splice(index, 1);
    },
  },
};
</script>
