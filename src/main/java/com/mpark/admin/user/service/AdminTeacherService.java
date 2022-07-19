package com.mpark.admin.user.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.user.dao.AdminTeacherDao;

@Service
public class AdminTeacherService {

	@Resource
	AdminTeacherDao adminTeacherDAO;
	
	public int teacherCnt(Map<String, Object> param) {
		return adminTeacherDAO.teacherCnt(param);
	}

	public List<Map<String, Object>> teacherList(Map<String, Object> param) throws Exception {
		return adminTeacherDAO.teacherList(param);
	}
	
	public int checkTId(Map<String, Object> param) throws Exception {
		return adminTeacherDAO.checkTId(param);
	}
	
	public int teacherInsert(Map<String, Object> param) throws Exception {
		return adminTeacherDAO.teacherInsert(param);
	}
	
	public Map<String, Object> teacherInfo(String tId) throws Exception {
		return adminTeacherDAO.teacherInfo(tId);
	}
	
	public int teacherPwInit(Map<String, Object> param) throws Exception {
		return adminTeacherDAO.teacherPwInit(param);
	}
	
	public int teacherUpdate(Map<String, Object> param) throws Exception {
		return adminTeacherDAO.teacherUpdate(param);
	}
	
	public int teacherDelete(Map<String, Object> param) throws Exception{
		return adminTeacherDAO.teacherDelete(param);
	}
	
	public int fileInfoDelete(Map<String, Object> param) throws Exception {
		return adminTeacherDAO.fileInfoDelete(param);
	}

	public int teacherUpdateFileId(Map<String, Object> param) throws Exception{
		return adminTeacherDAO.teacherUpdateFileId(param);
	}
	
	public List<Map<String, Object>> filePaths(String param) throws Exception {
		return adminTeacherDAO.filePaths(param);
	}
	
	public List<Map<String, Object>> videoPaths(String param) throws Exception {
		return adminTeacherDAO.videoPaths(param);
	}
	
	public String selectTeacherPath(Map<String, Object> param) throws Exception {
		return adminTeacherDAO.selectTeacherPath(param);
	}
	
	public List<Map<String, String>> selectFilePath(Map<String, Object> param) throws Exception {
		return adminTeacherDAO.selectFilePath(param);
	}

}


