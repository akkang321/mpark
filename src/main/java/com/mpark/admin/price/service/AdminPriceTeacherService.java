package com.mpark.admin.price.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.price.dao.AdminPriceTeacherDao;

@Service
public class AdminPriceTeacherService {
	
	@Autowired
	AdminPriceTeacherDao adminPriceTeacherDao; 
	
	@RequestMapping(value = {"/admin/priceTeacherList"}) 
	public ModelAndView priceClassList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

		mv.setViewName("/admin/price/teacher/priceTeacherList");
		return mv;
	}

}
