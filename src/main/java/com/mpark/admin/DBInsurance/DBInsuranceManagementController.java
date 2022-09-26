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

@Controller
@SessionAttributes("token")
public class DBInsuranceManagementController {  
	
	@RequestMapping(value = {"/admin/getDBManagement"})
	public ModelAndView getDBManagement(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv,@RequestParam Map<String, String> param) throws JsonMappingException, JsonProcessingException {
		/*
		 * RequestParam은 왜 만들어주었나? => getPartner의 경우도 인자에 @RequestParam 추가해야 하나?
		 * 인자를 주고받는 흐름을 잘 모르겠어서 전체적인 구조의 흐름에 대한 지식이 필요함 => .jsp 에서 Controller로 인자를 전달받는 과정 및 Controller에서 .jsp로 인자를 전달하는 과
		 * 현재 .jsp 페이지에서 함수 선언하는 코드 니 자바스크립트인데 스크립트 태그 써서 java 코드로 하면 안되나?
		 * 페이지 만들고나면 테스트겸 DB 싹 밀어야 하는 게 아닌가?
		 *  
		 */
		
		if (StringUtil.nvl(param.get("EndDate")).equals("")) {
			param.put("StartDate", LocalDate.now().minusMonths(1).toString());
			param.put("EndDate", LocalDate.now().toString());
		}
		// Keyword 없으면 Error 나서 넣었음
		if (StringUtil.nvl(param.get("Keyword")).equals("")) {
			param.put("Keyword", "");
		}
		System.out.println(param);

		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetDBManagement", token, param);		// 승인 대기중인 파트너사들 URL 
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

		mv.setViewName("/admin/DBInsurance/DBInsuranceList");
		return mv;
	}
}


