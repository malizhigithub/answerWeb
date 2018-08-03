package cn.edu.lingnan.utils;

import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

/**
 * 
 * @author huang
 * 根据链接获取微信的json返回值
 */
public class HttpUtil {

	public static String getReturnJson(String url, String osrJson) {
		String result = "";
		try {
			URL reqURL = new URL(url);
			HttpsURLConnection httpsConn = (HttpsURLConnection) reqURL.openConnection();
			if(osrJson != null) {
				httpsConn.setDoOutput(true);
				OutputStreamWriter osr = new OutputStreamWriter(httpsConn.getOutputStream());
				osr.write(osrJson);
				osr.close();
			}
			InputStreamReader isr = new InputStreamReader(httpsConn.getInputStream());
			char[] chars = new char[1024];
			int len;
			while((len = isr.read(chars)) != -1) {
				result += new String(chars, 0, len);
			}
			isr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
