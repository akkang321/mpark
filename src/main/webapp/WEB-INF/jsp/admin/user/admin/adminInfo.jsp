<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function adminList(){
	$("#frm").attr("action", "/admin/adminList");
	$("#frm").submit();
};

function adminSave(){ 
	if (!checkData()){ 
		return;
	}
	
	var url = "";
	if ("${adminInfo}" == ""){
		url = "/admin/adminInsert";
	} else {
		url = "/admin/adminUpdate";
	}
	var data = $("#frm").serialize();
	
	$.ajax({
		url: url,
		type: "POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result == 99){
				alert("이미 가입한 관리자입니다.");
			} else if (result>0){
				alert("저장 완료");
				adminList();
			} else {
				alert("저장 실패")
			}
		}
	})
} 

function adminDelete(){
	var data = $("#frm").serialize();
	$.ajax({
		url:"/admin/adminDelete",
		type:"POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result>0){
				alert("삭제완료");
				adminList();
			} else {
				alert("삭제 실패");
			}
		}
	})
};

function checkData(){
	if (!$('#uId').val()) {
		alert('관리자ID를 입력하세요.')
		$('#uId').focus();
		return false;
	}
	
	if (!$('#userName').val()) {
		alert('이름을 입력하세요.');
		$('#userName').focus();
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

	if ("${adminInfo}" == "" && !$('#userPw').val() ){
		alert('비번을 입력하세요.');
		$('#userPw').focus();
		return false;
	}
	return true;
}

function goBack(){
	history.back();
}

</script>

<form id="frm" method="POST" action="/admin/adminAdd">
	<div class="searchWrap2">
	    <div class="id searchBox">
	        <h2>관리자ID</h2>
	        <c:choose>
				<c:when test="${adminInfo != null}">
					<p class="id-p">${adminInfo.U_ID}</p>
					 <input type="hidden" id="uId" name="uId" value="${adminInfo.U_ID}"> 
				</c:when>
				<c:otherwise>
					 <input type="text" id="uId" name="uId">
				</c:otherwise>
			</c:choose>
	    </div><!--e:searchBox-->

	    <div class="name searchBox">
	        <h2>이름</h2>
	        <input type="text" id="userName" name="userName" value="${adminInfo.USER_NAME}"> 
	    </div><!--e:searchBox-->
	
	    <div class="tell searchBox">
	        <h2>핸드폰</h2>
	        <input type="text" id="phone" name="phone" value="${adminInfo.PHONE}"> 
	    </div><!--e:searchBox-->
	
	    <div class="mail searchBox">
	        <h2>메일주소</h2>
	        <input type="text" id="email" name="email" value="${adminInfo.EMAIL}"> 
	    </div><!--e:searchBox-->

		<div class="pw searchBox">
	        <h2>비번</h2>
	        <input type="text" id="userPw" name="userPw">
	    </div><!--e:searchBox-->
		

	</div><!--searchWrap-->

	<div class="btnWrap">
	    <button type="button" class="confirmBtn" onclick="adminSave()">확인</button>
		<c:if test="${adminInfo != null}">
	    	<button type="button" class="deleteBtn" onclick="adminDelete()">삭제</button>
		</c:if>
	    <button type="button" class="cancelBtn" onclick="goBack()">취소</button>
	</div><!--e:btnWrap-->

</form>


