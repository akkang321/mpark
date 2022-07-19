package com.mpark.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.common.service.CodeService;

@Controller
public class CodeController {
	
	@Autowired
	CodeService codeService;
	
	@RequestMapping("/getCode")
	@ResponseBody
	public ModelAndView getCode(@RequestParam Map<String, Object> param) throws Exception {

		List<Map<String, Object>> resultList = codeService.getCode(param);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", resultList);

		return new ModelAndView("jsonView", resultMap);
	}
}
