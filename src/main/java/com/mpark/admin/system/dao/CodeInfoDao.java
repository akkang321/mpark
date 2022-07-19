package com.mpark.admin.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CodeInfoDao {

	public List<Map<String, Object>> commonCodeList(Map<String, Object> map);
	
	public List<Map<String, Object>> codeList(Map<String, Object> map);
	
    public int codeCnt(Map<String, Object> map);
	
    public int codeInsert(Map<String, Object> map);
    
    public Map<String, Object> codeSelect(String id);
    
    public int codeUpdate(Map<String, Object> map);
    
    public int codeDelete(String id);

}

