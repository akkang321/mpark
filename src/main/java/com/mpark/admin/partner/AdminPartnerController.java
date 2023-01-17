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
import org.springframework.web.bind.annotation.RequestParam;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mpark.common.util.RestTemplateUtil;
import com.mpark.common.util.StringUtil;
import com.mpark.common.util.PageUtil;
import java.time.LocalDate;

@Controller
@SessionAttributes("token")
public class AdminPartnerController {  
	/*
	파트너스 목록 가져오기 (현재는 Normal 외에 Pending도 포함)
	 */	
	@RequestMapping(value = { "/admin/partnerList" })
	public ModelAndView getPartners(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv, @RequestParam Map<String, Object> param) throws JsonMappingException, JsonProcessingException {
		// PartnerName 없으면 Error 나서 넣었음
		if (StringUtil.nvl(param.get("PartnerName")).equals("")) {
			param.put("PartnerName", "");
		}

		int tCnt = 0;
		ResponseEntity<String> responseEntityCnt = RestTemplateUtil.sendPostRequest("GetPartnersCount", token);
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

		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetPartners", token, param);
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);

		if(resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> list = (List<?>) map.get("Results");
			mv.addObject("list", list);
		}

		mv.setViewName("/admin/partner/partnersList");
		return mv;
	}
	
	// 파트너스 - 상세정보
	@RequestMapping(value = {"/admin/getPartner"})
	public ModelAndView getPartner(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv, @RequestParam Map<String, Object> param) throws JsonMappingException, JsonProcessingException {
		param.put("PartnerBN", StringUtil.nvl(param.get("partnerBN")));
		
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
	
	/*
	파트너스 - 입출차
	 */
	@RequestMapping(value = {"/admin/getParkingHistory"})
	public ModelAndView getParkingHistory(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv, @RequestParam Map<String, Object> param) throws JsonMappingException, JsonProcessingException {
		// 임시 ParkingLN
		param.put("ParkingLN", "000017");

		// 날짜 미입력시 최근 한달 조회
		if (StringUtil.nvl(param.get("EndDate")).equals("")) {
			param.put("StartDate", LocalDate.now().minusMonths(1).toString());
			param.put("EndDate", LocalDate.now().toString());
		}

		mv.addObject("StartDate",param.get("StartDate"));
		mv.addObject("EndDate",param.get("EndDate"));

		// Keyword Error 처리
		if (StringUtil.nvl(param.get("Keyword")).equals("")) {
			param.put("Keyword", "");
		}

		int tCnt = 0;
		ResponseEntity<String> responseEntityCnt = RestTemplateUtil.sendPostRequest("GetParkingHistoryCount", token, param);
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

		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetParkingHistory", token, param);
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);

		if (resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> list = (List<?>) map.get("Results");
			mv.addObject("list", list);
		}


		mv.setViewName("/admin/partner/partnerEntranceAndExit");
		return mv;
	}
	
	
	// 파트너스 - 주차장 정보
	@RequestMapping(value = {"/admin/getParkingLots"})
	public ModelAndView getParkingLots(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv) throws JsonMappingException, JsonProcessingException {
		Map<String,Object> param = new HashedMap();
		param.put("PartnerBN", "5853900307");
		
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
		param.put("PartnerBN", "5853900307");
		
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


