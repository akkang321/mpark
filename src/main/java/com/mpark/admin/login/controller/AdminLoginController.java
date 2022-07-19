package com.mpark.admin.login.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.login.service.AdminLoginService;
import com.mpark.common.service.CommonService;
import com.mpark.common.util.SecurityUtil;
import com.mpark.common.util.StringUtil;

@Controller
public class AdminLoginController {

	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminLoginService adminLoginService;
	@Autowired
	CommonService commonService;

	@RequestMapping("/admin/login") 
	public String login() {
		return "/admin/login/login";
	}

	@RequestMapping("/admin/loginProcess")
	public ModelAndView loginProcess(@RequestParam Map<String, Object> param, HttpSession session, ModelAndView mv) throws Exception { 

		param.put("userPw", SecurityUtil.sha256(StringUtil.nvl(param.get("userPw")))); 
		Map<String, Object> userInfo = adminLoginService.selectAdminInfo(param);
		commonService.insertLog(param);

		if (userInfo != null) {
			String uId = StringUtil.nvl(param.get("uId"));
			int ticketCnt = commonService.userTicketCnt(uId); 
			userInfo.put("ticketCnt", ticketCnt);
			session.setAttribute("userInfo", userInfo);
			adminLoginService.updateLogin(StringUtil.nvl(userInfo.get("uId")));
			mv.setViewName("redirect:/admin/index");
		} else {
			mv.addObject("msg", "failure");
			mv.setViewName("redirect:/admin/login");
		}

		return mv;
	}

	@RequestMapping("/admin/logout") 
	public ModelAndView logout(HttpSession session, ModelAndView mv) throws Exception { 
		session.invalidate();
		mv = new ModelAndView("redirect:/admin/login"); 
		return mv;
	}

}


