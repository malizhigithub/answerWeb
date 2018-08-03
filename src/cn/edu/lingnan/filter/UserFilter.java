package cn.edu.lingnan.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author huang
 * 拦截未登录用户
 */
public class UserFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
//		HttpServletRequest req = (HttpServletRequest) arg0;
//		HttpServletResponse resp = (HttpServletResponse) arg1;
//		Object user = req.getSession().getAttribute("user");
//		Object wechatuser = req.getSession().getAttribute("weChatUser");
//		if(user == null && wechatuser == null)	
//			resp.sendRedirect(req.getContextPath() + "/login.jsp"); 
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
