<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

$(function() {
	$('[name=uploadFile]').change(function(){ 
		setImageFromFile(this); 
	}); 
}) 


function setImageFromFile(input) { 
    if (input.files && input.files[0]) { 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
			$("[name=previewImage]").eq(0).attr("src", e.target.result); 
        } 
       reader.readAsDataURL(input.files[0]); 
    } 
} 


function deleteImg(index){ 
	$("[name=uploadFile]").eq(0).val(""); 
	$("[name=previewImage]").eq(0).attr("src", ""); 
} 


function teacherList(){ 
	$("#frm").attr("action", "/admin/teacherList"); 
	$("#frm").submit(); 
}; 


function pwInit(){ 
	var data = $("#frm").serialize(); 
	$.ajax({ 
		url: "/admin/teacherPwInit", 
		type: "POST", 
		data: data, 
		dataType: "json", 
		success: function( result ){ 
			if( result>0 ){ 
				alert("초기화 비번은 1234 입니다."); 
			}else{ 
				alert("수정 실패"); 
			} 
		} 
	}) 
}; 


function teacherSave(){ 
	if (!checkData()){ 
		return; 
	} 

	var url = ""; 
	if ("${teacherInfo}" != ""){ 
		url = "/admin/teacherUpdate"; 
	} else { 
		url = "/admin/teacherInsert"; 
	} 
	
	var formData = new FormData($("#frm")[0]); 
	$.ajax({ 
		type : "post", 
		enctype: 'multipart/form-data', 
		processData: false, 
		contentType: false, 
		url : url, 
		datatype : "json", 
		data : formData, 
		success: function( result ){ 
			if (result == 99){ 
				alert("이미 가입한 강사입니다."); 
			} else if (result>0){ 
				alert("저장 완료"); 
				teacherList(); 
			} else { 
				alert("저장 실패"); 
			} 
		} 
	}) 
}; 


function teacherDelete(tId){ 
	var data = { "tId" : tId }; 
	$.ajax({ 
		url:"/admin/teacherDelete", 
		type:"POST", 
		data: data, 
		dataType: "json", 
		success: function( result ){
			if (result>0){
				alert("삭제완료");
				teacherList();
			} else {
				alert("삭제 실패");
			}
		}
	})
};


function checkData(){
	if (!$('#tId').val()) {
		alert('강사ID를 입력하세요.');
		$('#tId').focus();
		return false;
	}
	
	if (!$('#teacherName').val()) {
		alert('이름을 입력하세요.');
		$('#teacherName').focus();
		return false;
	}
	
	if (!$('#phone').val()) {
		alert('핸드폰번호를 입력하세요.');
		$('#phone').focus();
		return false;
	}

	if (!$('#email').val()) {
		alert('메일주소를 입력하세요.');
		$('#email').focus();
		return false;
	}
	
	if (!$('#selfIntroduction').val()) {
		alert('강사자기소개를 입력하세요.');
		$('#selfIntroduction').focus();
		return false;
	}
	
	if (!$('#teacherIntroduction').val()) {
		alert('강사소개를 입력하세요.');
		$('#teacherIntroduction').focus();
		return false; 
	}
	
	return true;
} 


function goBack(){ 
	teacherList(); 
} 


function changeImgs(input){			// input is this <input>
	setImageFromFiles(input, $("[name=uploadFiles]").index(input));
}


function setImageFromFiles(input, index) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$("[name=previewImages]").eq(index).attr("src", e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}


function deleteImgs(idx){
	deleteById("imgDiv"+idx);
}


function deleteImgs(idx, fileId){
	$('#deleteId').val($('#deleteId').val()+","+fileId);
	deleteById("imgDiv"+idx);
}


// video onChange
function changeVideos(input){
	setVideoFromVideos(input, $("[name=uploadVideos]").index(input));
}


// video preview. FileReader보다 더 빠름.
function setVideoFromVideos(input, index) {
	if(input.files && input.files[0]) {
		const video = $("[name=videoTag]").eq(index);
		video.attr("src", URL.createObjectURL(event.target.files[0]));
	}
}


// video delete
function deleteVideos(idx){
	deleteById("videoDiv"+idx);
}
	
	
// video delete2
function deleteVideos(idx, videoId){
	$('#deleteId').val($('#deleteId').val()+","+videoId);
	deleteById('videoDiv'+idx);
}


var size = "${fileSize}"; 
if(size == ""){
	size = 1;
}


function addImg(){
	var html =	'<div id="imgDiv'+size+'" class="addImgWrap addImgWrap2">                               '+
				'	<input type="hidden" name="fileIds" value="">                                                               	'+
				'	<div class="addBox">                                                               	'+
				'    	<h2>이미지</h2>                                                                	'+
				'    	<div class="btnBox">                                                           	'+
				'	        <span class="btn-file">이미지 추가<input type="file" name="uploadFiles"  onchange="changeImgs(this)"></span>	'+ 
				'			<span class="btn-del" id="btn'+size+'" onclick="deleteImgs('+size+');">삭제</span>                   	'+
				'		</div>                                                                         	'+
				'	</div>                                                            	'+
				'	<div class="imgBox">                                                               	'+
				'		<img src="" name="previewImages">                                               '+
				'	</div>                                                                             	'+
				'</div>                                                                                	';
	$('#imgList').append(html);
	size++;
}


function addVideos(){ 
	var html =	'<div id="videoDiv'+size+'" class="addImgWrap addImgWrap2">                             '+
				'	<input type="hidden" name="videoIds" value="">                                      '+
				'	<div class="addBox">                                                               	'+
				'    	<h2>동영상</h2>                                                                	'+
				'    	<div class="btnBox">                                                           	'+
				'	        <span class="btn-file">동영상 추가<input type="file" id="uploadVideos" name="uploadVideos" accept="video/mp4, video/mkv, video/x-m4v, video/*" onchange="changeVideos(this)" /></span>	'+			
				'			<span class="btn-del" id="btn'+size+'" onclick="deleteVideos('+size+');">삭제</span>                   	'+
				'		</div>                                                                         	'+
				'	</div>                                                            	'+


<!--				'	<div class="videoBox" style="width: 250px; height: 240px; background-color: lightgray; border: 1px solid gray; margin-left:70px">    '+-->
					'	<div class="videoBox" style="width: 250px; height: 240px; margin-left:70px">	'+ 
				'		<video width="250px" height="240px" id="videoTag" name="videoTag" autoplay loop="true" controls></video>   '+ 
				'	</div>                                                                             	'+ 
				'</div>                                                                                	'; 
	$('#videoList').append(html);
	size++;
}

var size = "${fileSize}";
if(size == ""){
	size = 1;
}


</script>

<form id="frm" method="post" action="" enctype="multipart/form-data">
	<input type="hidden" id="fileId" name="fileId" value="${teacherInfo.PHOTO_ID}">
	<input type="hidden" id="deleteId" name="deleteId" value="0">
	<div class="searchWrap2">
	    <div class="id searchBox">
	        <h2>강사ID</h2>
	        <c:choose>
				<c:when test="${teacherInfo.T_ID != null and teacherInfo.T_ID !=''}">
					<p class="id-p">${teacherInfo.T_ID}</p>
					 <input type="hidden" id="tId" name="tId" value="${teacherInfo.T_ID}"> 
				</c:when>
				<c:otherwise>
					 <input type="text" id="tId" name="tId" value="${teacherInfo.T_ID}"> 
				</c:otherwise>
			</c:choose>
	    </div>

	    <div class="name searchBox">
	        <h2>이름</h2>
	        <input type="text" id="teacherName" name="teacherName" value="${teacherInfo.TEACHER_NAME}">
	    </div><!--e:searchBox-->

	    <div class="tell searchBox">
	        <h2>핸드폰</h2>
	        <input type="text" id="phone" name="phone" value="${teacherInfo.PHONE}">
	    </div><!--e:searchBox-->

	    <div class="mail searchBox">
	        <h2>메일주소</h2>
	        <input type="text" id="email" name="email" value="${teacherInfo.EMAIL}">
	    </div><!--e:searchBox-->

	  	<div class="mail searchBox">
	        <h2>동영상</h2>
	        <input type="text" id="videoUrl" name="videoUrl" value="${teacherInfo.VIDEO_URL}">
	    </div><!--e:searchBox-->

		<div class="searchBox">
			<h2>상태</h2>
			<div class="id searchBox search-radioBox"> 
		        <c:forEach var="list" items="${teacherStateList}"> 
		       		<input class="search-radio" type="radio" name="teacherState" value="${list.CODE_ID}" <c:if test="${list.CODE_ID == teacherInfo.TEACHER_STATE}">checked="checked"</c:if> >${list.CODE_NAME}
		        </c:forEach>
		    </div>
		</div>
		
		<c:if test="${teacherInfo.T_ID != null and teacherInfo.T_ID !=''}"> 
			<div class="searchBox">
				<h2>비번초기화</h2>
				<button type="button" class="passwordResetBtn" onclick="pwInit()">비번초기화</button> 
			</div>
		</c:if>

		<div class="searchBox">
			<h2>크루여부</h2>
			<div class="id searchBox search-radioBox">
		    	<c:forEach var="list" items="${teacherCrewList}">
		       		<input class="search-radio" type="radio" name="crewYn" value="${list.CODE_ID}" <c:if test="${list.CODE_ID == teacherInfo.CREW_YN}">checked="checked"</c:if> >${list.CODE_NAME}
		        </c:forEach>
		    </div>
		</div>

		<div class="name searchBox">
	        <h2>강사자기소개</h2>
	        <textarea id="selfIntroduction" name="selfIntroduction" cols="40" rows="20">${ teacherInfo.SELF_INTRODUCTION }</textarea> 
	    </div><!--e:searchBox-->

	   	<div class="name searchBox">
	        <h2>강사소개</h2>
	        <textarea id="teacherIntroduction" name="teacherIntroduction" cols="40" rows="20">${ teacherInfo.TEACHER_INTRODUCTION }</textarea> 
	    </div><!--e:searchBox-->

	<div class="addImgWrap addImgWrap2">
	    <div class="addBox">
	        <h2>메인 이미지</h2>
	        <div class="btnBox">
		        <span class="btn-file">이미지 추가<input type="file" name="uploadFile" onchange="changeImg(this)" accept="image/*" value=""></span> 
				<span class="btn-del" onclick="deleteImg(0);">삭제</span>
			</div>
	    </div><!--e:addBox-->
		<div class="imgBox">
			<c:set var="myImg" />
			<c:if  test="${teacherInfo.PHOTO_PATH != null}">
				<c:set var="myImg">myImg${teacherInfo.PHOTO_PATH}</c:set> 
			</c:if>
		     <img src="${myImg}" name="previewImage" alt="">
		</div><!--e:imgBox-->

	</div><!--e:addImgWrap-->

	</div><!--searchWrap-->

<!--e:explanationWrap-->
	<div id="imgList">
		<c:forEach var="list" items="${ fileList }" varStatus="status">
			<c:set var="myImg" />
				<c:if  test="${ list.FILE_PATH != null }">
					<c:set var="myImg">myImg${ list.FILE_PATH }</c:set>
				</c:if>

				<div class="addImgWrap addImgWrap2" id="imgDiv${ status.index }">
					<input type="hidden" name="fileIds" value="${ list.FILE_ID }"> 
				<div class="addBox">
					<h2>이미지</h2>
					<div class="btnBox">
						<span class="btn-file">이미지 추가<input type="file" name="uploadFiles" onchange="changeImg(this)" accept="image/*" value=""></span> 
						<span class="btn-del" onclick="deleteImgs(${ status.index }, ${ list.FILE_ID });">삭제</span> 
					</div>
				</div><!--e:addBox-->
				<div class="imgBox">
					<img src="${ myImg }" name="previewImages" alt=""> 
				</div><!--e:imgBox-->
				</div><!--e:addImgWrap-->
		</c:forEach>
	</div>
<!--e:addImgWrap-->



	<div class="searchWrap2">
		<div class="searchBox">
			  <h2>이미지</h2>
			<button type="button" class="confirmBtn2" onclick="addImg()">신규이미지</button> 
		</div>
	</div>



<!-- video -->
	<div id="videoList">
		<c:forEach var="list" items="${ videoList }" varStatus="status"> 
			<c:set var="myVideo" />
				<c:if  test="${ list.FILE_PATH != null }">
					<c:set var="myVideo">myImg${ list.FILE_PATH }</c:set> 
				</c:if>

				<div class="addImgWrap addImgWrap2" id="videoDiv${ status.index }"> 
					<input type="hidden" name="videoIds" value="${ list.FILE_ID }"> 
				<div class="addBox">
					<h2>동영상</h2>
					<div class="btnBox">
						<span class="btn-file">동영상 추가<input type="file" name="uploadVideos" onchange="changeVideos(this)" accept="video/mp4, video/mkv, video/x-m4v, video/*" value=""></span> 
						<span class="btn-del" onclick="deleteVideos(${ status.index }, ${ list.FILE_ID });">삭제</span>
					</div>
				</div><!--e:addBox-->
				<!--<div class="videoBox" style="width: 250px; height: 240px; background-color: lightgray; border: 1px solid gray; margin-left:70px">-->
				<div class="videoBox"style="margin-left:70px">
				<video width="250px" height="250px" id="videoTag" name="videoTag" autoplay="true" loop="true" muted controls> 
					<source src="${ myVideo }" name="previewVideos" alt=""></source> 
				</video> 
				</div><!--e:imgBox--> 
				</div><!--e:addImgWrap--> 
		</c:forEach> 
	</div> 



	<div class="searchWrap2"> 
		<div class="searchBox"> 
		        <h2>동영상</h2> 
		        <button type="button" class="confirmBtn2" onclick="addVideos()">신규동영상</button> 
		</div><!--e:searchBox-->
	</div>

	<div class="btnWrap"> 
	    <button type="button" class="confirmBtn" onclick="teacherSave()">확인</button> 
	    <c:if test="${ teacherInfo.T_ID != null and teacherInfo.T_ID !='' }"> 
		    <button type="button" class="deleteBtn" onclick="teacherDelete('${ teacherInfo.T_ID }')">삭제</button> 
	    </c:if> 
	    <button type="button" class="cancelBtn" onclick="goBack()">취소</button> 

	</div><!--e:btnWrap--> 

</form> 


