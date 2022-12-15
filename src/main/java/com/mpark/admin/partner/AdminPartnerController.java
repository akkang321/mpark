package com.mpark.admin.partner;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
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

@Controller
@SessionAttributes("token")
public class AdminPartnerController {  
	
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
//		mv.setViewName("/admin/partner/partnerSingeList");
//		return mv;
//	}

/*
	@RequestMapping(value = { "/admin/getPartners" })
	public String partnersList() {
		return "/admin/partner/partnerList";
	}
*/

	
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
	
	// 파트너스 - 상세정보
	@RequestMapping(value = {"/admin/getPartner"})
	public ModelAndView getPartner(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv) throws JsonMappingException, JsonProcessingException {
		Map<String,Object> param = new HashedMap();
		param.put("PartnerBN", "3688100910"); 
		
		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetPartner", token, param);		// 승인 대기중인 파트너사들 URL 
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);
		
		if (resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> info = mapper.readValue(result, Map.class);
			System.out.println(info);
			mv.addObject("info", info); 
		}
		
		
		mv.setViewName("/admin/partner/partnerInfo");
		return mv;
	}
	
	//파트너스 - 입출차
	@RequestMapping(value = {"/admin/getParkingHistory"})
	public ModelAndView getParkingHistory(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv) throws JsonMappingException, JsonProcessingException {
//		Map<String,String> param = new HashedMap();
//		param.put("PartnerBN", "86111"); 
//		
//		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetParkingHistory", token, param);		// 승인 대기중인 파트너사들 URL 
//		int resultCode = responseEntity.getStatusCodeValue();
//		mv.addObject("resultCode", resultCode);
//		
//		if (resultCode == 200) {
//			ObjectMapper mapper = new ObjectMapper();
//			String result = responseEntity.getBody();
//			Map<String, Object> info = mapper.readValue(result, Map.class);
//			mv.addObject("info", info); 
//		}

		mv.setViewName("/admin/partner/partnerEntranceAndExit");
		return mv;
	}
	
	
	// 파트너스 - 주차장 정보
	@RequestMapping(value = {"/admin/getParkingLots"})
	public ModelAndView getParkingLots(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv) throws JsonMappingException, JsonProcessingException {
		Map<String,Object> param = new HashedMap();
		param.put("PartnerBN", "3688100910");
		
		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetParkingLots", token, param);		// 승인 대기중인 파트너사들 URL 
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);
		
		if (resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> list = (List<?>) map.get("Results");
			mv.addObject("list", list);
			System.out.println(list);
		}
		
		mv.setViewName("/admin/partner/partnerParkingLotInfo");
		return mv;
	}

	// 파트너스 - 직원 목록
	@RequestMapping(value = {"/admin/getMyPartners"})
	public ModelAndView getMyPartners(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv) throws JsonMappingException, JsonProcessingException {
		Map<String,Object> param = new HashedMap();
		param.put("PartnerBN", "3688100910");
		
		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetMyPartners", token, param);		// 승인 대기중인 파트너사들 URL 
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);
		
		if (resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> list = (List<?>) map.get("Results");
			mv.addObject("list", list);
			System.out.println(list);
		}
		
		mv.setViewName("/admin/partner/partnerEmployeeList");
		return mv;
	}
}


