package com.mpark.admin.academy.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.academy.service.AdminAcademyScheduleService;

@Controller
@SessionAttributes("userInfo")
public class AdminAcademyScheduleController {

	@Autowired
	AdminAcademyScheduleService adminAcademyScheduleService;

	@RequestMapping(value = { "/admin/academyScheduleList" })
	public ModelAndView academyScheduleList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

		mv.addObject("academyScheduleList", adminAcademyScheduleService.academyScheduleList(param)); 
		mv.setViewName("/admin/academy/schedule/scheduleList"); 
		return mv; 

	} 

} 


