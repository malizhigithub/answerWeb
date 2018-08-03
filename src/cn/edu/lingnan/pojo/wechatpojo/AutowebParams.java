package cn.edu.lingnan.pojo.wechatpojo;

/**
 * 
 * @author huang
 * 获取微信用户的access_token
 */

public class AutowebParams {
	
	private String access_token;
	private String expires_in;	//使用时间
	private String refresh_token;	//刷新access_token的id
	private String openid;			//用户唯一标识
	private String scope;			//授权作用域
	
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(String expires_in) {
		this.expires_in = expires_in;
	}
	public String getRefresh_token() {
		return refresh_token;
	}
	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	
	

}
