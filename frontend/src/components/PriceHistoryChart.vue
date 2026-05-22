<template>
  <Line :data="chartData" :options="chartOptions" />
</template>

<script>
import { Line } from 'vue-chartjs'
import {
  Chart as ChartJS,
  LineElement,
  PointElement,
  LinearScale,
  TimeScale,
  Legend,
  Tooltip,
} from 'chart.js'
import 'chartjs-adapter-date-fns'

ChartJS.register(LineElement, PointElement, LinearScale, TimeScale, Legend, Tooltip)

export default {
  name: 'PriceHistoryChart',
  components: { Line },
  props: {
    history: { type: Array, default: () => [] },
  },
  computed: {
    chartData() {
      const colors = ['#e74c3c', '#3498db', '#2ecc71', '#f39c12', '#9b59b6', '#1abc9c']
      return {
        datasets: this.history.map((fuel, i) => ({
          label: fuel.fuelName,
          data: fuel.fuelPrice.map((p) => ({ x: p.time, y: p.price })),
          tension: 0.3,
          fill: false,
          borderColor: colors[i % colors.length],
          pointBackgroundColor: colors[i % colors.length],
        })),
      }
    },
    chartOptions() {
      return {
        responsive: true,
        scales: {
          x: { type: 'time', time: { unit: 'day' }, title: { display: true, text: 'Kuupäev' } },
          y: { title: { display: true, text: '€/l' } },
        },
      }
    },
  },
}
</script>
