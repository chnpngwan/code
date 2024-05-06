<script setup lang="ts">
import Bar from './components/Bar.vue';
import Line from './components/Line.vue';
import Pie from './components/Pie.vue';
import Scatter from './components/Scatter.vue';
import Bubble from './components/Bubble.vue';
import Radar from './components/Radar.vue';
import PolarArea from './components/PolarArea.vue';
</script>

<template>
  <main>
    <div class="container">
      <h2>Bar Chart</h2>
      <Bar id="bar" />
    </div>
    <div class="container">
      <Pie id="pie" />
    </div>
    <div class="container">
      <Line id="line" />
    </div>
    <div class="container">
      <Scatter id="scatter" />
    </div>
    <div class="container">
      <Bubble id="bubble" />
    </div>
    <div class="container">
      <Radar id="radar" />
    </div>
    <div class="container">
      <PolarArea id="polar" />
    </div>
  </main>
</template>

<style scoped>
.container {
  border-bottom: 2px solid;
  height: 600px;
  width: 90%;
  margin: 0 auto;
}

h2 {
  text-align: center;
  padding: 1rem 0;
}

#bar,
#pie,
#line,
#scatter,
#bubble,
#radar,
#polar {
  width: 300px;
  max-height: 500px;
  margin: 3rem 0;
  padding: 2rem 0;
}
</style>
