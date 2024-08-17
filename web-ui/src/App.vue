<template>
  <div id="app">
    <router-view />
    <theme-picker />
    <global-uploader></global-uploader>
  </div>
</template>

<script>
import ThemePicker from "@/components/ThemePicker";
import GlobalUploader  from '@/views/disk/fileuploader/globalUploader';

export default {
  name: "App",
  components: { ThemePicker,GlobalUploader },
    metaInfo() {
        return {
            title: this.$store.state.settings.dynamicTitle && this.$store.state.settings.title,
            titleTemplate: title => {
                return title ? `${title} - ${process.env.VUE_APP_TITLE}` : process.env.VUE_APP_TITLE
            }
        }
    }
};
</script>
<style scoped>
#app .theme-picker {
  display: none;
}
</style>
