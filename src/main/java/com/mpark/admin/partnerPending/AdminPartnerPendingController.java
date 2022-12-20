package com.mpark.admin.partnerPending;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import com.mpark.common.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mpark.common.util.RestTemplateUtil;
import com.mpark.common.util.StringUtil;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@SessionAttributes("token")
public class AdminPartnerPendingController {  
	/*
	파트너스 신청 목록 가져오기
	 */
	@RequestMapping(value = { "/", "/admin/index", ""})
	public ModelAndView index(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv, @RequestParam Map<String, Object> param) throws JsonMappingException, JsonProcessingException {
		int tCnt = 0;
		ResponseEntity<String> responseEntityCnt = RestTemplateUtil.sendPostRequest("GetPendingPartnersCount", token);
		int resultCodeCnt = responseEntityCnt.getStatusCodeValue();
		if (resultCodeCnt == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntityCnt.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			tCnt = Integer.parseInt(StringUtil.nvl(map.get("Count")));
		}

		PageUtil page = new PageUtil();
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1")));
		page.setPageSize(20);
		page.setTotalCount(tCnt);
		param.put("CurrentIdx",page.getsCnt());
		param.put("PageSize", page.getPageSize());

		mv.addObject("page", page);

		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetPendingPartners", token, param);		// 승인 대기중인 파트너사들 URL
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);

		if (resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> list = (List<?>) map.get("Results");
			mv.addObject("list", list);
			mv.setViewName("/admin/partnerPending/partnerSingeList");
		} else {
			mv.setViewName("redirect:/admin/logout");
		}
		
		return mv;
	}
	
//	@RequestMapping(value = {"/admin/getPendingPartners"})
//	public ModelAndView partnerSingeList(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv) throws JsonMappingException, JsonProcessingException {
//
//		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetPendingPartners", token);		// 승인 대기중인 파트너사들 URL 
//		int resultCode = responseEntity.getStatusCodeValue();
//		mv.addObject("resultCode", resultCode);
//		
//		if (resultCode == 200) {
//			ObjectMapper mapper = new ObjectMapper();
//			String result = responseEntity.getBody();
//			Map<String, Object> map = mapper.readValue(result, Map.class);
//			List<?> list = (List<?>) map.get("Results");
//			mv.addObject("list", list);
//		}
//		
//
//		mv.setViewName("/admin/partnerPending/partnerSingeList");
//		return mv;
//	}
	
	
	


	
//	@RequestMapping(value = { "/admin/partnerList" })
//	public ModelAndView getPartners(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv) throws JsonMappingException, JsonProcessingException { 
//
//		MultiValueMap<String,String> param = new LinkedMultiValueMap<>();
//		param.add("Mode", "DEFAULT"); 
//		param.add("Keyword", "");
//
//		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("getPartners", token, param); 
//		int resultCode = responseEntity.getStatusCodeValue();
//		mv.addObject("resultCode", resultCode);
//
//		if(resultCode == 200) { 
//			ObjectMapper mapper = new ObjectMapper();
//			String result = responseEntity.getBody();
//			List<?> list = mapper.readValue(result, List.class);
//			mv.addObject("list", list); 
//		}
//
//		mv.setViewName("/admin/partner/partnerList"); 
//		return mv; 
//	}
	
	

	
}


