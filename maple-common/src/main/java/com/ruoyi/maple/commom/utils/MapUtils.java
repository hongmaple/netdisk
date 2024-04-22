package com.ruoyi.maple.commom.utils;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

/**
 * 高德地图工具
 */
public class MapUtils {
    public static void main(String[] args) {
        try {
            // 1、根据地址获取经纬度
            Map<String, String> lonAndLat = getLonAndLat("浙江省杭州市滨江区江汉路1515号");
            System.out.println("转换后经纬度为：" + lonAndLat);

            // 2、根据经纬度获取地址
            String formattedAddress = getAMapByLngAndLat("120.204798", "30.201000");
            System.out.println("转换后地址为：" + formattedAddress);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Map getLonAndLat(String address) {
        return getLonAndLat(address,"047528a74a5ec3060aff6a0c212d5cf8");
    }

    public static String getAMapByLngAndLat(String getLng, String getLat) throws Exception {
        return getAMapByLngAndLat(getLng,getLat,"047528a74a5ec3060aff6a0c212d5cf8");
    }

    /**
     * 地址转换为经纬度
     *
     * @param address 地址
     * @param key     高德地图应用key
     * @return 经纬度
     */
    public static Map getLonAndLat(String address, String key) {
        // 返回输入地址address的经纬度信息, 格式是 经度,纬度
        String queryUrl = "http://restapi.amap.com/v3/geocode/geo?key=" + key + "&address=" + address;
        // 高德接口返回的是JSON格式的字符串
        String queryResult = getResponse(queryUrl);
        Map<String, String> map = new HashMap<String, String>();
        JSONObject obj = JSONObject.parseObject(queryResult);
        if (obj.get("status").toString().equals("1")) {
            JSONObject jobJSON = JSONObject.parseObject(obj.get("geocodes").toString().substring(1, obj.get("geocodes").toString().length() - 1));
            String location = jobJSON.get("location").toString();
            System.out.println("经纬度：" + location);
            String[] lonAndLat = location.split(",");
            if (lonAndLat != null && lonAndLat.length == 2) {
                map.put("lng", lonAndLat[0]);
                map.put("lat", lonAndLat[1]);
            }
            System.out.println(map);
            return map;
        } else {
            throw new RuntimeException("地址转换经纬度失败，错误码：" + obj.get("infocode"));
        }
    }

    /**
     * 将经纬度getLng， getLat 通过getAMapByLngAndLat方法转换地址
     *
     * @param getLng 经度
     * @param getLat 纬度
     * @param key    高德地图应用key
     * @return 地址名称
     * @throws Exception
     */
    public static String getAMapByLngAndLat(String getLng, String getLat, String key) throws Exception {
        String url;
        try {
            url = "http://restapi.amap.com/v3/geocode/regeo?output=JSON&location=" + getLng + ","
                    + getLat + "&key=" + key + "&radius=0&extensions=base";
            String queryResult = getResponse(url); // 高德接品返回的是JSON格式的字符串
            // 将获取结果转为json数据
            JSONObject obj = JSONObject.parseObject(queryResult);
            System.out.println("obj为：" + obj);
            if (obj.get("status").toString().equals("1")) {
                // 如果没有返回-1
                JSONObject regeocode = obj.getJSONObject("regeocode");
                if (regeocode.size() > 0) {
                    // 在regeocode中拿到 formatted_address 具体位置
                    return regeocode.get("formatted_address").toString();
                } else {
                    throw new RuntimeException("未找到相匹配的地址！");
                }
            } else {
                throw new RuntimeException("请求错误！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "-1";
    }

    /**
     * 根据两个定位点的经纬度算出两点间的距离
     *
     * @param startLonLat 起始经纬度
     * @param endLonLat   结束经纬度（目标经纬度）
     * @param key         高德地图应用key
     * @return 两个定位点之间的距离
     */
    private static long getDistance(String startLonLat, String endLonLat, String key) {
        // 返回起始地startAddr与目的地endAddr之间的距离，单位：米
        Long result = new Long(0);
        String queryUrl = "http://restapi.amap.com/v3/distance?key=" + key + "&origins=" + startLonLat + "&destination=" + endLonLat;
        String queryResult = getResponse(queryUrl);
        JSONObject obj = JSONObject.parseObject(queryResult);
        JSONArray ja = obj.getJSONArray("results");
        JSONObject jobO = JSONObject.parseObject(ja.getString(0));
        result = Long.parseLong(jobO.get("distance").toString());
        System.out.println("距离：" + result);
        return result;
    }

    /**
     * 发送请求
     *
     * @param serverUrl 请求地址
     */
    private static String getResponse(String serverUrl) {
        // 用JAVA发起http请求，并返回json格式的结果
        StringBuffer result = new StringBuffer();
        try {
            URL url = new URL(serverUrl);
            URLConnection conn = url.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result.append(line);
            }
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }
}


