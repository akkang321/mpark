package com.mpark.admin.price.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpark.admin.price.dao.AdminPriceUserDao;

@Service
public class AdminPriceUserService {
	
	@Autowired
	AdminPriceUserDao adminPriceUserDao;
	
	public List<Map<String, Object>> priceUserList(Map<String, Object> param) throws Exception { 
		
		return adminPriceUserDao.priceUserList(param);
		
	}
	
	public int priceUserCnt(Map<String, Object> param) throws Exception {
		
		return adminPriceUserDao.priceUserCnt(param); 
	}

}
