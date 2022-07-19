package com.mpark.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileDao {

	public Map<String, Object> fileSelect(String id);

	public int fileInsert(Map<String, Object> map);

	public int fileUpdate(Map<String, Object> map);

	public int fileDelete(String id);
	
	public List<String> fileIds(String useId);
	
	public int fileDeleteByUseId(String useId);
	
	public List<Map<String, String>> filePaths(Map<String, Object> map);

}