package com.mpark.admin.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("")
	public String index() {

		/*
		 * AdminVO adminVO = (AdminVO) AdminDetailsHelper.getAuthenticatedUser();
		 * logger.info(adminVO.getUserId()); logger.info(adminVO.getEmail());
		 * logger.info(adminVO.getPhone());
		 */

		return "/admin/index";
	}
}
