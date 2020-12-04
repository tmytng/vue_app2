<template>
  <div id="app">
    <el-row>
      <el-button
        icon="el-icon-plus"
        @click="createToDoDialog = true"
        circle></el-button>
      <el-col :span="12" :offset="6">
        <el-tabs v-model="activeName">
          <el-tab-pane label="ToDo" name="toDo">
            <to-do-table
              v-bind:to-dos="filter(toDos, false)"
              @update="updateToDo"
              @destroy="destroyToDo"></to-do-table>
          </el-tab-pane>
          <el-tab-pane label="終了したToDo" name="finishedToDo">
            <to-do-table v-bind:to-dos="filter(toDos, true)"></to-do-table>
          </el-tab-pane>
        </el-tabs>
      </el-col>
    </el-row>
    <el-dialog
    :visible.sync="createToDoDialog"
    width="30%"
    center>
    <to-do-form @close="closeDialog" @add="addToDo"></to-do-form>
  </el-dialog>
  </div>
</template>

<script>
import ToDoTable from '../to_dos/to-do-table'
import ToDoForm from '../to_dos/to-do-form'
import axios from 'axios'
import {reject, filter} from 'lodash';
  export default {
    data() {
      return {
        toDos: [],
        activeName: "toDo",
        createToDoDialog: false
      }
    },
    created() {
      axios.get('/api/v1/to_dos')
        .then(res => {
          this.toDos = res.data
        })
    },
    components: {
      ToDoTable,
      ToDoForm
    },
    methods: {
      destroyToDo(id) {
        axios.delete('/api/v1/to_dos/' + id)
          .then(res => {
            if (res.status === 200) {
              this.toDos = reject(this.toDos, ['id', id]);
            }
        });
      },
      updateToDo(id, finished) {
        axios.patch('/api/v1/to_dos/' + id, {to_do: {finished: finished}})
          .then(res => {
            if (res.status === 200) {
              console.log(res)
          }
        })
      },
      filter(toDos, finished) {
        return filter(toDos, ['finished', finished])
      },
      closeDialog() {
        this.createToDoDialog = false
      },
      addToDo(toDo) {
        this.toDos.push(toDo)
      }
    }
}
</script>
