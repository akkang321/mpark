package com.mpark.admin.academy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.academy.dao.AdminAcademyClassDao;

@Service
public class AdminAcademyClassService {
	
	@Resource
	AdminAcademyClassDao adminAcademyClassDao;
	
	public int academyClassCnt(Map<String, Object> map) {
		return adminAcademyClassDao.academyClassCnt(map);
	}
	
	public List<Map<String, Object>> academyClassList(Map<String, Object> map){
		return adminAcademyClassDao.academyClassList(map);
	}
	
	public List<Map<String, Object>> academyClassPriceList(){
		return adminAcademyClassDao.academyClassPriceList();
	}
	
	public Map<String, Object> academyClassInfo(String cId){
		return adminAcademyClassDao.academyClassInfo(cId);
	}
	
	public int academyClassInsert(Map<String, Object> map) {
		return adminAcademyClassDao.academyClassInsert(map);
	}
	
	public int academyClassUpdate(Map<String, Object> map) {
		return adminAcademyClassDao.academyClassUpdate(map);
	}
	
	public int academyClassDelete(String cId) {
		int result =adminAcademyClassDao.academyClassDelete(cId); 
		Map<String, Object> map = new HashMap<>();
		map.put("cId", cId);
		adminAcademyClassDao.academyClassScheduleDelete(map);
		return result;
	}
	
	public List<Map<String, Object>> academyClassScheduleList(Map<String, Object> map){
		return adminAcademyClassDao.academyClassScheduleList(map);
	}
	
	public int academyClassScheduleInsert(Map<String, Object> map) {
		return adminAcademyClassDao.academyClassScheduleInsert(map);
	}
	
	public int academyClassScheduleDelete(Map<String, Object> map) {
		return adminAcademyClassDao.academyClassScheduleDelete(map);
	}
}
