package com.mpark.admin.login.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.login.service.AdminLoginService;
import com.mpark.common.util.StringUtil;

@Controller
public class AdminLoginController {

	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminLoginService adminLoginService;

	@RequestMapping("/admin/login") 
	public String login(HttpServletRequest request) {
		
		return "/admin/login/login";
	}

	@RequestMapping("/admin/loginProcess")
	public ModelAndView loginProcess(@RequestParam Map<String, Object> param, HttpServletRequest request,ModelAndView mv) throws Exception { 
		HttpSession session = request.getSession();
		session.setAttribute("token", param.get("token"));
		mv.setViewName("redirect:/admin/index");
		return mv;
	}

	@RequestMapping("/admin/logout") 
	public ModelAndView logout(HttpSession session, ModelAndView mv) throws Exception { 
		session.invalidate();
		mv = new ModelAndView("redirect:/admin/login"); 
		return mv;
	}
	
	@RequestMapping("/admin/test") 
	public String test(HttpServletRequest request, HttpSession session,ModelAndView mv) {
		
		String token = StringUtil.nvl(session.getAttribute("token"));
		mv.addObject("token",token);
		
		return "/admin/login/test";
	}

}


