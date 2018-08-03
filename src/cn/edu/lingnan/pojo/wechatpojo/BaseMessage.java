package cn.edu.lingnan.pojo.wechatpojo;

public class BaseMessage {

	private String ToUserName;		//给谁发送
	private String FromUserName;	//从哪里发送
	private long CreateTime;	//消息创建时间
	private String MsgType;		//消息类型
	
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		this.ToUserName = toUserName;
	}
	public String getFromUserName() {
		return FromUserName;
	}
	public void setFromUserName(String fromUserName) {
		this.FromUserName = fromUserName;
	}
	public long getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(long createTime) {
		this.CreateTime = createTime;
	}
	public String getMsgType() {
		return MsgType;
	}
	public void setMsgType(String msgType) {
		this.MsgType = msgType;
	}
	
}
