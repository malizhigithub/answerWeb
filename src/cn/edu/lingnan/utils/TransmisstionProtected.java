package cn.edu.lingnan.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.UUID;

/**
 * 
 * @author huang
 * 用于邮件信息加密
 */
public class TransmisstionProtected {
	
	/**
	 * @author huang
	 * @param uuid 操作唯一标识符
	 * @return Base64编码的加密字符串
	 * 对加密信息类进行加密
	 */
	public static String encodeToString(UUID uuid) {
		//拼接字符串
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String appid = uuid.toString().replace("-", "") + "-" + format.format(new Date());
		//转化为Base64编码
		return Base64.getUrlEncoder().encodeToString(appid.getBytes());
	}
	
	/**
	 * @author huang
	 * @param appid 加密字符串
	 * @return
	 * 解密加密信息
	 */
	public static String[] decodeToStringArray(String appid) {
		appid = new String(Base64.getUrlDecoder().decode(appid));
		return appid.split("-");
	}
	
	/**
	 * @author huang
	 * @param args
	 * @throws InterruptedException
	 * @throws ParseException
	 * 用于测试
	 */
	public static void main(String[] args) throws InterruptedException, ParseException {
		System.out.println("----------------加密---------------");
		UUID uuid = UUID.randomUUID();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String appid = uuid.toString().replace("-", "") + "-" + format.format(new Date());
		System.out.println("appid=" + appid);
		byte[] by = appid.getBytes();
		for(int i=0;i<by.length;i++){
			by[i] = (byte) (by[i] ^ 9);
		}
		appid = new String(by);
		System.out.println("appid ^ 9 = " + appid);
		String ba = Base64.getUrlEncoder().encodeToString(appid.getBytes());
		System.out.println(ba);
		
		System.out.println("\n\n----------------解密--------------------------");
		String str = new String(Base64.getUrlDecoder().decode(ba));
		byte[] by2 = str.getBytes();
		System.out.println("by2.length = " + by2.length);
		for(int i=0; i<by2.length; i++) {
			by2[i] = (byte) (by2[i] ^ 9);
		}
		str = new String(by2);
		String[] s = str.split("-");
		System.out.println("appid=" + s[0]);
	}

}
