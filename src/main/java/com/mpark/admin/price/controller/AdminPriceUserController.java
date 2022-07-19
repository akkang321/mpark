package com.mpark.admin.price.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.price.service.AdminPriceUserService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.StringUtil;

@Controller
public class AdminPriceUserController { 
	
	@Autowired
	AdminPriceUserService adminPriceUserService;
	
	@RequestMapping(value = { "/admin/priceUserList" })
	public ModelAndView priceUserList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		
		int priceUserCnt = adminPriceUserService.priceUserCnt(param);
		PageUtil page = new PageUtil();
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1")));
		page.setPageSize(5);
		page.setTotalCount(priceUserCnt);
		param.put("S_CNT", page.getsCnt());
		param.put("E_CNT", page.getPageSize()); 
		mv.addObject("page", page);
		
		List<Map<String, Object>> priceUserList = adminPriceUserService.priceUserList(param); 
		mv.addObject("priceUserList", priceUserList); 
		mv.setViewName("/admin/price/user/priceUserList"); 

		return mv; 
	}

	@RequestMapping(value = {"/admin/priceUserInfo"})
	public ModelAndView priceUserInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 


		mv.setViewName("/admin/price/user/priceUserInfo");
		return mv; 

	}

}
