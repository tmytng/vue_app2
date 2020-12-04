<template>
  <el-table
    :data="toDos"
    style="width: 100%">
    <el-table-column
      prop="finished">
      <template v-slot="scope">
        <el-checkbox
          v-model="scope.row.finished"
          @change="updateToDo(scope.row.id, scope.row.finished)"></el-checkbox>
      </template>
    </el-table-column>
    <el-table-column
      prop="title">
    </el-table-column>
    <el-table-column
      prop="expired_at">
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

  export default {
    props: ["toDos"]
  }

</script>
