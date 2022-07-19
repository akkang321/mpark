<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function userList(){
	$("#frm").attr("action", "/admin/userList");
	$("#frm").submit();
};

function pwInit(){
	var data = $("#frm").serialize();
	$.ajax({
		url: "/admin/userPwInit",
		type: "POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result>0){
				alert("초기화 비번은 1234 입니다.");
			} else {
				alert("수정 실패")
			}
		}
	})
};

function userUpdate(){
	var data = $("#frm").serialize();
	$.ajax({
		url: "/admin/userUpdate",
		type: "POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result>0){
				alert("수정 완료");
				userList();
			} else {
				alert("수정 실패")
			}
		}
	})
};

function userDelete(uId){
	var data = { "uId" : uId };
	$.ajax({
		url:"/admin/userDelete",
		type:"POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if ( result>0 ){
				alert("삭제완료");
				userList();
			} else {
				alert("삭제 실패");
			}
		}
	})
};

function goBack(){
	history.back();
}
</script>

<form id="frm" method="POST">
	<input type="hidden" id="uId" name="uId" value="${userInfo.U_ID}">
	<div class="searchWrap2">
	    <div class="id searchBox">
	        <h2>회원ID</h2>
	        <p class="id-p">${userInfo.U_ID}</p>
	    </div><!--e:searchBox-->

	    <div class="name searchBox">
	        <h2>이름</h2>
	        <input type="text" name="userName" value="${userInfo.USER_NAME}">
	    </div><!--e:searchBox-->
	
	    <div class="tell searchBox">
	        <h2>핸드폰</h2>
	        <input type="text" name="phone" value="${userInfo.PHONE}">
	    </div><!--e:searchBox-->
	
	    <div class="mail searchBox">
	        <h2>메일주소</h2>
	        <input type="text" name="mail" value="${userInfo.EMAIL}">
	    </div><!--e:searchBox-->
	    
		<div class="searchBox">
			<h2>성별</h2>
			<div class="id searchBox search-radioBox">
		        <c:forEach var="list" items="${genderList}">
		       		<input class="search-radio" type="radio" name="gender" value="${list.CODE_ID}" <c:if test="${list.CODE_ID == userInfo.GENDER}">checked="checked"</c:if> >${list.CODE_NAME}
		        </c:forEach>
		    </div>
		</div>
		
		<div class="searchBox">
			<h2>상태</h2>
			<div class="id searchBox search-radioBox">
		        <c:forEach var="list" items="${userStateList}">
		       		<input class="search-radio" type="radio" name="userState" value="${list.CODE_ID}" <c:if test="${list.CODE_ID == userInfo.USER_STATE}">checked="checked"</c:if> >${list.CODE_NAME}
		        </c:forEach>
		    </div>
		</div>
		
		<div class="searchBox">
			<h2>비번초기화</h2>
			<button type="button" class="passwordResetBtn" onclick="pwInit()">비번초기화</button>
		</div>

	</div><!--searchWrap-->

	<div class="btnWrap">
	    <button type="button" class="confirmBtn" onclick="userUpdate()">확인</button>
	    <button type="button" class="deleteBtn" onclick="userDelete('${ userInfo.U_ID }')">삭제</button>
	    <button type="button" class="cancelBtn" onclick="goBack()">취소</button>
	</div><!--e:btnWrap-->

</form>


