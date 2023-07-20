package com.mpark.admin.DBInsurance;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mpark.common.util.RestTemplateUtil;
import com.mpark.common.util.StringUtil;
import com.mpark.common.util.PageUtil;

@Controller
@SessionAttributes("token")
public class DBInsuranceManagementController {  
	@RequestMapping(value = {"/admin/getDBManagement"})
	public ModelAndView getDBManagement(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv,@RequestParam Map<String, Object> param) throws JsonMappingException, JsonProcessingException {
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
		ResponseEntity<String> responseEntityCnt = RestTemplateUtil.sendPostRequest("GetDBManagementCount", token, param);		// 
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
		
		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetDBManagement", token, param); 
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);
		
		if (resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> list = (List<?>) map.get("Results");
			mv.addObject("list", list);
			mv.addObject("map", map);
		}
		
		ResponseEntity<String> responseParkingLotEntity = RestTemplateUtil.sendPostRequest("GetAllParkingLots", token, param);
		int resultCodeParkingLot = responseParkingLotEntity.getStatusCodeValue();		
		if (resultCodeParkingLot == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseParkingLotEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> listParkingLot = (List<?>) map.get("Results");
			mv.addObject("listParkingLot", listParkingLot);
		}
		
		mv.setViewName("/admin/DBInsurance/DBInsuranceList");
		
		return mv;
	}
	
	@RequestMapping(value = {"/admin/getDBManagementTest"})
	public ModelAndView getDBManagementTest(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv,@RequestParam Map<String, Object> param) throws JsonMappingException, JsonProcessingException {
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
		ResponseEntity<String> responseEntityCnt = RestTemplateUtil.sendPostRequest("GetDBManagementCountTest", token, param);		// 
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
		
		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetDBManagementTest", token, param); 
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);
		
		if (resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> list = (List<?>) map.get("Results");
			mv.addObject("list", list);
			mv.addObject("map", map);
		}
		
		ResponseEntity<String> responseParkingLotEntity = RestTemplateUtil.sendPostRequest("GetAllParkingLots", token, param);
		int resultCodeParkingLot = responseParkingLotEntity.getStatusCodeValue();		
		if (resultCodeParkingLot == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseParkingLotEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> listParkingLot = (List<?>) map.get("Results");
			mv.addObject("listParkingLot", listParkingLot);
		}
		
		mv.setViewName("/admin/DBInsurance/DBInsuranceList");
		
		return mv;
	}
}


