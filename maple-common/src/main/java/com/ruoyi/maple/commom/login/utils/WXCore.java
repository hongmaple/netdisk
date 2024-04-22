package com.ruoyi.maple.commom.login.utils;

import com.alibaba.fastjson2.JSONObject;
import org.apache.commons.codec.binary.Base64;

/**
 * 封装对外访问方法
 * @author maple
 *
 */
public class WXCore {

	private static final String WATERMARK = "watermark";
	private static final String APPID = "appid";
	/**
	 * 解密数据
	 * @return 解密后的信息
	 * @throws Exception
	 */
	public static String decrypt(String appId, String encryptedData, String sessionKey, String iv){
		String result = "";
		try {
			AES aes = new AES();
			byte[] resultByte = aes.decrypt(Base64.decodeBase64(encryptedData), Base64.decodeBase64(sessionKey), Base64.decodeBase64(iv));
			if(null != resultByte && resultByte.length > 0){
				result = new String(WxPKCS7Encoder.decode(resultByte));
				JSONObject jsonObject = JSONObject.parseObject(result);
				String decryptAppid = jsonObject.getJSONObject(WATERMARK).getString(APPID);
				if(!appId.equals(decryptAppid)){
					result = "";
				}
			}
		} catch (Exception e) {
			result = "";
			e.printStackTrace();
		}
		return result;
	}


	public static void main(String[] args) throws Exception{
		String appId = "";
		String encryptedData = "";
		String sessionKey = "";
		String iv = "";
		System.out.println(decrypt(appId, encryptedData, sessionKey, iv));
	}
}