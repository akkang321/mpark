package com.mpark.admin.DBInsurance;

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
public class DBInsuranceManagementController {  
	
	@RequestMapping(value = {"/admin/getDBManagement"})
	public ModelAndView getDBManagement(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv) throws JsonMappingException, JsonProcessingException {
		Map<String,String> param = new HashedMap();
		param.put("Mode", "0");
//		
		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetDBManagement", token, param);		// 승인 대기중인 파트너사들 URL 
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);
		
		if (resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			System.out.println(map);
			List<?> list = (List<?>) map.get("Results");
			mv.addObject("list", list);
			mv.addObject("map", map);
			
		}

		mv.setViewName("/admin/partnerPending/DBInsuranceList");
		return mv;
	}
	
	
	
	
	
	
}


