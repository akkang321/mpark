package com.mpark.common.util;

import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class RestTemplateUtil {


private static String apiUrl = "https://wi2nmk7hlc.execute-api.ap-northeast-2.amazonaws.com/";  
	
public static ResponseEntity<String> sendPostRequest(String url, String token) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "application/json");
		headers.set("Authorization", "Bearer "+token);
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(headers);
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(apiUrl+url, request, String.class);		// amazon에 등록되어 있는 URL를 호출. POST요청 결과로 ResponseEntity로 반환받기.
		
		return responseEntity;
		
	}
	

public static ResponseEntity<String>  sendPostRequest(String url, String token ,MultiValueMap<String, String> param) {
	
	RestTemplate restTemplate = new RestTemplate();

	HttpHeaders headers = new HttpHeaders();
	headers.set("Content-Type", "application/json");
	headers.set("Authorization", "Bearer "+token);

	HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(param, headers); 
	ResponseEntity<String> responseEntity = restTemplate.postForEntity(apiUrl+url, request, String.class);	
											
	return responseEntity;

	}

}


