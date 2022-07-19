package com.mpark.admin.situation.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.situation.dao.AdminSituationDao;

@Service
public class AdminSituationService {

	@Resource
	AdminSituationDao adminSituationDao;

	public List<Map<String, Object>> situationClassList(Map<String, Object> map){
		return adminSituationDao.situationClassList(map);
	}

	public int situationClassCnt(Map<String, Object> map) {
		return adminSituationDao.situationClassCnt(map);
	}
	
	public int situationTeacherCnt(Map<String, Object> map) {
		return adminSituationDao.situationTeacherCnt(map);
	}
	
	public int situationUserCnt(Map<String, Object> map) {
		return adminSituationDao.situationUserCnt(map);
	}

	public List<Map<String, Object>> situationClassInfo(Map<String, Object> map){
		return adminSituationDao.situationClassInfo(map);
	}

	public Map<String, Object> sClassInfo(Map<String, Object> param){
		return adminSituationDao.sClassInfo(param);
	}
	
	public List<Map<String, Object>> situationTeacherList(Map<String, Object> param){
		return adminSituationDao.situationTeacherList(param);
	}

	public List<Map<String, Object>> situationTeacherInfo(Map<String, Object> param){
		return adminSituationDao.situationTeacherInfo(param);
	}
	
	public List<Map<String, Object>> situationTeacherScheduleInfo(Map<String, Object> param){
		return adminSituationDao.situationTeacherScheduleInfo(param);
	}
	
	public List<Map<String, Object>> situationUserList(Map<String, Object> param) {
		return adminSituationDao.situationUserList(param);
	}
	
	public List<Map<String, Object>> situationUserInfo(Map<String, Object> param) {
		return adminSituationDao.situationUserInfo(param);
	}
	
	public List<Map<String, Object>> situationUserScheduleInfo(Map<String, Object> param) {
		return adminSituationDao.situationUserScheduleInfo(param);
	}
	
	public Map<String, Object> selectUserName(Map<String, Object> param) {
		return adminSituationDao.selectUserName(param);
	}
	
	public Map<String, Object> selectTeacherName(Map<String, Object> param) {
		return adminSituationDao.selectTeacherName(param);
	}

}

