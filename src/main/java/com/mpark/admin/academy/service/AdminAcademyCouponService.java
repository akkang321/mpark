package com.mpark.admin.academy.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpark.admin.academy.dao.AdminAcademyCouponDao;


@Service
public class AdminAcademyCouponService { 

	@Resource
	AdminAcademyCouponDao adminAcademyCouponDao;

	public List<Map<String, Object>> academyCouponList(Map<String, Object> map){
		return adminAcademyCouponDao.academyCouponList(map);
	}
	
	public Map<String, Object> academyCouponInfo(Map<String, Object> map) {
		return adminAcademyCouponDao.academyCouponInfo(map);
	}
	
	public int couponIdCheck(Map<String, Object> map) {
		return adminAcademyCouponDao.couponIdCheck(map);
	}
	
	public int academyCouponInsert(Map<String, Object> map) {
		return adminAcademyCouponDao.academyCouponInsert(map);
	}
	public int academyCouponUpdate(Map<String, Object> map) {
		return adminAcademyCouponDao.academyCouponUpdate(map);
	}
	
	public int academyCouponDelete(Map<String, Object> map) {
		return adminAcademyCouponDao.academyCouponDelete(map);
	}
	
	public int couponCnt() {
		return adminAcademyCouponDao.couponCnt(); 
	}
}


