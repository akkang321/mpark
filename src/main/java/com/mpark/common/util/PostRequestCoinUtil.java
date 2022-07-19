package com.mpark.common.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class PostRequestCoinUtil {
	public static String sendPostRequest(String reqURL, String sendData, String header) {
		HttpURLConnection httpURLConnection = null;
		OutputStream out = null;
		InputStream in = null;
		int responseCode = 0;
		try {
			URL sendUrl = new URL(reqURL);
			httpURLConnection = (HttpURLConnection) sendUrl.openConnection();

			// header 세팅
			httpURLConnection.setRequestMethod("POST");
			httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpURLConnection.setRequestProperty("SecretHeader", header);

			httpURLConnection.setDoOutput(true);
			httpURLConnection.setUseCaches(false);

			// 본문에 전달
			out = httpURLConnection.getOutputStream();
			out.write(sendData.getBytes("UTF-8"));
			out.flush();

			responseCode = httpURLConnection.getResponseCode();
			in = httpURLConnection.getInputStream();

			String inputLine = null;
			StringBuffer return_str = new StringBuffer();
			BufferedReader httpReader = new BufferedReader(new InputStreamReader(in));

			while ((inputLine = httpReader.readLine()) != null) {
				return_str.append(inputLine).append("\n");
			}
			
			System.out.println(return_str.toString());
			
			return return_str.toString();

		} catch (Exception e) {
			System.out.println("[" + reqURL + "]통신에러");
			e.printStackTrace();
			return responseCode + "`" + "Failed`";
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (Exception e) {
					System.out.println("out 에러");
					e.printStackTrace();
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (Exception e) {
					System.out.println("in 에러");
					e.printStackTrace();
				}
			}
			if (httpURLConnection != null) {
				httpURLConnection.disconnect();
				httpURLConnection = null;
			}
		}
	}
}
