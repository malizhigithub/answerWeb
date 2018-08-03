package cn.edu.lingnan.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.controller.WeChatController;
import cn.edu.lingnan.dao.RecordsMapper;
import cn.edu.lingnan.dao.WeChatUserMapper;
import cn.edu.lingnan.pojo.Records;
import cn.edu.lingnan.pojo.RecordsExample;
import cn.edu.lingnan.pojo.WeChatUser;
import cn.edu.lingnan.pojo.WeChatUserExample;
import cn.edu.lingnan.pojo.WeChatUserExample.Criteria;
import cn.edu.lingnan.pojo.wechatpojo.Article;
import cn.edu.lingnan.pojo.wechatpojo.NewsMessage;
import cn.edu.lingnan.pojo.wechatpojo.TextMessage;
import cn.edu.lingnan.utils.WeChatMessageUtil;

@Service
public class WeChatService {
	
	@Autowired
	private WeChatUserMapper weChatUserMapper;
	@Autowired
	private RecordsMapper recordsMapper;
	
	//解析用户发来的消息
	public String disposeMessage(HttpServletRequest req) {
		Map<String, String> map = WeChatMessageUtil.parseXml(req);
		String fromUserName = map.get("FromUserName"); 	//从什么用户发来
		String toUserName = map.get("ToUserName");	   	//给谁发送
		String msgType = map.get("MsgType");			//消息类型
		
		if (msgType.equals(WeChatMessageUtil.TEXT_MESSAGE)) {
			//消息是文本消息
			String content = map.get("Content");
			return parseText(content, fromUserName, toUserName);
		} else if(msgType.equals(WeChatMessageUtil.REQUEST_EVENT_MESSAGE)) {
			//消息是点击菜单事件
			String event = map.get("Event");
			if (event.equals("CLICK")) {
				String eventKey = map.get("EventKey");
				return clickEvent(eventKey, fromUserName, toUserName);
			} else {
				return "";
			}
		} else {
			//其他消息不处理
			return "";
		}
	}
	
	/**
	 * 解析用户发来的消息
	 * @param str
	 * @param toUserName
	 * @param fromUserName
	 * @return
	 */
	public String parseText(String str,String toUserName, String fromUserName) {
		if (str.equals("帮助")) {
			StringBuffer content = new StringBuffer();
			content.append("您好, 请回复下方文字选择功能: \n\n");
			content.append("答题/:B-)\n");
			content.append("回复帮助显示此菜单");
			//封装消息
			TextMessage textMessage = new TextMessage(toUserName, fromUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setContent(content.toString());
			return WeChatMessageUtil.textMessageToXml(textMessage);
		} else if (str.equals("答题")) {
			NewsMessage newsMessage = new NewsMessage(toUserName, fromUserName);
			newsMessage.setArticleCount(1);
			newsMessage.setCreateTime(new Date().getTime());
			
			Article article = new Article();
			article.setDescription("点击进入答题系统");
			article.setPicUrl("http://mmbiz.qpic.cn/mmbiz_jpg/3kesMWorbs7ZpPVv2YjdpSFNe6Z70dSDicAtHJiayT3icTmT3RkAmllficaxYibqbNm08sGPGw5WbmUa2Cvs0fn0GKw/0");
			article.setTitle("答题系统");
			article.setUrl(WeChatController.SERVER + "/AnswerWeb/wechat/authorize");
			
			List<Article> list = new ArrayList<Article>();
			list.add(article);
			
			newsMessage.setArticles(list);
			return WeChatMessageUtil.NewsMessageToXml(newsMessage);
		} else {
			TextMessage textMessage = new TextMessage(toUserName, fromUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setContent(str + "(接收什么返回什么，用于测试)");
			return WeChatMessageUtil.textMessageToXml(textMessage);
		}
	}
	
	/**
	 * @author huang
	 * @param eventKey
	 * @param toUserName
	 * @param fromUserName
	 * @return
	 * 公众号菜单的点击事件
	 */
	public String clickEvent(String eventKey, String toUserName, String fromUserName) {
		if (eventKey.equals("MyGame"))
			return parseText("答题", toUserName, fromUserName);
		else if (eventKey.equals("Menus"))
			return parseText("帮助", toUserName, fromUserName);
		else 
			return "";
	}
	
	/**
	 * @author huang
	 * 储存微信用户信息
	 */
	public void addWeChatUser(WeChatUser wechatuser) {
		if (wechatuser.getOpenid() != null)
			weChatUserMapper.insertSelective(wechatuser);
	}
	
	/**
	 * @author huang
	 * 判断有无微信用户存在
	 */
	public WeChatUser isExistsUser(WeChatUser wechatuser) {
		if(wechatuser.getOpenid() != null) {
			WeChatUserExample example = new WeChatUserExample();
			Criteria criteria = example.createCriteria();
			criteria.andOpenidEqualTo(wechatuser.getOpenid());
			List<WeChatUser> list = weChatUserMapper.selectByExample(example);
			if (list.size() > 0)
				return list.get(0);
			else 
				return null;
		}
		return null;
	}
	
	/**
	 * @author huang
	 * 获取微信用户答题记录
	 */
	public List<Records> getWeChatUserInfo(int wechatuserno) {
		RecordsExample recordsExample = new RecordsExample();
		cn.edu.lingnan.pojo.RecordsExample.Criteria criteria = recordsExample.createCriteria();
		criteria.andWechatusernoEqualTo(wechatuserno);
		return recordsMapper.selectByExample(recordsExample);
	}

	public void updateWeChatUser(WeChatUser weChatUser) {
		weChatUserMapper.updateByPrimaryKeySelective(weChatUser);
	}
	
	/**
	 * 根据id获取微信用户
	 * @param wechatuserno
	 * @return
	 */
	public WeChatUser getWechatUser(Integer wechatuserno){
		return weChatUserMapper.selectByPrimaryKey(wechatuserno);
	}
	
	
}
