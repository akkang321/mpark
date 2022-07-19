package com.mpark.admin.user.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.user.service.AdminAdminService;
import com.mpark.common.service.CodeService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.SecurityUtil;
import com.mpark.common.util.StringUtil;


@Controller
@SessionAttributes("userInfo") 
public class AdminAdminController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	AdminAdminService adminAdminService;
	
	@RequestMapping(value = { "/admin/adminList" })
	public ModelAndView adminList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		List<Map<String, Object>> adminList = adminAdminService.adminList(param);
		mv.addObject("adminList", adminList);
		mv.setViewName("/admin/user/admin/adminList");
		return mv;
	}
	
	@RequestMapping(value = { "/admin/adminInfo" })
	public ModelAndView adminInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		Map<String, Object> adminInfo = adminAdminService.adminInfo(param);
		mv.addObject("adminInfo", adminInfo);
		mv.setViewName("/admin/user/admin/adminInfo");
		return mv;
	}
	
	@RequestMapping(value = { "/admin/adminInsert" })
	@ResponseBody
	public int adminInsert(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo, ModelAndView mv) throws Exception { 
		String U_ID = StringUtil.nvl(userInfo.get("U_ID")); 
		param.put("U_ID", U_ID); 
		int result = adminAdminService.checkAdminId(param);
		if (result==0) {
			String adminPw = StringUtil.nvl(param.get("adminPw"));
			param.put("adminPw", (SecurityUtil.sha256(StringUtil.nvl(adminPw))));
			return adminAdminService.adminInsert(param);
		} else {
			return 99;
		}
	}
	
	@RequestMapping(value = { "/admin/adminUpdate" })
	@ResponseBody
	public int adminUpdate(@RequestParam Map<String, Object> param) throws Exception {
		String userPw = StringUtil.nvl(param.get("userPw"));
		if(userPw != "") {
			param.put("userPw", (SecurityUtil.sha256(StringUtil.nvl(userPw))));
		}
		
		return adminAdminService.adminUpdate(param);
	}
	
	
	@RequestMapping(value = { "/admin/adminDelete" })
	@ResponseBody
	public int adminDelete(@RequestParam Map<String, Object> param) throws Exception {
		return adminAdminService.adminDelete(param);
	}
}

