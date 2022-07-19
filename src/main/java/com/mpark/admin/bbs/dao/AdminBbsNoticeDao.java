package com.mpark.admin.bbs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminBbsNoticeDao {

	public List<Map<String, Object>> bbsNoticeList(Map<String, Object> param);
	
	public int bbsNoticeCnt();
	
	public Map<String, Object> bbsNoticeInfo(Map<String, Object> param);
	
	public int bbsNoticeDelete(Map<String, Object> param); 
	
	public int bbsNoticeInsert(Map<String, Object> param);
	
	public int bbsNoticeUpdate(Map<String, Object> param);
	
}

