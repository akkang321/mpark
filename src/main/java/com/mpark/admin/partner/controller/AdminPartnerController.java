package com.mpark.admin.partner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminPartnerController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = { "/" ,"/admin/index","/admin/partnerSingeList",""})
	public String index() {


		return "/admin/partner/partnerSingeList";
	}
}
