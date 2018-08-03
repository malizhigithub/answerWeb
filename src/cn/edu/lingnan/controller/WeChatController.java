package cn.edu.lingnan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sun.mail.util.QEncoderStream;

import cn.edu.lingnan.pojo.wechatpojo.AutowebParams;
import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.pojo.Records;
import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.pojo.WeChatUser;
import cn.edu.lingnan.service.QuestionTypeService;
import cn.edu.lingnan.service.WeChatService;
import cn.edu.lingnan.utils.HttpUtil;
import cn.edu.lingnan.utils.SignUtil;

/**
 * 
 * @author huang
 * 与微信交互的Controller
 */
@Controller
public class WeChatController extends BaseController {
	
	@Autowired
	private WeChatService weChatService;
	@Autowired
	private QuestionTypeService questionTypeservice;
	
	public static final String SERVER = "http://chongyuann.duapp.com";
	
	/**
	 * @author huang
	 * @param req
	 * @param resp
	 * @throws IOException
	 * 用于绑定微信公众号
	 */
	@RequestMapping(value="wechat/core", method=RequestMethod.GET)
	public void bindingWeChatGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String signature = req.getParameter("signature");
		String timestamp = req.getParameter("timestamp");
		String nonce = req.getParameter("nonce");
		String echostr = req.getParameter("echostr");
		PrintWriter out = resp.getWriter();
		if(SignUtil.checkSignature(signature, timestamp, nonce))
			out.print(echostr);
		out.close();
		out = null;
	}
	
	/**
	 * @author huang
	 * @param req
	 * @param resp
	 * @throws IOException
	 * 用于绑定后用户与公众号的交互
	 */
	@RequestMapping(value="wechat/core", method=RequestMethod.POST)
	public void bindingWeChatPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String s = new WeChatService().disposeMessage(req);
		PrintWriter out = resp.getWriter();
		out.print(s);
		out.close();
		out = null;
	}
	
	/**
	 * @author huang
	 * 用户打开网页,对公众号授权获取用户的信息
	 * @throws IOException 
	 */
	@RequestMapping(value="wechat/authorize")
	public void userAuthorization(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//生成手动授权链接
		String authorizeUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?";	//固定链接
		String appid = "appid=wx25c5b6d09bcd8685&"; 	//公众号id
		String redirect_uri = "redirect_uri="+ SERVER +"/AnswerWeb/wechat/getuserinfo&";	//授权后跳转的链接
		String response_type = "response_type=code&";	//固定参数
		String scope_userinfo = "scope=snsapi_userinfo&";	//手动授权
		String scope_base = "scope=snsapi_base&";	//静默授权
		String state = "state=STATE&connect_redirect=1";	//重定向携带的参数, connect_redirect处理安卓获取会重复获取
		String footuri = "#wechat_redirect";	//固定参数
		authorizeUrl = authorizeUrl+appid+redirect_uri+response_type+scope_userinfo+state+footuri;
		//向用户发送授权链接
		resp.sendRedirect(authorizeUrl);
	}
	
	/**
	 * @author huang
	 * 用户同意授权后获取用户的信息
	 * @throws IOException 
	 */
	@RequestMapping(value="wechat/getuserinfo", method=RequestMethod.GET)
	public String getUserInfo(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String code = req.getParameter("code");
		if(code != null) {
			//获取access_token和openid
			String tokenUri = "https://api.weixin.qq.com/sns/oauth2/access_token?";	//固定链接
			String appid = "appid=wx25c5b6d09bcd8685&";		//公众号id
			String secret = "secret=e8893cf8175a33631f1c9bbd8ee3957c&";
			code = "code=" + code + "&grant_type=authorization_code";
			tokenUri = tokenUri + appid + secret + code;
			String json = HttpUtil.getReturnJson(tokenUri, null);
			AutowebParams autoWebParams = new AutowebParams();
			Gson gson = new Gson();
			autoWebParams = gson.fromJson(json, new AutowebParams().getClass());
			//获取用户信息
			String userinfouri = "https://api.weixin.qq.com/sns/userinfo?"
					+ "access_token=" + autoWebParams.getAccess_token() 
					+ "&openid="+ autoWebParams.getOpenid()+ "&lang=zh_CN";
			String json2 = HttpUtil.getReturnJson(userinfouri, null);
			WeChatUser wechatUser = gson.fromJson(json2, new WeChatUser().getClass());
			//将信息存储进数据库
			WeChatUser user = weChatService.isExistsUser(wechatUser);
			if (user == null) {
				weChatService.addWeChatUser(wechatUser);
				wechatUser = weChatService.isExistsUser(wechatUser);
			}
			else
				wechatUser = user;
			System.out.println(wechatUser);
			if (wechatUser != null && wechatUser.getWechatuserno() != null && !wechatUser.getOpenid().trim().equals(""))
				super.session.setAttribute("weChatUser", wechatUser);
			return "wechatuser/index";
		}
		return "error";
	}
	
	/**
	 * @author huang
	 * @return
	 * 微信端获取用户信息
	 */
	@ResponseBody
	@RequestMapping(value="user/findWeChatUserInfo")
	public Map<String, Object> findWebUserInfo() {
		Map<String, Object> map = new HashMap<String, Object>();
		WeChatUser weuser =  (WeChatUser) super.session.getAttribute("weChatUser");
		//封装用户信息和用户的答题记录
		map.put("wechatuser", weuser);
		List<Records> recordsList = weChatService.getWeChatUserInfo(weuser.getWechatuserno());
		if (recordsList.size() > 0) {
			for (Records r : recordsList)
				r.setTypename(questionTypeservice.getQuestionTypeByPrimaryKey(r.getTypeno()).getTypename());
		}
		map.put("recordsList", recordsList);
		return map;
	}
	
	/**
	 * 更新微信用户
	 * @param wechatuserno
	 * @param nickname
	 * @param sex
	 * @param address
	 * @author 马立志
	 */
	@ResponseBody
	@RequestMapping("/updateWechatUser")
	public WeChatUser updateWechatUser(@RequestParam("wechatuserno") Integer wechatuserno, @RequestParam(value="nickname" ,required=false)String nickname,String sex,String province,String city,String country){
		
		WeChatUser weChatUser = weChatService.getWechatUser(wechatuserno);
		weChatUser.setSex(sex);
		weChatUser.setNickname(nickname);
		weChatUser.setProvince(province);
		weChatUser.setCity(city);
		weChatUser.setCountry(country);
		
		/*//分解地址
		List<String> update_addrs = new ArrayList<String>();
		String[] str_addrs = address.split(" ");
		for(String addr:str_addrs){
			update_addrs.add(addr);
		}
		
		//有些地方没有city，直接到区
		if(update_addrs.size() == 2){
			weChatUser.setProvince(update_addrs.get(0));
			weChatUser.setCountry(update_addrs.get(1));
		}else if(update_addrs.size() == 3){
			weChatUser.setProvince(update_addrs.get(0));
			weChatUser.setCity(update_addrs.get(1));
			weChatUser.setCountry(update_addrs.get(2));
		}else if(update_addrs.size() == 1){
			weChatUser.setProvince(update_addrs.get(0));
		}*/
		weChatService.updateWeChatUser(weChatUser);
		return weChatService.getWechatUser(wechatuserno);
	}
	
}
