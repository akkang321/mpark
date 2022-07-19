<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	function checkData() {
		if (!$('#cTitle').val()) {
			alert('제목을 입력하세요.')
			$('#cTitle').focus();
			return false;
		}
		if (!$('#cContent').val()) {
			alert('내용을 입력하세요.')
			$('#cContent').focus();
			return false;
		}
		return true
	}



	function smsSave(){
		if (!checkData()){ 
			return;
		}
		
		var url = ""; 
		
		if ("${smsContentInfo.C_ID}" == ""){ 
			url = "/admin/messageSmsContentInsert"; 
		} else {
			url = "/admin/messageSmsContentUpdate"; 
		} 
		
		var data = $("#frm").serialize(); 
		
		$.ajax({ 
			url: url, 
			type: "POST", 
			data: data, 
			dataType: "json", 
			success: function( result ){ 

				if (result > 0){ 
					alert("저장완료."); 
					smsContentList(); 
				} else {
					alert("저장 실패");
					smsContentList(); 

				}
			}
		})
	} 


	function smsContentList() {
		$("#frm").attr("action", "/admin/messageSmsContentList"); 
		$("#frm").submit(); 
	} 
	
	
	function smsDelete() {
		var data = $("#frm").serialize(); 
		
		$.ajax({ 
			url: "/admin/messageSmsDelete", 
			type: "POST", 
			data: data, 
			dataType: "json", 
			success: function( result ){ 
				if (result > 0){ 
					alert("삭제 완료.");
					smsContentList(); 
				} else {
					alert("삭제 실패");
					smsContentList(); 
				} 
			}
		})
	} 
</script> 
<form id="frm" method="post" action="">
	<div class="searchWrap2">
		<div class="name searchBox">
			<h2>컨텐츠 ID</h2>
			<input type="text" id="cId" name="cId" value="${ smsContentInfo.C_ID }" <c:if test="${smsContentInfo.C_ID} != ''">readonly="readonly"</c:if>></input>
		</div>
		<!--e:searchBox-->

		<div class="name searchBox" style="width: 1000px;">
			<h2>제목</h2>
			<input type="text" id="cTitle" name="cTitle" style="width: 700px;"  value="${smsContentInfo.C_TITLE}"></input>
		</div>
		<!--e:searchBox-->
	</div>

	<div class="Contents_Box" style="width: 800px; margin: 0 auto; ">
		<div class="name searchBox">
			<h2>내용</h2>
			<textarea id="cContent" name="cContent" class="textarea_Box" >${ smsContentInfo.C_CONTENT }</textarea>
		</div>
	</div>
	<!--e:addBox-->
	<!--searchWrap-->

	<div class="btnWrap"> 
		<button type="button" class="confirmBtn" onclick="smsSave()">확인</button> 
		<c:if test="${ smsContentInfo.C_ID != null and smsContentInfo.C_ID != '' }"> 
			<button type="button" class="deleteBtn" onclick="smsDelete('${ smsContentInfo.C_ID }')">삭제</button> 
		</c:if> 
		<button type="button" class="cancelBtn" onclick="smsContentList();">취소</button> 
	</div> 
	<!--e:btnWrap-->

</form> 


