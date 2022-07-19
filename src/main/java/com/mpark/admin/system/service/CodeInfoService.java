package com.mpark.admin.system.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mpark.admin.system.dao.CodeInfoDao;

@Service
public class CodeInfoService {

	@Resource
	CodeInfoDao codeInfoDao;

	public List<Map<String, Object>> codeList(Map<String, Object> map) throws Exception {

		return codeInfoDao.codeList(map);
	}

	public int codeCnt(Map<String, Object> map) {

		return codeInfoDao.codeCnt(map);
	}

	public int codeInsert(Map<String, Object> map) {
		return codeInfoDao.codeInsert(map);
	}

	public Map<String, Object> codeSelect(String id) {

		return codeInfoDao.codeSelect(id);
	}

	public int codeUpdate(Map<String, Object> map) {
		return codeInfoDao.codeUpdate(map);
	}

	public int codeDelete(String id) {
		/*
		 * int cnt = 0; if (ids != null) { for (String id : ids) { cnt +=
		 * codeInfoDao.codeDelete(id); } }
		 */
		return codeInfoDao.codeDelete(id);
	}
}
