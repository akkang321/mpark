package com.mpark.admin.partnerPayments;

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
public class PartnerPaymentsController {
	/*
	파트너스 매츨 관리
	 */
	@RequestMapping(value = {"/admin/getPartnersPayments"})
	public ModelAndView getPartnersPayments(HttpServletRequest request, @ModelAttribute("token") String token, ModelAndView mv,@RequestParam Map<String, Object> param) throws JsonMappingException, JsonProcessingException {
		// 날짜 미입력시 최근 한달 조회
		if (StringUtil.nvl(param.get("EndDate")).equals("")) {
			param.put("StartDate", LocalDate.now().minusMonths(1).toString());
			param.put("EndDate", LocalDate.now().toString());	
		}
		mv.addObject("StartDate",param.get("StartDate"));
		mv.addObject("EndDate",param.get("EndDate"));
		
		// PartnerName 없으면 Error 나서 넣었음
		if (StringUtil.nvl(param.get("PartnerName")).equals("")) {
			param.put("PartnerName", "");
		}
		
		int tCnt = 0;
		ResponseEntity<String> responseEntityCnt = RestTemplateUtil.sendPostRequest("GetPartnersPaymentsCount", token, param);
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
		
		ResponseEntity<String> responseEntity = RestTemplateUtil.sendPostRequest("GetPartnersPayments", token, param); 
		int resultCode = responseEntity.getStatusCodeValue();
		mv.addObject("resultCode", resultCode);
		
		if (resultCode == 200) {
			ObjectMapper mapper = new ObjectMapper();
			String result = responseEntity.getBody();
			Map<String, Object> map = mapper.readValue(result, Map.class);
			List<?> list = (List<?>) map.get("Results");
			mv.addObject("list", list);
		}
		
		
		mv.setViewName("/admin/partnerPayments/PartnerPaymentsList");
		
		return mv;
	}
}


