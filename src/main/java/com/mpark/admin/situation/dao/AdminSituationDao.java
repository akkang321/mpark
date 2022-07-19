package com.mpark.admin.situation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminSituationDao {

	public List<Map<String, Object>> situationClassList(Map<String, Object> param);

	public int situationClassCnt(Map<String, Object> map);
	
	public int situationTeacherCnt(Map<String, Object> map);

	public List<Map<String, Object>> situationClassInfo(Map<String, Object> param);

	public Map<String, Object> sClassInfo(Map<String, Object> param);

	public List<Map<String, Object>> situationTeacherList(Map<String, Object> param);

	public List<Map<String, Object>> situationTeacherInfo(Map<String, Object> param);
	
	public List<Map<String, Object>> situationTeacherScheduleInfo(Map<String, Object> param);
	
	public List<Map<String, Object>> situationUserList(Map<String, Object> param);
	
	public List<Map<String, Object>> situationUserInfo(Map<String, Object> param);
	
	public int situationUserCnt(Map<String, Object> param);
	
	public List<Map<String, Object>> situationUserScheduleInfo(Map<String, Object> param);
	
	public Map<String, Object> selectUserName(Map<String, Object> param);
	
	public Map<String, Object> selectTeacherName(Map<String, Object> param); 

}

