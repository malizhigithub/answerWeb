package cn.edu.lingnan.pojo.wechatpojo;

import java.util.List;

import cn.edu.lingnan.utils.WeChatMessageUtil;


public class NewsMessage extends BaseMessage {

	private int ArticleCount;	//图文消息数量
	private List<Article> Articles;	//图文消息
	
	public NewsMessage(){
		super.setMsgType(WeChatMessageUtil.RESPONR_NEWS_MESSAGE);
	}
	public NewsMessage(String toUserName, String fromUserName) {
		super.setFromUserName(fromUserName);
		super.setToUserName(toUserName);
		super.setMsgType(WeChatMessageUtil.RESPONR_NEWS_MESSAGE);
	}
	
	public int getArticleCount() {
		return ArticleCount;
	}
	public void setArticleCount(int articleCount) {
		this.ArticleCount = articleCount;
	}
	public List<Article> getArticles() {
		return Articles;
	}
	public void setArticles(List<Article> articles) {
		this.Articles = articles;
	}
	
}
