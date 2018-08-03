package cn.edu.lingnan.pojo.wechatpojo;

import cn.edu.lingnan.utils.WeChatMessageUtil;

public class TextMessage extends BaseMessage {
	
	private String Content;		//文本消息内容
	
	public TextMessage(){
		super.setMsgType(WeChatMessageUtil.TEXT_MESSAGE);
	}
	public TextMessage(String toUserName, String fromUserName){
		super.setFromUserName(fromUserName);
		super.setToUserName(toUserName);
		super.setMsgType(WeChatMessageUtil.TEXT_MESSAGE);
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		this.Content = content;
	}

}
