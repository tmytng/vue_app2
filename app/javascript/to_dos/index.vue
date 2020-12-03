<template>
  <el-table
    :data="toDos"
    style="width: 100%">
    <el-table-column
      prop="title"
      label="title"
      width="180">
    </el-table-column>
    <el-table-column
      prop="expired_at"
      label="expired_at"
      width="180">
    </el-table-column>
    <el-table-column
　　  width="120">
　　  <template v-slot="scope">
    　　<el-button
      　　@click="destroyToDo(scope.row.id)"
          type="danger"
          icon="el-icon-delete"
          circle></el-button>
　　  </template>
    </el-table-column>
  </el-table>
</template>

<script>
import axios from 'axios'
  export default {
    data() {
      return {
        toDos: []
      }
    },
    created() {
      axios.get('/api/v1/to_dos')
        .then(res => {
          this.toDos = res.data
        })
    },
    methods: {
    destroyToDo(id) {
    axios.delete('/api/v1/to_dos/' + id)
      .then(res => {
      });
    }
  }
}
</script>
