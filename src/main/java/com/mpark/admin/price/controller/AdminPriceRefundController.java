package com.mpark.admin.price.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.price.service.AdminPriceRefundService;

@Controller
public class AdminPriceRefundController { 
	
	@Autowired
	AdminPriceRefundService adminPriceRefundService;
	
	@RequestMapping(value = {"/admin/priceRefundList"}) 
	public ModelAndView priceRefundList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

		mv.setViewName("/admin/price/refund/priceRefundList");
		return mv;
	}

}
