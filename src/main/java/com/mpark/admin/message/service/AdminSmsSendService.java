package com.mpark.admin.message.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.message.dao.AdminSmsSendDao;

@Service
public class AdminSmsSendService {

	@Resource 
	AdminSmsSendDao adminSmsSendDao; 

	public List<Map<String, Object>> smsSendList(Map<String, Object> param) {
		return adminSmsSendDao.smsSendList(param);
	}
	
	public int smsSendListCnt(Map<String, Object> param) {
		return adminSmsSendDao.smsSendListCnt(param);
	}

}

