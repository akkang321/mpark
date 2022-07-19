package com.mpark.common.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class CKEdiorController {

	@RequestMapping(value = "/admin/ckupload")
	@ResponseBody
	public String ckupload(Model model, @RequestParam(value = "upload", required = false) MultipartFile fileload, HttpServletRequest req) throws Exception {

		// 서버에 파일을 저장할 때에는 파일명을 시간값으로 변경
		// DB에 저장할 때에는 원본 파일명과 시간값을 모두 저장
		// filename 취득
		String filename = fileload.getOriginalFilename();

		// upload 경로 설정(tomcat realpath)
		String fuploadPath = req.getServletContext().getRealPath("/file/ckeditor");
		File file = new File(fuploadPath + "\\" + filename);

		try {
			//실제 파일이 업로드 되는 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes() );
			return "{ \"uploaded\" : true, \"url\" : \"http://localhost/img/ckupload/" + filename + "\"}";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			return "{ \"uploaded\" : false, \"error\": { \"message\": \"업로드 중 에러가 발생했습니다. 다시 시도해 주세요.\" } }";
		}
	}
}
