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

import com.mpark.admin.academy.service.AdminAcademyCouponService;
import com.mpark.common.service.CodeService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.StringUtil;


@Controller
@SessionAttributes("userInfo")
public class AdminAcademyCouponController {

	@Autowired
	AdminAcademyCouponService adminAcademyCouponService;
	@Autowired
	CodeService codeService;

		@RequestMapping(value = { "/admin/academyCouponList" }) 
		public ModelAndView academyCouponList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

			int couponCnt = adminAcademyCouponService.couponCnt(); 
			PageUtil page = new PageUtil(); 
			page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1"))); 
			page.setPageSize(10); 
			page.setTotalCount(couponCnt); 
			param.put("S_CNT", page.getsCnt()); 
			param.put("E_CNT", page.getPageSize()); 
			mv.addObject("page", page); 

			List<Map<String, Object>> couponList = adminAcademyCouponService.academyCouponList(param); 
			mv.addObject("couponList", couponList); 
			mv.setViewName("/admin/academy/coupon/couponList"); 
			return mv; 
		} 


		@RequestMapping(value = { "/admin/academyCouponInfo" })
		public ModelAndView academyCouponInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
			Map<String, Object> couponInfo = adminAcademyCouponService.academyCouponInfo(param); 
			mv.addObject("couponInfo", couponInfo);
			mv.addObject("couponUseList", codeService.getCode("C090000"));		// 사용여부 list
			mv.addObject("couponTypeList", codeService.getCode("C100000"));		// 쿠폰타입 list

			mv.setViewName("/admin/academy/coupon/couponInfo"); 
			return mv; 
		} 


		@RequestMapping(value = { "/admin/academyCouponInsert" }) 
		@ResponseBody
		public int academyCouponInsert(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception { 
			String uId = StringUtil.nvl(userInfo.get("U_ID"));
			param.put("uId", uId); 
			int couponIdCheck = adminAcademyCouponService.couponIdCheck(param); 
			if (couponIdCheck  == 0) { 
				return adminAcademyCouponService.academyCouponInsert(param); 
			} else {
				return 999;
			}
		}
		
		@RequestMapping(value = { "/admin/academyCouponUpdate" })
		@ResponseBody
		public int academyCouponUpdate(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo) throws Exception { 
			String uId = StringUtil.nvl(userInfo.get("U_ID"));
			param.put("uId", uId); 
			return adminAcademyCouponService.academyCouponUpdate(param);
		}


		@RequestMapping(value = { "/admin/couponDelete" })
		@ResponseBody
		public int academyCouponDelete(@RequestParam Map<String, Object> param) throws Exception { 
			return adminAcademyCouponService.academyCouponDelete(param);
		}

	}


