package cn.edu.lingnan.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.lingnan.pojo.Admins;
import cn.edu.lingnan.service.AdminsService;

@Controller
public class AdminController extends BaseController {

	@Autowired
	private AdminsService adminsService;
	
	/**
	 * 管理员登入
	 * @param admins
	 * @param map
	 * @author lizhi
	 */
	@RequestMapping("/adminLogin")
	public String adminLogin(Admins admins,Map<String,Object> map){
		if(adminsService.login(admins).size()<=0){
			map.put("loginError", "帐号或密码错误");
			return "/admin/login";
		}
		super.session.setAttribute("admins", adminsService.login(admins).get(0));
		return "redirect:/selectUserByExample";
	}
	
	/**
	 * 更新管理员资料（修改密码）
	 * @param admins
	 * @author lizhi
	 */
	@RequestMapping("/changeAdminPassword")
	public String changeAdminPassword(Admins admins){
		adminsService.updateSelective(admins);
		return "redirect:/selectUserByExample";
	}
	
	/**
	 * 注销
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(){
		session.invalidate();
		return "/admin/login";
	}
	
}
