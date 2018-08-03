package cn.edu.lingnan.pojo.wechatpojo;

public class Article {

	private String Title;	//标题
	private String Description;	//描述
	private String PicUrl;	//图片链接
	private String Url;		//点击后跳转链接
	
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		this.Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		this.Description = description;
	}
	public String getPicUrl() {
		return PicUrl;
	}
	public void setPicUrl(String picUrl) {
		this.PicUrl = picUrl;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		this.Url = url;
	}
	
}
