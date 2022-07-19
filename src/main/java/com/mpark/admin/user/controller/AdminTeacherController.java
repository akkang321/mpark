package com.mpark.admin.user.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mpark.admin.user.service.AdminTeacherService;
import com.mpark.common.service.CodeService;
import com.mpark.common.util.FileUploadUtil;
import com.mpark.common.util.PageUtil;
import com.mpark.common.util.SecurityUtil;
import com.mpark.common.util.StringUtil;

@Controller
@SessionAttributes("userInfo")
public class AdminTeacherController {
	@Autowired
	AdminTeacherService adminTeacherService;
	@Autowired
	CodeService codeService;
	@Autowired
	FileUploadUtil fileUtil;
	
	@RequestMapping(value = { "/admin/teacherList" }) 
	public ModelAndView teacherList(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		
		int teacherCnt = adminTeacherService.teacherCnt(param);
		PageUtil page = new PageUtil();
		page.setPageNo(Integer.parseInt(StringUtil.nvl(param.get("pageNo"), "1")));
		page.setPageSize(10); 
		page.setTotalCount(teacherCnt);
		param.put("S_CNT", page.getsCnt());
		param.put("E_CNT", page.getPageSize());
		mv.addObject("page", page);
		
		List<Map<String, Object>> teacherList = adminTeacherService.teacherList(param); 
		mv.addObject("teacherList", teacherList);
		mv.setViewName("/admin/user/teacher/teacherList");
		return mv;
	}

	@RequestMapping("/admin/teacherInfo")
	public ModelAndView teacherInfo(@RequestParam Map<String, Object> param, ModelAndView mv) throws Exception { 
		List<Map<String, Object>> teacherStateList = codeService.getCode("C040000");
		mv.addObject("teacherStateList", teacherStateList);
		
		List<Map<String, Object>> teacherCrewList = codeService.getCode("C150000"); 
		mv.addObject("teacherCrewList", teacherCrewList);
		
		String tId = StringUtil.nvl(param.get("tId"));
		Map<String, Object> teacherInfo = adminTeacherService.teacherInfo(tId);
		mv.addObject("teacherInfo", teacherInfo);

// file list
		List<Map<String, Object>> fileList = adminTeacherService.filePaths(tId);
		mv.addObject("fileList", fileList);
		
// video list
		List<Map<String, Object>> videoList = adminTeacherService.videoPaths(tId);
		mv.addObject("videoList", videoList);
		
		mv.setViewName("/admin/user/teacher/teacherInfo");
		return mv; 
	}

	@RequestMapping("/admin/teacherInsert")
	@ResponseBody
	public int teacherInsert(@RequestParam Map<String, Object> param, MultipartFile uploadFile, @ModelAttribute("userInfo") Map<String, Object> userInfo, MultipartHttpServletRequest mRequest, ModelAndView mv) throws Exception { 
		int result = adminTeacherService.checkTId(param);
		if (result==0) {
			param.put("pwInit", SecurityUtil.sha256(StringUtil.nvl(1234)));
			result = adminTeacherService.teacherInsert(param);

// 단일 사진 업로드
			if(uploadFile != null) {
				Map<String, String> returnMap = fileUtil.uploadFile(uploadFile, "I", "", StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId")));			// 신규할 때 
				param.put("fileId", returnMap.get("fileId")); 
				String fileId = returnMap.get("fileId"); 
				adminTeacherService.teacherUpdateFileId(param);
			}
			
			List<MultipartFile> fileList = mRequest.getFiles("uploadFiles");
			
			String[] fileIds = mRequest.getParameterValues("fileIds");
			
//			fileUtil.deleteFiles(StringUtil.nvl(param.get("deleteId"))); 
			if (fileList.size() != 0) { 
				for (int i=0; i<fileIds.length; i++) { 
					MultipartFile file = fileList.get(i);
					if (!fileIds[i].equals("") && !file.isEmpty()) { 
						fileUtil.uploadFile(file, "U", fileIds[i], StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId")));
				}else if (!file.isEmpty()) {
					fileUtil.uploadFile(file, "I", "", StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId")));
				}
			}
		}

// videos upload
			List<MultipartFile> videoList = mRequest.getFiles("uploadVideos"); 
			fileUtil.uploadFiles(videoList, "I", "", StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId"))); 

			return result;
		} else {
			return 99;
		}
	}

	@RequestMapping(value = "/admin/teacherPwInit")
	@ResponseBody
	public int teacherPwInit(@RequestParam Map<String, Object> param) throws Exception { 
		String pwInit = SecurityUtil.sha256(StringUtil.nvl(1234));
		param.put("pwInit", pwInit);
		return adminTeacherService.teacherPwInit(param);
	}

	@RequestMapping(value = "/admin/teacherUpdate")
	@ResponseBody
	public int teacherUpdate( @RequestParam Map<String, Object> param, List<MultipartFile> uploadFile, MultipartHttpServletRequest mRequest, @ModelAttribute("userInfo") Map<String, Object> userInfo ) throws Exception { 
		String fileId = StringUtil.nvl(param.get("fileId"));
		if(uploadFile != null) {
			if (fileId.equals("")) {
				Map<String, String> returnMap = fileUtil.uploadFiles(uploadFile, "I", "", StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId")));			// 신규할때
				param.put("fileId", returnMap.get("fileId"));
			} else {
				/*f (StringUtil.nvl(param.get("previewImage")).equals("")) {
					fileUtil.deleteFile(fileId);
					param.put("fileId", "");
				} else {*/ 
					Map<String, String> returnMap = fileUtil.uploadFiles(uploadFile, "U", StringUtil.nvl(param.get("fileId")), StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId")));			//수정시
					param.put("fileId", returnMap.get("fileId"));
			/*	}*/
			}
		}

		List<MultipartFile> fileList = mRequest.getFiles("uploadFiles");
		
			String[] fileIds = mRequest.getParameterValues("fileIds");
			
			fileUtil.deleteFiles(StringUtil.nvl(param.get("deleteId"))); 
			if (fileList.size() != 0) { 
				for (int i=0; i<fileIds.length; i++) { 
					MultipartFile file = fileList.get(i);
					if (!fileIds[i].equals("") && !file.isEmpty()) { 
						fileUtil.uploadFile(file, "U", fileIds[i], StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId")));
				}else if (!file.isEmpty()) {
						fileUtil.uploadFile(file, "I", "", StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId")));
				}
			}
		}

// video list update
		List<MultipartFile> videoList = mRequest.getFiles("uploadVideos");
		String[] videoIds = mRequest.getParameterValues("videoIds");
		fileUtil.deleteFiles(StringUtil.nvl(param.get("deleteId"))); 
		if (videoList.size() != 0) { 
			for (int i=0; i<videoIds.length; i++) { 
				MultipartFile video = videoList.get(i);
				if (!videoIds[i].equals("") && !video.isEmpty()) {
					fileUtil.uploadFile(video, "U", videoIds[i], StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId")));
			}else if (!video.isEmpty()) {
				fileUtil.uploadFile(video, "I", "", StringUtil.nvl(param.get("tId")), "TEACHER_INFO", StringUtil.nvl(userInfo.get("uId")));
			}
		}
	}

		return adminTeacherService.teacherUpdate(param);
	}

	@RequestMapping(value = "/admin/teacherDelete")
	@ResponseBody
	public int teacherDelete(@RequestParam Map<String, Object> param) throws Exception {
		String tPath = adminTeacherService.selectTeacherPath(param);
		File file = new File("C:\\FILE\\"+tPath);
		if(file.exists()) {
			file.delete();
		}

		List<Map<String, String>> fPathList = adminTeacherService.selectFilePath(param);
		int size = fPathList.size();
		for(int i=0; i<size; i++) {
			File files = new File("C:\\FILE\\"+fPathList.get(i).get("FILE_PATH"));
			if(files.exists()) {
				files.delete();
			}
		}

		adminTeacherService.fileInfoDelete(param);
		adminTeacherService.teacherDelete(param);
		return 1;
	}
}


