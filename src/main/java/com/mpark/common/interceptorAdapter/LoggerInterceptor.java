package com.mpark.common.interceptorAdapter;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoggerInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(true);
		Map<String, String> userInfo = (Map<String, String>) session.getAttribute("userInfo");
		String url = request.getRequestURI();

		if (url.indexOf("admin") > -1) {			// 'admin' 문자열 없는 경우
			if (ObjectUtils.isEmpty(userInfo)) {
				response.sendRedirect("/admin/login");
				return false;
			} else {
				session.setMaxInactiveInterval(60 * 60);
				return true;
			}
		} else {
			if (ObjectUtils.isEmpty(userInfo)) {
				response.sendRedirect("/login");
				return false;
			} else {
				session.setMaxInactiveInterval(60 * 60);
				return true;
			}
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// TODO Auto-generated method stub
	}
}


