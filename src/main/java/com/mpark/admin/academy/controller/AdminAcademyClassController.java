package com.mpark.admin.academy.controller;

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

import com.mpark.admin.academy.service.AdminAcademyClassService;
import com.mpark.common.service.CodeService;
import com.mpark.common.service.CommonService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.SecurityUtil;
import com.mpark.common.util.StringUtil;

@Controller
@SessionAttributes("userInfo")
public class AdminAcademyClassController {

	@Autowired
	AdminAcademyClassService adminAcademyClassService;

	@Autowired
	CodeService codeService;
	
	@Autowired
	CommonService commonService;

	@RequestMapping(value = {"/admin/academyClassList"})
	public ModelAndView academyClassList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		
		int tCnt = adminAcademyClassService.academyClassCnt(param); 
		PageUtil page = new PageUtil();
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1"))); 
		page.setPageSize(20);
		page.setTotalCount(tCnt);
		param.put("S_CNT", page.getsCnt());
		param.put("E_CNT", page.getPageSize()); 

		List<Map<String, Object>> classList = adminAcademyClassService.academyClassList(param);
		mv.addObject("classList", classList);
		mv.addObject("page", page);
		
		mv.setViewName("/admin/academy/class/classList");
		return mv;
	}


	@RequestMapping(value = { "/admin/academyClassInfo" })
	public ModelAndView academyClassInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

		mv.addObject("levelList", codeService.getCode("C050000")); 
		mv.addObject("typeList", codeService.getCode("C060000")); 
		mv.addObject("stateList", codeService.getCode("C070000")); 
		mv.addObject("roomList", codeService.getCode("C120000")); 
		mv.addObject("teacherList", commonService.teacherList()); 
		String cId = StringUtil.nvl(param.get("cId")); 
		mv.addObject("classInfo", adminAcademyClassService.academyClassInfo(cId)); 
		mv.addObject("classPriceList", adminAcademyClassService.academyClassPriceList()); 
		mv.addObject("classScheduleList",  academyClassScheduleList(param)); 

		mv.setViewName("/admin/academy/class/classInfo"); 
		return mv; 
	} 

	@RequestMapping(value = { "/admin/academyClassInsert" })
	@ResponseBody
	public int academyClassInsert(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception {
		param.put("uId", userInfo.get("U_ID"));
		adminAcademyClassService.academyClassInsert(param);
		return Integer.parseInt(StringUtil.nvl(param.get("cId")));
	}

	@RequestMapping(value = { "/admin/academyClassUpdate" })
	@ResponseBody
	public int academyClassUpdate(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception {
		param.put("uId", userInfo.get("U_ID"));
		return adminAcademyClassService.academyClassUpdate(param);
	}

	@RequestMapping(value = { "/admin/academyClassDelete" })
	@ResponseBody
	public int academyClassDelete(@RequestParam Map<String, Object> param) throws Exception {
		return adminAcademyClassService.academyClassDelete(StringUtil.nvl(param.get("cId")));
	}

	@RequestMapping(value = { "/admin/academyClassScheduleList" })
	@ResponseBody
	public List<Map<String, Object>> academyClassScheduleList(@RequestParam Map<String, Object> param) throws Exception {
		return adminAcademyClassService.academyClassScheduleList(param);
	}

	@RequestMapping(value = { "/admin/academyClassScheduleInsert" })
	@ResponseBody
	public int academyClassScheduleInsert(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception {
		param.put("uId", userInfo.get("U_ID"));
		adminAcademyClassService.academyClassScheduleInsert(param);
		return Integer.parseInt(StringUtil.nvl(param.get("sId")));
	}

	@RequestMapping(value = { "/admin/academyClassScheduleDelete" })
	@ResponseBody
	public int academyClassScheduleDelete(@RequestParam Map<String, Object> param) throws Exception {
		return adminAcademyClassService.academyClassScheduleDelete(param);
	}

}


