package com.mpark.admin.statistic.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpark.admin.statistic.dao.StatisticLoginDao;

@Service
public class StatisticLoginService {

	@Autowired
	StatisticLoginDao statisticLoginDao;
	
	public List<Map<String, Object>> statisticLoginList(Map<String, Object> param) {
		return statisticLoginDao.statisticLoginList(param);
	}
	
	public int loginCnt() { 
		return statisticLoginDao.loginCnt();
	}
	
}
