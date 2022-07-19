package com.mpark.admin.bbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpark.admin.bbs.dao.AdminBbsNoticeDao;

@Service
public class AdminBbsNoticeService {
	
	@Autowired
	AdminBbsNoticeDao adminBbsNoticeDao;
	
	public List<Map<String, Object>> bbsNoticeList(Map<String, Object> param) {
		return adminBbsNoticeDao.bbsNoticeList(param);
	}
	
	public int bbsNoticeCnt() {
		return adminBbsNoticeDao.bbsNoticeCnt(); 
	}
	
	public Map<String, Object> bbsNoticeInfo(Map<String, Object> param) {
		return adminBbsNoticeDao.bbsNoticeInfo(param);
	}
	
	public int bbsNoticeDelete(Map<String, Object> param) {
		return adminBbsNoticeDao.bbsNoticeDelete(param);
	}
	
	public int bbsNoticeInsert(Map<String, Object> param) {
		return adminBbsNoticeDao.bbsNoticeInsert(param);
	}
	
	public int bbsNoticeUpdate(Map<String, Object> param) {
		return adminBbsNoticeDao.bbsNoticeUpdate(param);
	}

}
