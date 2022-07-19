package com.mpark.admin.bbs.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.bbs.service.AdminBbsNoticeService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.StringUtil;

@Controller
@SessionAttributes("userInfo")
public class AdminBbsNoticeController { 

	@Autowired
	AdminBbsNoticeService adminBbsNoticeService; 
	
	@RequestMapping("/admin/bbsNotice/form") 
	public String bbsNoticeForm() { 
		return "/admin/bbsNotice/bbsNoticeForm"; 
	} 


	@RequestMapping("/admin/bbsNoticeList") 
	public ModelAndView bbsNoticeList(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo, ModelAndView mv) throws Exception { 

		int bbsCnt = adminBbsNoticeService.bbsNoticeCnt(); 
		PageUtil page = new PageUtil(); 
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1"))); 
		page.setPageSize(10); 
		page.setTotalCount(bbsCnt); 
		param.put("S_CNT", page.getsCnt()); 
		param.put("E_CNT", page.getPageSize()); 
		mv.addObject("page", page); 

		List<Map<String, Object>> bbsNoticeList = adminBbsNoticeService.bbsNoticeList(param); 
		mv.addObject("bbsNoticeList", bbsNoticeList); 
		mv.setViewName("/admin/bbs/bbsNoticeList"); 

		return mv; 

	} 


	@RequestMapping("/admin/bbsNoticeForm")
	public ModelAndView bbsNoticeInfo(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo, ModelAndView mv) throws Exception { 
		mv.addObject("userInfo", userInfo);
		mv.setViewName("/admin/bbs/bbsNoticeInfo"); 
		return mv; 
	} 
	
	@RequestMapping("/admin/bbsNoticeInfo")
	public ModelAndView bbsNoticeInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception {
		Map<String, Object> bbsNoticeInfo = adminBbsNoticeService.bbsNoticeInfo(param);
		mv.addObject("bbsNoticeInfo", bbsNoticeInfo);
		mv.setViewName("/admin/bbs/bbsNoticeInfo");
		return mv;
	}
	
	@RequestMapping("/admin/bbsNoticeInsert")
	@ResponseBody
	public int bbsNoticeInsert(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception { 
		String uId = StringUtil.nvl(userInfo.get("U_ID"));
		param.put("uId", uId);
		int result = adminBbsNoticeService.bbsNoticeInsert(param);
		return result;
	}
	
	@RequestMapping("/admin/bbsNoticeUpdate")
	@ResponseBody
	public int bbsNoticeUpdate(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception { 
		String uId = StringUtil.nvl(userInfo.get("U_ID"));
		param.put("uId", uId);
		int result = adminBbsNoticeService.bbsNoticeUpdate(param);
		return result;
	}
	
	@RequestMapping("/admin/bbsNoticeDelete")
	public int bbsNoticeDelete(@RequestParam Map<String, Object> param) throws Exception {
		int result = adminBbsNoticeService.bbsNoticeDelete(param);
		return result;
	}

} 


