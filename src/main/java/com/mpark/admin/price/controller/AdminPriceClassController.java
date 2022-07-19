package com.mpark.admin.price.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.price.service.AdminPriceClassService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.StringUtil;

@Controller
@SessionAttributes("userInfo")
public class AdminPriceClassController {

	@Autowired
	AdminPriceClassService adminPriceClassService;


	@RequestMapping(value = {"/admin/priceClassList"}) 
	public ModelAndView priceClassList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

		List<Map<String, Object>> priceClassList = adminPriceClassService.priceClassList(param); 
		mv.addObject("priceClassList", priceClassList); 
		mv.setViewName("/admin/price/class/priceClassList"); 

		return mv; 
	}

}


