package com.mpark.admin.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.common.util.StringUtil;

@Controller
public class AdminLoginController {

	@RequestMapping("/admin/login") 
	public String login(HttpServletRequest request) {
		
		return "/admin/login/login";
	}

	@RequestMapping("/admin/loginProcess")
	public ModelAndView loginProcess(@RequestParam Map<String, Object> param, HttpServletRequest request,ModelAndView mv) throws Exception { 
		HttpSession session = request.getSession();
		session.setAttribute("token", param.get("token"));
		session.setAttribute("googleEmail", param.get("googleEmail"));
		
		String googleEmail = StringUtil.nvl(session.getAttribute("googleEmail"));
		if (googleEmail.equals("dbdirect@mrpark1.com")) {
			mv.setViewName("redirect:/admin/getDBManagement");
		} else {
			mv.setViewName("redirect:/admin/index");
		}
		return mv;
	}

	@RequestMapping("/admin/logout") 
	public ModelAndView logout(HttpSession session, ModelAndView mv) throws Exception { 
		session.invalidate();
		mv.addObject("isLogin", "Y");
		
		mv = new ModelAndView("redirect:/admin/login"); 
		return mv;
	}
}