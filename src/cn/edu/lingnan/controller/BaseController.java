package cn.edu.lingnan.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class BaseController {
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	protected RedirectAttributes redirectAttributes;
	protected ServletContext application;
	
	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes ) {
		this.request = request;
		this.response = response;
		this.redirectAttributes = redirectAttributes;
		this.session = request.getSession();
		this.application = this.session.getServletContext();
	}

}
