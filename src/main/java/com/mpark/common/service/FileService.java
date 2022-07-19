package com.mpark.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.common.dao.FileDao;

@Service
public class FileService {

	@Resource
	FileDao fileDao;

	public Map<String, Object> fileSelect(String id) {
		return fileDao.fileSelect(id);
	}
	
	public List<String> fileIdList(String useId){
		return fileDao.fileIds(useId);
	}

	public boolean fileInsert(Map<String, Object> map) {
		if (fileDao.fileInsert(map) > 0) {
			return true;
		}
		return false;
	}

	public boolean fileUpdate(Map<String, Object> map) {
		if (fileDao.fileUpdate(map) > 0) {
			return true;
		}
		return false;
	}

	public boolean fileDelete(String id) {

		if (fileDao.fileDelete(id) > 0) {
			return true;
		}
		return false;
	}
	
	public boolean fileDeleteByUseId(String useId) {

		if (fileDao.fileDeleteByUseId(useId) > 0) {
			return true;
		}
		return false;
	}
	
	
	public List<Map<String, String>> filePaths(Map<String, Object> map){
		return fileDao.filePaths(map);
	}
}

