package com.mpark.admin.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminTeacherDao {
	
	public int teacherCnt(Map<String, Object> map);

	public List<Map<String, Object>> teacherList(Map<String, Object> param);

	public int checkTId(Map<String, Object> param);

	public int teacherInsert(Map<String, Object> param);

	public Map<String, Object> teacherInfo(String tId);

	public int teacherPwInit(Map<String, Object> param);

	public int teacherUpdate(Map<String, Object> param);

	public int teacherDelete(Map<String, Object> param);

	public int fileInfoDelete(Map<String, Object> param);

	public int teacherUpdateFileId(Map<String, Object> param);

	public List<Map<String, Object>> filePaths(String param);

	public List<Map<String, Object>> videoPaths(String param);

	public String selectTeacherPath(Map<String, Object> param);

	public List<Map<String, String>> selectFilePath(Map<String, Object> param);

}

