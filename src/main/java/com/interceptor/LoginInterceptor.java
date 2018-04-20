/**
 * 
 */
package com.interceptor;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.entity.UserEntity;

/**
 * @Description：<登陆拦截器 > 场景：判断用户是否登陆 登陆，则不拦截，没登陆，则转到登陆界面；
 */
public class LoginInterceptor implements HandlerInterceptor {
	Logger log = Logger.getLogger(LoginInterceptor.class);

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String requestURI = request.getRequestURI();
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity)session.getAttribute("username");
		if (user == null) {
			request.getRequestDispatcher("/user/toLogin").forward(request, response);
			return false;
		}	
		return true;		
	}
}