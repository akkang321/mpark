package com.mpark.admin.academy.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.academy.dao.AdminAcademyScheduleDao;

@Service
public class AdminAcademyScheduleService {
	
	@Resource
	AdminAcademyScheduleDao adminAcademyScheduleDao;
	public List<Map<String, Object>> academyScheduleList(Map<String, Object> map){
		return adminAcademyScheduleDao.academyScheduleList(map);
	}
	
}
