<template>
    <vue-excel-xlsx
        :data="data"
        :columns="columns"
        :file-name="'filename'"
        :file-type="'xlsx'"
        :sheet-name="'sheetname'"
        >
        Download
    </vue-excel-xlsx>
</template>

<script>
export default {
    name:'TryLang'
}
</script>

<style>

</style>