package com.mpark.admin.login.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.login.service.AdminLoginService;
import com.mpark.common.util.SecurityUtil;
import com.mpark.common.util.StringUtil;

@Controller
public class AdminLoginController {

	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminLoginService adminLoginService;

	@RequestMapping("/admin/login") 
	public String login() {
		return "/admin/login/login";
	}

	@RequestMapping("/admin/loginProcess")
	public ModelAndView loginProcess(@RequestParam Map<String, Object> param, HttpSession session, ModelAndView mv) throws Exception { 

		param.put("userPw", SecurityUtil.sha256(StringUtil.nvl(param.get("userPw")))); 
		Map<String, Object> userInfo = adminLoginService.selectAdminInfo(param);

		return mv;
	}

	@RequestMapping("/admin/logout") 
	public ModelAndView logout(HttpSession session, ModelAndView mv) throws Exception { 
		session.invalidate();
		mv = new ModelAndView("redirect:/admin/login"); 
		return mv;
	}

}


