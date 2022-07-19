package com.mpark.admin.price.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.price.dao.AdminPriceClassDao;

@Service
public class AdminPriceClassService {
	
	@Resource
	AdminPriceClassDao adminPriceClassDao;

	public List<Map<String, Object>> priceUserList(Map<String, Object> param) throws Exception { 
		
		return adminPriceClassDao.priceUserList(param);
		
	}
	
	public int priceUserCnt(Map<String, Object> param) throws Exception {
		
		return adminPriceClassDao.priceUserCnt(param);
	}
	
	public List<Map<String, Object>> priceClassList(Map<String, Object> param) throws Exception {
		
		return adminPriceClassDao.priceClassList(param);
	}
	
}
