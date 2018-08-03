package cn.edu.lingnan.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.lingnan.pojo.Records;
import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.pojo.UserExample;
import cn.edu.lingnan.service.QuestionTypeService;
import cn.edu.lingnan.service.UserService;
import cn.edu.lingnan.utils.MailUtil;
import cn.edu.lingnan.utils.TransmisstionProtected;

@Controller
public class UserController extends BaseController {

	@Autowired
	private UserService userService;
	@Autowired
	private QuestionTypeService questionTypeservice;

	/**
	 * @author huang
	 * @param user 用户提交的邮箱和密码
	 * @param model	页面交互返回值
	 * @return
	 */
	@RequestMapping(value = "login")
	public String login(User user, ModelMap model) {
		if(super.session.getAttribute("user") != null)
			return "user/index";
		List<User> userlist = userService.login(user);
		// 不存在用户
		if (userlist.size() <= 0) {
			model.put("loginerror", "用户名或密码错误，请重新输入");
			return "login";
		}
		// 存在用户，判断是否通过验证
		user = userlist.get(0);
		if (user.getStatus() == 0) {
			model.put("loginerror", "账号没通过验证，已重新发送验证邮件");
			//创建唯一标识符
			UUID uuid = UUID.randomUUID();
			String str = user.getUserno() + "/confirmEmail";
			super.application.setAttribute(uuid.toString().replace("-", ""), str);
			str = TransmisstionProtected.encodeToString(uuid);
			String html = "<html><head>"
					+ "<a href='" + WeChatController.SERVER +"/AnswerWeb/email/"+ str + "' >"
					+ "点击验证邮箱，5分钟内有效</a>"
					+ "</head></html>";
			MailUtil.sendValidatorMail(user.getEmail(), html);
			return "login";
		}
		// 通过验证
		super.session.setAttribute("user", user);
		// 跳转到选择类型页面
		return "user/index";
	}
	
	/**
	 * @author huang
	 * 用户注销
	 */
	@RequestMapping(value="user/sigeout")
	public String signout() {
		if (super.session.getAttribute("user") != null)
			super.session.removeAttribute("user");
		return "login";
	}
	
	/**
	 * @author huang
	 * @param user
	 * @param result
	 * @param map
	 * 用户注册
	 */
	@RequestMapping(value = "register")
	public String register(@Valid User user, BindingResult result, Map<String, Object> map) {
		//判断输入是否合法
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			String error = "输入不合法";
			for (ObjectError e : list) {
				error += e.getDefaultMessage() + "<br/>";
			}
			map.put("error", error);
			return "register";
		}
		//判断用户是否存在
		User user1 = userService.findUserByEmail(user.getEmail());
		if(user1 != null) {
			map.put("error", "该邮箱已注册");
			return "register";
		}
		// 注册用户
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		user.setNewdate(format.format(new Date()));
		int flag = userService.register(user);
		if (flag > 0) {
			user1 = userService.findUserByEmail(user.getEmail());
			//创建唯一标识符
			UUID uuid = UUID.randomUUID();
			String str = user1.getUserno() + "/confirmEmail";
			super.application.setAttribute(uuid.toString().replace("-", ""), str);
			str = TransmisstionProtected.encodeToString(uuid);
			String html = "<html><head>"
					+ "<a href='" + WeChatController.SERVER +"/AnswerWeb/email/"+ str + "' >"
					+ "点击验证邮箱，5分钟内有效</a>"
					+ "</head></html>";
			MailUtil.sendValidatorMail(user.getEmail(), html);
			map.put("success", "验证邮件成功发送，请前往注册邮箱进行验证");
			return "success";
		} 
		return "register";
	}

	/**
	 * @author huang
	 * @param userno 用户编号
	 * 邮箱验证成功
	 */
	@RequestMapping(value="/{userno}/confirmEmail")
	public ModelAndView confirmValidatorEmail(@PathVariable int userno) {
		int flag = userService.confirmValidator(userno);
		ModelAndView model = new ModelAndView();
		if (flag > 0) {
			model.addObject("success","邮箱验证成功");
			model.setViewName("success");
		}
		else {
			model.setViewName("error");
			model.addObject("error", "发生未知错误，邮箱验证失败，请重新尝试");
		}
		return model;
	}
	
	/**
	 * @author huang
	 * @param email 用户注册的邮箱
	 * 找回密码
	 */
	@RequestMapping(value="findpassword", method=RequestMethod.POST)
	public ModelAndView findMyPassword(String email) {
		ModelAndView model = new ModelAndView();
		User user = userService.findUserByEmail(email);
		model.setViewName("forgetPsw");
		if (user == null) {
			model.addObject("error", "该邮箱还没有注册");
		} else {
			MailUtil.sendFindPasswordMail(email, user.getPassword());
			model.addObject("success", "找回密码邮件已发送");
		}
		return model; 
	}
	
	/**
	 * @author huang
	 * @return
	 * web用户获取自己的信息
	 */
	@ResponseBody
	@RequestMapping(value="user/findWebUserInfo")
	public Map<String, Object> findWebUserInfo() {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) super.session.getAttribute("user");
		//封装用户信息和用户的答题记录
		map.put("user", user);
		List<Records> recordsList = userService.getWebUserInfo(user.getUserno());
		if (recordsList.size() > 0) {
			for (Records r : recordsList)
				r.setTypename(questionTypeservice.getQuestionTypeByPrimaryKey(r.getTypeno()).getTypename());
		}
		map.put("recordsList", recordsList);
		return map;
	}
	
	/**
	 * @author huang
	 * @param encodeData
	 * @param map
	 * @return
	 * 验证邮件是否有效
	 */
	@RequestMapping(value="email/{encodeData}")
	public String redirectEmail(@PathVariable String encodeData, Map<String, Object> map) {
		String[] datas = TransmisstionProtected.decodeToStringArray(encodeData);
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		long nowdate = Long.parseLong(format.format(new Date()).toString());
		long latedate = Long.parseLong(datas[1]);
		String url = (String) super.application.getAttribute(datas[0]);
		if (nowdate-latedate > 500 || url == null) {
			//链接失效
			super.application.removeAttribute(datas[0]);
			map.put("error", "链接已失效");
			return "error";
		} else {
			super.application.removeAttribute(datas[0]);
			return "redirect:/" + url;
		}
	}
	
	/**
	 * @author huang
	 * @param oldpsw
	 * @param newpsw
	 * @return
	 * 修改用户密码
	 */
	@ResponseBody
	@RequestMapping(value="user/updatepassword")
	public Map<String, Object> updatePassword(String oldpsw, String newpsw) {
		User user = (User) super.session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		if (!oldpsw.equals(user.getPassword()))
			//原密码不正确
			map.put("error", "原密码不正确");
		else {
			User user1 = new User();
			user1.setUserno(user.getUserno());
			user1.setPassword(newpsw);
			userService.updateUser(user1);
			map.put("success", true);
			user.setPassword(newpsw);
			super.session.setAttribute("user", user);
		}
		return map;
	}
	
	/**
	 * @author huang
	 * @param user
	 * @return
	 * 修改用户信息
	 */
	@ResponseBody
	@RequestMapping(value="user/updateinfo")
	public Map<String, Object> updateInfo(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user1 = (User) super.session.getAttribute("user");
		user.setUserno(user1.getUserno());
		//邮箱不同发送验证邮件修改邮箱
		if (!user1.getEmail().equals(user.getEmail())) {
			map.put("updateEmail", "1");
			UUID uuid = UUID.randomUUID();
			String str = user.getUserno() + "/updateEmail/" + user.getEmail();
			super.application.setAttribute(uuid.toString().replace("-", ""), str);
			str = TransmisstionProtected.encodeToString(uuid);
			String html = "<html><head>"
					+ "<p>您正在进行修改邮箱操作</p>"
					+ "<a href='" + WeChatController.SERVER +"/AnswerWeb/email/"+ str + "' >"
					+ "点击确认修改邮箱，5分钟内有效</a>"
					+ "</head></html>";
			MailUtil.sendValidatorMail(user.getEmail(), html);
		}
		user.setEmail(null);
		userService.updateUser(user);
		super.session.setAttribute("user",userService.getUserByUserno(user.getUserno()));
		map.put("message", "修改成功");
		return map;
	}
	
	/**
	 * @author huang
	 * @param userno 用户编号
	 * @param email 修改邮箱
	 * @return
	 * 修改用户邮箱
	 */
	@RequestMapping(value="{userno}/updateEmail/{email}")
	public ModelAndView updateEmail(@PathVariable int userno, @PathVariable String email){
		ModelAndView model = new ModelAndView();
		User user = new User();
		user.setUserno(userno);
		user.setEmail(email+".com");
		userService.updateUser(user);
		user = userService.getUserByUserno(userno);
		super.session.setAttribute("user", user);
		model.setViewName("redirect:/login");
		return model;
	}
	
	
	
	/************************对用户进行管理************************************************/
	/**
	 * 多条件查询用户
	 * @param map
	 * @param user
	 * @return
	 * @author lizhi
	 */
	@RequestMapping("/selectUserByExample")
	public String selectUserByExample(Map<String, Object> map, User user,@RequestParam(value="pn",defaultValue="1")Integer pn) {
		//每页显示八条数据，且当前页是参数pn
		PageHelper.startPage(pn,6);
		List<User> userList = userService.selectUserByExample(user);
		// 对数据进行分页处理
		PageInfo pageInfo = new PageInfo(userList);
		map.put("userListPageInfo", pageInfo);
		// 到时候前端写出网页后再修改到具体的页面
		return "/admin/userList";
	}

	/**
	 * 可批量根据id删除用户
	 * @param ids
	 * @return
	 * @author lizhi
	 */
	@RequestMapping(value="/deleteUser")
	public String deleteUser(@RequestParam("ids") String ids,@RequestParam(value="pn") Integer pn,RedirectAttributes redirectAttributes) {
		//前端ajax封装数据时，用"-"分割
		if(ids.contains("-")){
			//批量删除
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for(String id:str_ids){
				del_ids.add(Integer.parseInt(id));
			}
			userService.deleteBatch(del_ids);
		}else{
			//单个删除
			Integer id = Integer.parseInt(ids);
			userService.deleteUser(id);
		}
		redirectAttributes.addAttribute("pn", pn);
		return "redirect:/selectUserByExample";
	}

	/**
	 * 注册用户
	 * @param user
	 * @return
	 * @author lizhi
	 */
	@RequestMapping("/addUser")
	public String addUser(User user) {
		//重定向到注册页面
		return "redirect:user/register";
	}

	/**
	 * 更新用户 第一步，获取对象跳到更新页面
	 * @param user
	 * @return
	 * @author lizhi
	 */
	@RequestMapping("/updateUserFirst")
	public String updateUserFirst(@RequestParam("userno") Integer userno,Map<String,Object> map,@RequestParam("pn")Integer pn) {
		map.put("user",userService.getUserByUserno(userno));
		map.put("pn", pn);
		return "/admin/updateUser";
	}
	
	
	/**
	 * 更新用户 第二步，更新对象
	 * @param user
	 * @return
	 * @author lizhi
	 */
	@RequestMapping("/updateUserSecond")
	public String updateUserSecond(User user,@RequestParam("pn")Integer pn) {
		userService.updateUser(user);
		super.redirectAttributes.addAttribute("pn", pn);
		return "redirect:selectUserByExample";
	}

	/**
	 * 检查是否邮箱重复
	 * @return
	 */
	@RequestMapping("/validEmail")
	@ResponseBody
	public boolean validEmail(String email){
		User user = new User();
		user.setEmail(email);
		//如果不存在此邮箱，返回true
		if(userService.selectUserByExample(user).size()==0){
			return true;
		}
		return false;
	}
	
	
}
