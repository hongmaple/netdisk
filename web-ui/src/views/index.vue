<template>
  <div class="app-container home">
    <el-row>
      <el-col :span="24" class="card-box">
        <el-card>

          <div @click="skipFileList" style="border: 2px solid;border-image: linear-gradient(to right, #743ad5, #d53a9d) 1;width: 350px;height: 150px;text-align: center" v-for="item in storageList">
            <div style="margin-top: 10px">
              <img style="width: 50px;height: 50px" src="@/assets/images/disk.png"/>
            </div>
            <div>
              总容量：
              <span>{{ storageUnitConversion(item.totalCapacity) }}</span>
            </div>
            <div>
              已用容量：
              <span>{{ storageUnitConversion(item.usedCapacity) }}</span>
            </div>
          </div>

        </el-card>
      </el-col>

      <el-col :span="12" class="card-box">
        <el-card>
          <div slot="header"><span><i class="el-icon-pie-chart"></i> 文件存储统计</span></div>
          <div class="el-table el-table--enable-row-hover el-table--medium">
            <div ref="typeCapacityStats" style="height: 420px" />
          </div>
        </el-card>
      </el-col>

      <el-col :span="12" class="card-box">
        <el-card>
          <div slot="header"><span><i class="el-icon-pie-chart"></i> 文件数量统计</span></div>
          <div class="el-table el-table--enable-row-hover el-table--medium">
            <div ref="fileTypeNumStats" style="height: 420px" />
          </div>
        </el-card>
      </el-col>

    </el-row>
  </div>
</template>

<script>
import * as echarts from "echarts";
import { myListStorage,getFileStorageStats } from "@/api/disk/storage";

export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.5",
      // 用户存储表格数据
      storageList: [],
      typeCapacityStats: null,
      storageStats: null,
      fileTypeNumStats: null
    };
  },
  created() {
    this.getStorageList();
    this.openLoading();
    this.getFileStorageStats();
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    /** 查询用户存储列表 */
    getStorageList() {
      myListStorage(this.queryParams).then(response => {
        this.storageList = response.rows;
      });
    },
    skipFileList() {
      this.$router.push({ path: "/disk/file" });
    },
    // 打开加载层
    openLoading() {
      this.$modal.loading("正在加载缓存监控数据，请稍候！");
    },
    /** 查缓文件存储统计 */
    getFileStorageStats() {
      getFileStorageStats().then((response) => {
        this.storageStats = response.data;
        this.$modal.closeLoading();

        this.typeCapacityStats = echarts.init(this.$refs.typeCapacityStats, "macarons");
        this.typeCapacityStats.setOption({
          tooltip: {
            trigger: "item",
            formatter: "{a} <br/>{b} : {c} ({d}%)",
          },
          series: [
            {
              name: "存储",
              type: "pie",
              roseType: "radius",
              radius: [15, 95],
              center: ["50%", "38%"],
              data: response.data.typeCapacityStats,
              animationEasing: "cubicInOut",
              animationDuration: 1000,
            }
          ]
        });

        this.fileTypeNumStats = echarts.init(this.$refs.fileTypeNumStats, "macarons");
        this.fileTypeNumStats.setOption({
          tooltip: {
            trigger: "item",
            formatter: "{a} <br/>{b} : {c} ({d}%)",
          },
          series: [
            {
              name: "数量",
              type: "pie",
              roseType: "radius",
              radius: [15, 95],
              center: ["50%", "38%"],
              data: response.data.fileTypeNumStats,
              animationEasing: "cubicInOut",
              animationDuration: 1000,
            }
          ]
        });


      });
    },
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

