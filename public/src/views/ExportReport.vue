<template>
  <div class="ExportReport">
        <v-header>
            <h2 class="pr-10 header-text">Export Report</h2>
        </v-header><br>
        <v-row>
    <v-col class="pl-12"
      cols="12"
      sm="4"
    >
      <v-date-picker header-color="#1e6097"
      color="#2d78b1"
        v-model="dates"
        range
      ></v-date-picker>
      </v-col>
      <v-col
      cols="12"
      sm="6"
    >
      <v-text-field

        v-model="dateRangeText"
        label="Date range"
        prepend-icon="mdi-calendar"
        readonly
      ></v-text-field>
      <v-btn>
        Export Report
      </v-btn>
    </v-col>
  </v-row>
  </div>
</template>

<script>
  export default {
    data: () => ({
      dates: ['2022-04-01', '2022-04-07'],
    }),
    computed: {
      dateRangeText () {
        return this.dates.join(' - ')
      },
    },
  }
</script>