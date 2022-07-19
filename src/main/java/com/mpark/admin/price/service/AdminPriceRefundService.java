package com.mpark.admin.price.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpark.admin.price.dao.AdminPriceRefundDao;

@Service
public class AdminPriceRefundService {
	
	@Autowired
	AdminPriceRefundDao adminPriceRefundDao;

}
