package com.mpark.common.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class SmsUtil {

	@Value("${userId}") private String userId;
	@Value("${key}") private String key;
	@Value("${smsSender}") private String smsSender;
	@Value("${smsSendUrl}") private String smsSendUrl;
	@Value("${smsSendMassUrl}") private String smsSendMassUrl;
	@Value("${smsListUrl}") private String smsListUrl;
	@Value("${smsListDetailUrl}") private String smsListDetailUrl;
	@Value("${smsCntUrl}") private String smsCntUrl;
	@Value("${smsCancelUrl}") private String smsCancelUrl;
	
	
	
	//단일내용전송용 - 컴마(,)분기1명~1천명까지 가능
	public Map<String, Object> sendSms(String title, String msg, String receiver) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		String param ="";
		param = "user_id="+userId;
		param += "&key="+key;
		param += "&sender="+smsSender;
		param += "&msg="+msg;
		param += "&title="+title;
		param += "&receiver="+receiver;
		
		String resultStr = PostRequestUtil.sendPostRequest(smsSendUrl, param);
		ObjectMapper mapper = new ObjectMapper();
		 
		try {
			result = mapper.readValue(resultStr, new TypeReference<Map<String, Object>>(){});
			
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//번호별 다른내용 동시 전송용 - 1명~500명까지 가능 추후개발
	public Map<String, Object> smsSendMass() {
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		return result;
	}
	
	//최근발송한 내역 조회 예제
	public Map<String, Object> smsList(int smsPage, int smsPageSize, String startDate, int limitDay ) {
		Map<String, Object> result = new HashMap<String, Object>();
		String param ="";
		param = "user_id="+userId;
		param += "&key="+key;
		param += "&sender="+smsSender;
		param += "&page="+smsPage;
		param += "&page_size="+smsPageSize;
		param += "&start_date="+startDate;
		param += "&limit_day="+limitDay;
		
		String resultStr = PostRequestUtil.sendPostRequest(smsListUrl, param);
		ObjectMapper mapper = new ObjectMapper();
		 
		try {
			result = mapper.readValue(resultStr, new TypeReference<Map<String, Object>>(){});
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//문자전송결과 조회 디테일
	public Map<String, Object> smsListDetail(int smsPage, int smsPageSize, String mId) {
		Map<String, Object> result = new HashMap<String, Object>();
		String param ="";
		param = "user_id="+userId;
		param += "&key="+key;
		param += "&mid="+mId;
		param += "&page="+smsPage;
		param += "&page_size="+smsPageSize;
		
		String resultStr = PostRequestUtil.sendPostRequest(smsListDetailUrl, param);
		ObjectMapper mapper = new ObjectMapper();
		 
		try {
			result = mapper.readValue(resultStr, new TypeReference<Map<String, Object>>(){});
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//발송가능 잔여건수 조회
	public Map<String, Object> smsCnt() {
		Map<String, Object> result = new HashMap<String, Object>();
		String param ="";
		param = "user_id="+userId;
		param += "&key="+key;
		
		String resultStr = PostRequestUtil.sendPostRequest(smsCntUrl, param);
		ObjectMapper mapper = new ObjectMapper();
		 
		try {
			result = mapper.readValue(resultStr, new TypeReference<Map<String, Object>>(){});
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	//예약 취소
	public Map<String, Object> smsCancel(String mId) {
		Map<String, Object> result = new HashMap<String, Object>();
		String param ="";
		param = "user_id="+userId;
		param += "&key="+key;
		param += "&mid="+mId;
		
		String resultStr = PostRequestUtil.sendPostRequest(smsCancelUrl, param);
		ObjectMapper mapper = new ObjectMapper();
		 
		try {
			result = mapper.readValue(resultStr, new TypeReference<Map<String, Object>>(){});
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public static void main(String[] args) throws UnsupportedEncodingException {
		/*
		String word = "인코딩 문제인가? 이클립스 문제인가? WAS문제 인가 그것이 알고 싶다....";
		System.out.println("utf-8 -> euc-kr        : " + new String(word.getBytes("utf-8"), "euc-kr"));
		System.out.println("utf-8 -> ksc5601       : " + new String(word.getBytes("utf-8"), "ksc5601"));
		System.out.println("utf-8 -> x-windows-949 : " + new String(word.getBytes("utf-8"), "x-windows-949"));
		System.out.println("utf-8 -> iso-8859-1    : " + new String(word.getBytes("utf-8"), "iso-8859-1"));
		System.out.println("iso-8859-1 -> euc-kr        : " + new String(word.getBytes("iso-8859-1"), "euc-kr"));
		System.out.println("iso-8859-1 -> ksc5601       : " + new String(word.getBytes("iso-8859-1"), "ksc5601"));
		System.out.println("iso-8859-1 -> x-windows-949 : " + new String(word.getBytes("iso-8859-1"), "x-windows-949"));
		System.out.println("iso-8859-1 -> utf-8         : " + new String(word.getBytes("iso-8859-1"), "utf-8"));
		System.out.println("euc-kr -> utf-8         : " + new String(word.getBytes("euc-kr"), "utf-8"));
		System.out.println("euc-kr -> ksc5601       : " + new String(word.getBytes("euc-kr"), "ksc5601"));
		System.out.println("euc-kr -> x-windows-949 : " + new String(word.getBytes("euc-kr"), "x-windows-949"));
		System.out.println("euc-kr -> iso-8859-1    : " + new String(word.getBytes("euc-kr"), "iso-8859-1"));
		System.out.println("ksc5601 -> euc-kr        : " + new String(word.getBytes("ksc5601"), "euc-kr"));
		System.out.println("ksc5601 -> utf-8         : " + new String(word.getBytes("ksc5601"), "utf-8"));
		System.out.println("ksc5601 -> x-windows-949 : " + new String(word.getBytes("ksc5601"), "x-windows-949"));
		System.out.println("ksc5601 -> iso-8859-1    : " + new String(word.getBytes("ksc5601"), "iso-8859-1"));
		System.out.println("x-windows-949 -> euc-kr     : " + new String(word.getBytes("x-windows-949"), "euc-kr"));
		System.out.println("x-windows-949 -> utf-8      : " + new String(word.getBytes("x-windows-949"), "utf-8"));
		System.out.println("x-windows-949 -> ksc5601    : " + new String(word.getBytes("x-windows-949"), "ksc5601"));
		System.out.println("x-windows-949 -> iso-8859-1 : " + new String(word.getBytes("x-windows-949"), "iso-8859-1"));
		System.out.println("utf-8 -> utf-8 : " + new String(word.getBytes("utf-8"), "utf-8"));
		System.out.println("utf-8 -> utf-8 : " + new String(word.getBytes("euc-kr"), "euc-kr"));
*/
	}
	
}
