package com.mpark.admin.situation.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.situation.service.AdminSituationService;
import com.mpark.common.service.CodeService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.StringUtil;

@Controller
@SessionAttributes("userInfo")
public class AdminSituationController { 

	@Autowired
	AdminSituationService adminSituationService;
	@Autowired
	CodeService codeService;

	@RequestMapping(value = { "/admin/situationClassList" })
	public ModelAndView situationClassList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

		int tCnt = adminSituationService.situationClassCnt(param);
		PageUtil page = new PageUtil();
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1")));
		page.setPageSize(20);
		page.setTotalCount(tCnt);
		param.put("S_CNT", page.getsCnt());
		param.put("E_CNT", page.getPageSize());
		mv.addObject("page", page);
		
		List<Map<String, Object>> situationClassList = adminSituationService.situationClassList(param);
		mv.addObject("situationClassList", situationClassList);
		mv.setViewName("/admin/situation/class/situationClassList");
		return mv;
	}

	@RequestMapping(value = { "/admin/situationClassInfo" })
	public ModelAndView situationClassInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		List<Map<String, Object>> situationClassInfo = adminSituationService.situationClassInfo(param);
		Map<String, Object> sClassInfo = adminSituationService.sClassInfo(param);
		mv.addObject("situationClassInfo", situationClassInfo);
		mv.addObject("sClassInfo", sClassInfo);
		mv.setViewName("/admin/situation/class/situationClassInfo");
		return mv;
	}

	@RequestMapping(value = {"/admin/situationTeacherList"}) 
	public ModelAndView situationTeacherList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

		int tCnt = adminSituationService.situationTeacherCnt(param); 
		PageUtil page = new PageUtil(); 
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1"))); 
		page.setPageSize(20); 
		page.setTotalCount(tCnt); 
		param.put("S_CNT", page.getsCnt()); 
		param.put("E_CNT", page.getPageSize()); 
		mv.addObject("page", page); 
		
		List<Map<String, Object>> situationTeacherList = adminSituationService.situationTeacherList(param);
		mv.addObject("situationTeacherList", situationTeacherList);
		mv.setViewName("/admin/situation/teacher/situationTeacherList");
		return mv;
	}

	@RequestMapping(value = {"/admin/situationTeacherInfo"})
	public ModelAndView situationTeacherInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		List<Map<String, Object>> situationTeacherInfo = adminSituationService.situationTeacherInfo(param);
		List<Map<String, Object>> situationTeacherScheduleInfo = adminSituationService.situationTeacherScheduleInfo(param);
		Map<String, Object> teacherName = adminSituationService.selectTeacherName(param);
		mv.addObject("situationTeacherInfo", situationTeacherInfo);
		mv.addObject("situationTeacherScheduleInfo", situationTeacherScheduleInfo); 
		mv.addObject("teacherName", teacherName);
		mv.setViewName("/admin/situation/teacher/situationTeacherInfo");
		return mv;
	}
	
	@RequestMapping(value = {"/admin/situationUserList"})
	public ModelAndView situationUserList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception {
		
		int tCnt = adminSituationService.situationUserCnt(param); 
		PageUtil page = new PageUtil(); 
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1"))); 
		page.setPageSize(20); 
		page.setTotalCount(tCnt); 
		param.put("S_CNT", page.getsCnt()); 
		param.put("E_CNT", page.getPageSize()); 
		mv.addObject("page", page); 
		
		List<Map<String, Object>> situationUserList = adminSituationService.situationUserList(param);
		mv.addObject("situationUserList", situationUserList); 
		mv.setViewName("/admin/situation/user/situationUserList");
		return mv;
	}
	
	@RequestMapping(value = {"/admin/situationUserInfo"})
	public ModelAndView situationUserInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception {
		List<Map<String, Object>> situationUserInfo = adminSituationService.situationUserInfo(param);
		List<Map<String, Object>> situationUserScheduleInfo = adminSituationService.situationUserScheduleInfo(param); 
		Map<String, Object> userName = adminSituationService.selectUserName(param);
		mv.addObject("situationUserScheduleInfo", situationUserScheduleInfo);
		mv.addObject("situationUserInfo", situationUserInfo); 
		mv.addObject("userName", userName);
		mv.setViewName("/admin/situation/user/situationUserInfo");
		return mv;
	}


}


