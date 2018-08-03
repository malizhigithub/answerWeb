package cn.edu.lingnan.filter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CommonInterceptor implements HandlerInterceptor {

	private List<String> excludedUrls;
  
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		
		
		if (request.getSession().getAttribute("admins") == null) {
			String XRequested = request.getHeader("X-Requested-With");
			if ("XMLHttpRequest".equals(XRequested)) {
				response.getWriter().write("IsAjax");
			} else {
				response.sendRedirect("admin/login.jsp");
			}
			return false;
		}
		return true;
	}

}
