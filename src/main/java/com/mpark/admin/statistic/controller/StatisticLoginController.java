package com.mpark.admin.statistic.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.statistic.service.StatisticLoginService;
import com.mpark.common.service.CodeService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.StringUtil;


@Controller
@SessionAttributes("userInfo")
public class StatisticLoginController { 

	@Autowired
	StatisticLoginService statisticLoginService; 
	@Autowired
	CodeService codeService;

	@RequestMapping(value = {"/admin/statisticLoginList"})
	public ModelAndView statisticLoginList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 

		int tCnt = statisticLoginService.loginCnt();
		PageUtil page = new PageUtil();
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1")));
		page.setPageSize(20);
		page.setTotalCount(tCnt);
		param.put("S_CNT", page.getsCnt());
		param.put("E_CNT", page.getPageSize());

		List<Map<String, Object>> statisticLoginList = statisticLoginService.statisticLoginList(param);
		mv.addObject("page", page);
		mv.addObject("statisticLoginList", statisticLoginList);
		mv.setViewName("/admin/statistic/statisticLoginList");
		return mv;
	}
}

