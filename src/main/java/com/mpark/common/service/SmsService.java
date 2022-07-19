package com.mpark.common.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.common.dao.SmsDao;

@Service
public class SmsService {

	@Resource
	SmsDao smsDao;
	
	public Map<String, Object> smsContent(Map<String, Object> param) throws Exception {
		return smsDao.smsContent(param);
	}
	
	public int smsSendInsert(Map<String, Object> param) throws Exception {
		return smsDao.smsSendInsert(param);
	}
}