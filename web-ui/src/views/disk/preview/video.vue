<template>
  <div style="width: 100%;height: 70%;text-align: center">
    <vue-core-video-player :title="name" :src="baseUrl+url"/>
  </div>
</template>

<script>
import {getQueryObject} from "@/utils/index";

export default {
  name: "share-list",
  data() {
    return {
      // 遮罩层
      loading: false,
      url: "",
      name: "",
      baseUrl: process.env.VUE_APP_BASE_API,
    }
  },
  created() {
    const { url,name } = this.$route.params
    this.url = url;
    this.name = name;
  },
  methods: {

  }
};
</script>
<style lang="scss" scoped>

</style>

