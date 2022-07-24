package com.mpark.common.util;

import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class RestTemplateUtil {
	
public static Map<String, Object> sendPostRequest(String url, String token) {
		
		RestTemplate restTemplete = new RestTemplate();
		
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "application/json");
		headers.set("Authorization", "Bearer "+token);
		
		HttpEntity<?> requestMessage = new HttpEntity<>( headers);
		ResponseEntity<Map> response = restTemplete.postForEntity(url, requestMessage, Map.class);
		
		return (Map<String, Object>) response;
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
