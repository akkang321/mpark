package com.mpark.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.common.dao.CodeDao;

@Service
public class CodeService {

	@Resource
	CodeDao codeDao;
	
	public List<Map<String, Object>> getCode(String parentCode) throws Exception {
		return codeDao.getCode(parentCode);
	}
	
	public List<Map<String, Object>> getCode(Map<String, Object> map) throws Exception {
		return codeDao.getCode(map);
	}
	
	public Map<String, Object> getMyInfo(String uId) {
		return codeDao.getMyInfo(uId);
	}
}