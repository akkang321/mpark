package com.mpark.admin.user.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.user.service.AdminUserService;
import com.mpark.common.service.CodeService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.SecurityUtil;
import com.mpark.common.util.StringUtil;

@Controller
public class AdminUserController { 

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminUserService adminUserService;

	@Autowired
	CodeService codeService;

	@RequestMapping(value = {"/admin/userList", "/admin/index","/admin" })
	public ModelAndView userList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		
		List<Map<String, Object>> userStateList = codeService.getCode("C020000");
		mv.addObject("userStateList", userStateList);
		
		int tCnt = adminUserService.userCnt(param);
		PageUtil page = new PageUtil();
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1")));
		page.setPageSize(20);
		page.setTotalCount(tCnt);
		param.put("S_CNT", page.getsCnt());
		param.put("E_CNT", page.getPageSize());
		
		List<Map<String, Object>> memberList = adminUserService.userList(param); 
		mv.addObject("userList", memberList); 
		mv.addObject("page", page); 
		mv.setViewName("/admin/user/user/userList"); 
		return mv;
	}
	
	@RequestMapping(value = "/admin/userInfo")
	public ModelAndView userInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		
		List<Map<String, Object>> userStateList = codeService.getCode("C020000");
		List<Map<String, Object>> genderList = codeService.getCode("C030000");
		mv.addObject("genderList", genderList);
		mv.addObject("userStateList", userStateList);
		
		Map<String, Object> userInfo = adminUserService.userInfo(param); 

		mv.addObject("userInfo", userInfo);
		mv.setViewName("/admin/user/user/userInfo"); 
		return mv;
	}
	
	@RequestMapping(value = "/admin/userUpdate")
	@ResponseBody
	public int userUpdate(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception {
		return adminUserService.userUpdate(param);
	}

	@RequestMapping(value = "/admin/userDelete")
	@ResponseBody
	public int userDelete(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception {
		return adminUserService.userDelete(param);
	}
	
	
	@RequestMapping(value = "/admin/userPwInit")
	@ResponseBody
	public int userPwInit(@RequestParam Map<String, Object> param) throws Exception {
		String pwInit = SecurityUtil.sha256(StringUtil.nvl(1234));
		param.put("pwInit", pwInit);
		return adminUserService.userPwInit(param);
	}

}


