package cn.edu.lingnan.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

import cn.edu.lingnan.pojo.wechatpojo.Article;
import cn.edu.lingnan.pojo.wechatpojo.NewsMessage;
import cn.edu.lingnan.pojo.wechatpojo.TextMessage;

public class WeChatMessageUtil {
	
	public static final String TEXT_MESSAGE = "text";		//文本消息
	public static final String IMAGE_MESSAGE = "image";		//图片消息
	public static final String VOICE_MESSAGE = "voice";		//语音消息
	public static final String VIDEO_MESSAGE = "video";		//视频消息
	public static final String REQUEST_SHORTVIDEO_MESSAGE = "shortvideo";	//用户发送的小视频消息	
	public static final String REQUEST_LOCATION_MESSAGE = "location";		//地理位置消息
	public static final String REQUEST_LINK_MESSAGE = "link";				//用户发送的链接消息
	public static final String RESPONE_MUSIC_MESSAGE = "music";				//服务器返回的音乐消息
	public static final String RESPONR_NEWS_MESSAGE = "news";				//服务器返回的图文消息
	public static final String REQUEST_EVENT_MESSAGE = "event";				//用户在公众号触发的事件
	
	/**
	 * @author huang
	 * 用于解决xstream不支持CDATH块模式
	 */
	private static XStream xstream = new XStream( new XppDriver(){
		@Override
		public HierarchicalStreamWriter createWriter(Writer out) {
			return new PrettyPrintWriter(out) {
				boolean cdata = true;
				
				public void startNode(String name, Class clazz) {
					super.startNode(name, clazz);
				}
				
				protected void writeText(QuickWriter writer, String text) {
					if(cdata) {
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					} else {
						writer.write(text);
					}
				}
			};
		}
	});
	
	/**
	 * @author huang
	 * @param req
	 * 解析微信发送的xml信息
	 */
	public static Map<String, String> parseXml(HttpServletRequest req) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			InputStream inputStream = req.getInputStream();
			SAXReader reader = new SAXReader();
			Document document = reader.read(inputStream);
			Element root = document.getRootElement();
			List<Element> list = root.elements();
			for(Element e : list) 
				map.put(e.getName(), e.getText());
			inputStream.close();
			inputStream = null;
		} catch (IOException | DocumentException e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * @author huang
	 * @param textMessage
	 * 将文本消息封装为xml返回给微信
	 */
	public static String textMessageToXml(TextMessage textMessage) {
		xstream.alias("xml", textMessage.getClass());
		return xstream.toXML(textMessage);
	}
	
	/**
	 * @author huang
	 * @param newsMessage
	 * 将图文消息封装为xml返回给微信
	 */
	public static String NewsMessageToXml(NewsMessage newsMessage) {
		xstream.alias("xml", newsMessage.getClass());
		xstream.alias("item", new Article().getClass());
		return xstream.toXML(newsMessage);
	}
}
