package com.mpark.admin.academy.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.academy.dao.AdminAcademyPriceDao;

@Service
public class AdminAcademyPriceService {
	
	@Resource
	AdminAcademyPriceDao adminAcademyPriceDAO;
	
	public List<Map<String, Object>> tPriceList(Map<String, Object> map) throws Exception{
		return adminAcademyPriceDAO.tPriceList(map);
	}
	public List<Map<String, Object>> cPriceList(Map<String, Object> map) throws Exception{
		return adminAcademyPriceDAO.cPriceList(map);
	}
	
	public int tPriceInsert(Map<String, Object> param) throws Exception{
		return adminAcademyPriceDAO.tPriceInsert(param);
	}
	
	public int cPriceInsert(Map<String, Object> param) throws Exception{
		return adminAcademyPriceDAO.cPriceInsert(param);
	}
	
	public int tPriceUpdate(Map<String, Object> param) throws Exception {
		return adminAcademyPriceDAO.tPriceUpdate(param);
	}
	
	public int cPriceUpdate(Map<String, Object> param) throws Exception {
		return adminAcademyPriceDAO.cPriceUpdate(param);
	}
	
	public int priceDelete(Map<String, Object> param) throws Exception{
		return adminAcademyPriceDAO.priceDelete(param);
	}
}
