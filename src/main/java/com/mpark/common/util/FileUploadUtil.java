package com.mpark.common.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import com.mpark.common.service.FileService;


@Controller
public class FileUploadUtil {

	Logger log = LoggerFactory.getLogger(FileUploadUtil.class);
	@Value("${serverPath}") private String serverPath;
	
	@Autowired
	FileService fileService;
	
	//[file : file] [type : I 신규 ,U 수정] [fileId : file ID] [fileUseId : 현재 테이블에서 사용하는 ID ] [fileUseTable : 현재 사용하는 테이블 ] [uId : 사용자 ID]
	public Map<String, String> uploadFile(MultipartFile file, String type, String fileId, String fileUseId, String fileUseTable, String uId) throws Exception {
		HashMap<String, String> returnMap = new HashMap<String, String>();
		
		if (!file.isEmpty()) { 
			if (fileUseTable.equals("")) { 
				fileUseTable = "other";
			}
			String filePath = "";
			String uploadFile = "";
			if(StringUtil.isWindows()) {
				uploadFile = "C:"+File.separator+"FILE";
			} else {
				uploadFile = serverPath;
			}
			try {
				byte[] bytes = file.getBytes();
				filePath = filePath+File.separator+fileUseTable;
				
				File dir = new File(uploadFile+File.separator+fileUseTable);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				
				String fileOrgName = file.getOriginalFilename();
				String fileName = System.currentTimeMillis() + "_" + fileOrgName;
				uploadFile = uploadFile + filePath + File.separator + fileName;
				File serverFile = new File(uploadFile);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("fileName", fileName);
				param.put("fileOrgName", fileOrgName);
				param.put("fileSize", file.getSize());
				param.put("filePath", filePath);
				param.put("fileType", fileOrgName.substring(fileOrgName.lastIndexOf(".")+1));
				param.put("fileUseTable", fileUseTable);
				param.put("fileImage", fileTypeIsImage(StringUtil.nvl(param.get("fileType"))));			// I or U
				param.put("fileUseId", fileUseId);			// tId
				param.put("uId", uId);
				param.put("fileId", fileId);			
				
				boolean bool = false;
				if (type.equals("I")) {
					bool = fileService.fileInsert(param);
					returnMap.put("fileId", StringUtil.nvl(param.get("fileId")));

				} else if (type.equals("U")) {
					Map<String, Object> fileMap = fileService.fileSelect(fileId);			// 해당 이미지 정보(FILE_INFO)
					bool = fileService.fileUpdate(param);
					if (bool) {			// String정보 업데이트 성공 시
						returnMap.put("deleteResult", deleteFile(StringUtil.nvl(fileMap.get("FILE_PATH")), StringUtil.nvl(fileMap.get("FILE_NAME")))+"");
					}
				}
				returnMap.put("result", bool + "");
			} catch (Exception e) {
				returnMap.put("result", e.getMessage());
			}
		} else {
			returnMap.put("result", "no file");
		}
		return returnMap;
	}

	
	public Map<String, String> uploadFiles(List<MultipartFile>  files, String type, String fileId, String fileUseId, String fileUseTable, String uId) throws Exception { 
		HashMap<String, String> returnMap = new HashMap<String, String>();
		
		if (files.size() > 0) {
			if (fileUseTable.equals("")) {
				fileUseTable = "other";
			}
			String uploadOrgFile = "";
			if(StringUtil.isWindows()) {
				uploadOrgFile = "C:"+File.separator+"FILE";
			} else {
				uploadOrgFile = serverPath;
			}
			try {
				for(MultipartFile file : files) {
					if (!file.isEmpty()) {
						String filePath = "";
						byte[] bytes = file.getBytes();
						filePath = filePath+File.separator+fileUseTable;
						
						File dir = new File(uploadOrgFile+File.separator+fileUseTable);
						if (!dir.exists()) {
							dir.mkdirs();
						}

						String fileOrgName = file.getOriginalFilename();
						String fileName = System.currentTimeMillis() + "_" + fileOrgName;
						String uploadFile = uploadOrgFile +filePath + File.separator + fileName;

						File serverFile = new File(uploadFile);
						BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
						stream.write(bytes);
						stream.close();

						Map<String, Object> param = new HashMap<String, Object>();
						param.put("fileName", fileName);
						param.put("fileOrgName", fileOrgName);
						param.put("fileSize", file.getSize());
						param.put("filePath", filePath);
						param.put("fileType", fileOrgName.substring(fileOrgName.lastIndexOf(".")+1));
						param.put("fileUseTable", fileUseTable);
						param.put("fileImage", fileTypeIsImage(StringUtil.nvl(param.get("fileType"))));
						param.put("fileUseId", fileUseId);
						param.put("uId", uId);
						param.put("fileId", fileId);

						boolean bool = false;
						if (type.equals("I")) { 
							bool = fileService.fileInsert(param);
							returnMap.put("fileId", StringUtil.nvl(param.get("fileId")));

						} else if (type.equals("U")) { 
							Map<String, Object> fileMap = fileService.fileSelect(fileId);
							bool = fileService.fileUpdate(param);
							if (bool) {
								returnMap.put("deleteResult", deleteFile(StringUtil.nvl(fileMap.get("FILE_PATH")),StringUtil.nvl(fileMap.get("FILE_NAME")))+"");
							}
						}
						returnMap.put("result", bool+"");
					}
				}
			} catch (Exception e) {
				returnMap.put("result", e.getMessage());
			}
		} else {
			returnMap.put("result", "no file");
		}
		return returnMap;
	}

	public boolean deleteFile(String filePath, String fileName) {
		if(StringUtil.isWindows()) {
			filePath = "C:"+File.separator+"FILE"+filePath;
		}
		File file = new File(filePath + File.separator + fileName);
		if (file.isFile() && file.exists()) {
			file.delete();
			return true;
		} else {
			return false;
		}
	}
	
	public boolean deleteFile(String fileId) {

		Map<String, Object> fileMap = fileService.fileSelect(fileId);
		if (fileMap != null) { 
			String fileName = StringUtil.nvl(fileMap.get("FILE_NAME"));
			String filePath = StringUtil.nvl(fileMap.get("FILE_PATH"));
			if(StringUtil.isWindows()) {
				filePath = "C:"+File.separator+"FILE"+filePath;
			} 
			
			File file = new File(filePath + File.separator + fileName); 
			if (file.isFile() && file.exists()) {
				file.delete();
				fileService.fileDelete(fileId);
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	public boolean deleteFiles(String deleteIds) {
		boolean result = false;
		String[] fileIds = deleteIds.split(",");
		
		for (String fileId : fileIds) {
			result = deleteFile(fileId);
		}
		return result;
	}
	
	public String fileTypeIsImage(String fileType) {
		fileType = fileType.toUpperCase();
		if (fileType.equals("AI")||fileType.equals("BMP")||fileType.equals("JPG")||fileType.equals("PNG")||fileType.equals("GIF")||fileType.equals("JPEG")||fileType.equals("JFIF")||fileType.equals("TIFF")) {
			return "Y";
		} else {
			return "N";
		}
	}
}


