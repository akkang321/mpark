package com.mpark.common.service;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.common.dao.CommonDao;

@Service
public class CommonService {

	@Resource
	CommonDao commonDao;
	public List<Map<String, Object>> teacherList() throws Exception {
		return commonDao.teacherList();
	}
	
	public String nowYear() {
		return commonDao.nowYear();
	}
	public String nowMonth() {
		return commonDao.nowMonth();
	}
	public String nowDay() {
		return commonDao.nowDay();
	}
	public String nowHour() {
		return commonDao.nowHour();
	}
	public String nowMinute() {
		return commonDao.nowMinute();
	}

	public int insertLog(Map<String, Object> param) { 
		InetAddress local;
		try {
			local = InetAddress.getLocalHost();
			String loginIp = local.getHostAddress(); 
			param.put("loginIp", loginIp);
		} catch (UnknownHostException e1) { 
			e1.printStackTrace(); 
		}
		return commonDao.insertLog(param);
	}
	
	public int userTicketCnt(String uId) { 
		return commonDao.userTicketCnt(uId);
	}

}


