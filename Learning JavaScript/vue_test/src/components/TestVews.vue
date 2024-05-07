<template>
  <div>
    <label for="name">姓名</label>
    <input v-model="inputName" @keyup.enter="handleEnter" placeholder="请输入姓名" id="name"/>
    <label for="age">年龄</label>
    <input v-model.number="inputAge" @keyup.enter="handleEnter" placeholder="请输入年龄" id="age"/>
    <label for="class">班级</label>
    <input v-model="inputClass" @keyup.enter="handleEnter" placeholder="请输入班级" id="class"/>
    <div class="table-container">
      <table>
        <thead>
        <tr>
          <th>序号</th>
          <th>姓名</th>
          <th>年龄</th>
          <th>班级</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="(item, index) in dataList" :key="index">
          <td>{{ index + 1 }}</td>
          <td>{{ item.name }}</td>
          <td>{{ item.age }}</td>
          <td>{{ item.class }}</td>
          <td>
            <button @click="handleDelete(index)">删除</button>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
    <div>共有{{ dataList.length }}条数据</div>
  </div>
</template>

<script>
export default {
  name: "TestVews",
  data() {
    return {
      inputName: '',
      inputAge: '',
      inputClass: '',
      dataList: []
    }
  },
  methods: {
    handleEnter() {
      console.log(this.inputName, this.inputAge, this.inputClass);
      // 在这里可以将输入框的内容提交到后台进行处理，获取数据列表
      // 这里假设获取到了10条数据
      this.dataList = Array.from({ length: 1 }, (unused, index) => ({
        name: this.inputName,
        age: this.inputAge,
        class: this.inputClass,
      }));
      this.inputName = '';
      this.inputAge = '';
      this.inputClass = '';
    },
    handleDelete(index) {
      this.dataList.splice(index, 1);
    }
  }
}
</script>

<style scoped>
  .table-container {
    width: 100%;
    text-align: center;
    display: flex;
    justify-content: center;
  }
  table {
    max-width: 100%;
    border: 1px solid black;
    border-collapse: collapse;
  }
  thead th {
    border-top: 1px solid black;
    border-bottom: 1px solid black;
  }
  td, th {
    border-left: 1px solid black;
    border-right: 1px solid black;
    padding: 8px;
  }
</style>
