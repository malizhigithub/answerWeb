package cn.edu.lingnan.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/**
 * @author huang
 * 对微信发来的验证信息做验证
 */

public class SignUtil {

	private static String token = "yuanweixin";
	
	public static boolean checkSignature(String signature, String timestamp, String nonce) {
		String[] arr = new String[] {token, timestamp, nonce};
		Arrays.sort(arr);
		StringBuffer content = new StringBuffer();
		for (String str : arr) 
			content.append(str);
		MessageDigest md = null;
		String tmpStr = null;
		try {
			md = MessageDigest.getInstance("SHA-1");
			byte[] digest = md.digest(content.toString().getBytes());
			tmpStr = byteTostr(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		content = null;
		return tmpStr != null ? tmpStr.equals(signature.toUpperCase()) : false;
	}
	
	public static String byteTostr(byte[] byteArray) {
		String strDigest = "";
		for (int i=0; i<byteArray.length; i++)
			strDigest += byteToHexStr(byteArray[i]);
		return strDigest;
	}
	
	public static String byteToHexStr(byte mByte) {
		char[] Digit = {'0','1','2','3','4','5','6','7','8','9','A','B'
				,'C','D','E','F'};
		char[] tempArr = new char[2];
		tempArr[0] = Digit[(mByte >>> 4) & 0x0F];
		tempArr[1] = Digit[mByte & 0x0F];
		String s = new String(tempArr);
		return s;
	}
}
