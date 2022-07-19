package com.mpark.admin.academy.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.academy.service.AdminAcademyPriceService;
import com.mpark.common.service.CodeService;
import com.mpark.common.util.StringUtil;

@Controller
@SessionAttributes("userInfo")
public class AdminAcademyPriceController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminAcademyPriceService adminAcademyPriceService;

	@Autowired
	CodeService codeService;
	
	@RequestMapping(value = {"/admin/academyPriceList"})
	public ModelAndView priceList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		List<Map<String, Object>> tPriceList = adminAcademyPriceService.tPriceList(param);
		mv.addObject("tPriceList", tPriceList);
		List<Map<String, Object>> cPriceList = adminAcademyPriceService.cPriceList(param);
		mv.addObject("cPriceList", cPriceList);
		mv.setViewName("/admin/academy/price/priceList");
		return mv;
	}

	@RequestMapping(value = {"/admin/tPriceInsert"})
	public ModelAndView tPriceInsert(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo, ModelAndView mv) throws Exception { 
		String uId = StringUtil.nvl(userInfo.get("U_ID")); 
		param.put("uId", uId); 
		adminAcademyPriceService.tPriceInsert(param);
		List<Map<String, Object>> tPriceInsert = adminAcademyPriceService.tPriceList(param); 
		mv.addObject("t_priceList", tPriceInsert);
		List<Map<String, Object>> cPriceInsert = adminAcademyPriceService.cPriceList(param); 
		mv.addObject("c_priceList", cPriceInsert);
		mv = new ModelAndView("redirect:/admin/academyPriceList");
		return mv;
	}

	@RequestMapping(value = {"/admin/tPriceUpdate"})
	@ResponseBody
	public int tPriceUpdate(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception { 
		String uId = StringUtil.nvl(userInfo.get("U_ID"));
		param.put("uId", uId);
		return adminAcademyPriceService.tPriceUpdate(param);
	}

	@RequestMapping(value = {"/admin/cPriceInsert"})
	public ModelAndView cPriceInsert(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo, ModelAndView mv) throws Exception { 
		String uId = StringUtil.nvl(userInfo.get("U_ID"));
		param.put("uId", uId);
		adminAcademyPriceService.cPriceInsert(param);
		List<Map<String, Object>> tPriceInsert = adminAcademyPriceService.tPriceList(param);
		mv.addObject("t_priceList", tPriceInsert);
		List<Map<String, Object>> cPriceInsert = adminAcademyPriceService.cPriceList(param);
		mv.addObject("c_priceList", cPriceInsert);
		mv = new ModelAndView("redirect:/admin/academyPriceList");
		return mv;
	} 

	@RequestMapping(value = {"/admin/cPriceUpdate"})
	@ResponseBody
	public int cPriceUpdate(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception { 
		String uId = StringUtil.nvl(userInfo.get("U_ID"));
		param.put("uId", uId);
		return adminAcademyPriceService.cPriceUpdate(param); 
	} 

	@RequestMapping(value = {"/admin/priceDelete"})
	@ResponseBody
	public int priceDelete(@RequestParam Map<String, Object> param) throws Exception { 

		return adminAcademyPriceService.priceDelete(param);

	}

}


