package com.mpark.admin.price.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.price.service.AdminPriceTeacherService;

@Controller
public class AdminPriceTeacherController {
	
	@Autowired
	AdminPriceTeacherService adminPriceTeacherService;
	
	@RequestMapping(value = {"/admin/priceTeacherList"}) 
	public ModelAndView priceRefundList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

		mv.setViewName("/admin/price/teacher/priceTeacherList");
		return mv;
	}

}
