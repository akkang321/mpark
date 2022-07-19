package com.mpark.admin.message.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.message.service.AdminSmsSendService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.StringUtil;

@Controller
@SessionAttributes("userInfo")
public class AdminSmsSendController { 

	Logger log = LoggerFactory.getLogger(this.getClass()); 

	@Autowired
	AdminSmsSendService adminSmsSendService; 

	@RequestMapping(value = {"/admin/messageSmsSendList"}) 
	public ModelAndView smsSendList(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo, ModelAndView mv) throws Exception { 

		int tCnt = adminSmsSendService.smsSendListCnt(param);
		PageUtil page = new PageUtil(); 
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1"))); 
		page.setPageSize(20); 
		page.setTotalCount(tCnt); 
		param.put("S_CNT", page.getsCnt()); 
		param.put("E_CNT", page.getPageSize()); 
		mv.addObject("page", page); 

		List<Map<String, Object>> smsSendList = adminSmsSendService.smsSendList(param);
		mv.addObject("smsSendList", smsSendList); 
		mv.setViewName("/admin/message/smsSendList"); 
		return mv; 
	} 

	
} 


