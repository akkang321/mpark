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
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(apiUrl+url, request, String.class);
		
		return responseEntity;
	}
	
	
	public static Map<String, Object> sendPostRequest(String url, MultiValueMap<String, String> param, String token) {
		
		RestTemplate restTemplete = new RestTemplate();
		
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "application/json");
		headers.set("Authorization", "Bearer "+token);
		
		HttpEntity<MultiValueMap<String, String>> requestMessage = new HttpEntity<>(param, headers);
		Map<String, Object> response = restTemplete.postForObject(url, requestMessage, Map.class) ;
		
		
		return response;
	}
	

	
}
