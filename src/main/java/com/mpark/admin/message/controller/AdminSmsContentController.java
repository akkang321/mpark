package com.mpark.admin.message.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession; 

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

import com.mpark.admin.login.service.AdminLoginService;
import com.mpark.admin.message.service.AdminSmsContentService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.SecurityUtil;
import com.mpark.common.util.StringUtil;

@Controller
@SessionAttributes("userInfo")
public class AdminSmsContentController { 

	Logger log = LoggerFactory.getLogger(this.getClass()); 

	@Autowired
	AdminSmsContentService adminSmsContentService; 

	@RequestMapping(value = {"/admin/messageSmsContentList"}) 
	public ModelAndView adminSmsContentList(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo, ModelAndView mv) throws Exception { 

		int smsCnt = adminSmsContentService.smsContentCnt(); 
		PageUtil page = new PageUtil(); 
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1"))); 
		page.setPageSize(20); 
		page.setTotalCount(smsCnt); 
		param.put("S_CNT", page.getsCnt()); 
		param.put("E_CNT", page.getPageSize()); 
		mv.addObject("page", page); 

		List<Map<String, Object>> adminSmsContentList = adminSmsContentService.adminSmsContentList(param); 
		mv.addObject("adminSmsContentList", adminSmsContentList); 
		mv.setViewName("/admin/message/smsContentList"); 
		return mv; 
	} 

	@RequestMapping(value = {"/admin/messageSmsContentInfo"}) 
	public ModelAndView smsContentInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		Map<String, Object> smsContentInfo = adminSmsContentService.smsContentInfo(param); 

		mv.addObject("smsContentInfo", smsContentInfo); 
		mv.setViewName("/admin/message/smsContentInfo"); 

		return mv; 
	}

	@RequestMapping(value = {"/admin/messageSmsContentInsert"}) 
	@ResponseBody
	public int smsContentInsert(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception { 
		String uId = StringUtil.nvl(userInfo.get("U_ID"));
		param.put("uId", uId);
		int result = adminSmsContentService.smsContentInsert(param); 

		return result;
	}

	@RequestMapping(value = {"/admin/messageSmsContentUpdate"}) 
	@ResponseBody
	public int smsContentUpdate(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception { 
		String uId = StringUtil.nvl(userInfo.get("U_ID"));
		param.put("uId", uId); 
		int result = adminSmsContentService.smsContentUpdate(param); 

		return result; 
	}
	
	@RequestMapping(value = {"/admin/messageSmsDelete"})
	@ResponseBody
	public int smsDelete(@RequestParam Map<String, Object> param) throws Exception {
		return adminSmsContentService.smsDelete(param);
	}

} 


