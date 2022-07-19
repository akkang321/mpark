package com.mpark.admin.system.controller;

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

import com.mpark.admin.system.service.CodeInfoService;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.StringUtil;

@Controller
@SessionAttributes("userInfo")
public class CodeInfoController {

	@Autowired
	CodeInfoService codeInfoService;	

	@RequestMapping(value = {"/admin/codeList"})
	public ModelAndView codeList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception {

		int tCnt = codeInfoService.codeCnt(param);
		PageUtil page = new PageUtil();
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1")));
		page.setPageSize(20);
		page.setTotalCount(tCnt);
		param.put("S_CNT", page.getsCnt());
		param.put("E_CNT", page.getPageSize());
		
		List<Map<String, Object>> codeList = codeInfoService.codeList(param);
		mv.addObject("codeList", codeList);
		mv.addObject("page", page);
		mv.setViewName("/admin/system/codeList");
		return mv;
	}
	
	@RequestMapping(value = "/admin/codeInfo")
	@ResponseBody
	public Map<String, Object> codeInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception {
		Map<String, Object> result = codeInfoService.codeSelect(StringUtil.nvl(param.get("codeId")));
		return result;
	}
	
	@RequestMapping(value = "/admin/codeSave")
	@ResponseBody
	public int codeSave(@RequestParam Map<String, Object> param, @ModelAttribute("userInfo") Map<String, Object> userInfo, ModelAndView mv) throws Exception {
		String saveType = StringUtil.nvl(param.get("saveType"));
		param.put("uId", userInfo.get("U_ID"));
		if (saveType.equals("I")) {
			return codeInfoService.codeInsert(param);
		} else {
			return  codeInfoService.codeUpdate(param);
		}
	}
	
	
	@RequestMapping(value = "/admin/codeDelete")
	@ResponseBody
	public int deleteData(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception {
		String id = StringUtil.nvl(param.get("codeId"));
		return codeInfoService.codeDelete(id);
	}
}
