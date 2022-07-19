<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	
	function bbsNoticeDelete(bId){
		var data = { "bId" : bId };
		$.ajax({
			url:"/admin/bbsNoticeDelete",
			type:"POST",
			data: data,
			dataType: "json",
			success: function( result ){
				if (result>0){
					alert("삭제완료");
					bbsNoticeList();
				} else {
					alert("삭제실패");
				}
			}
		})
	};
	
	function bbsNoticeList() {
		$("#frm").attr("action", "/admin/bbsNoticeList"); 
		$("#frm").submit();
	}
	
	function goBack(){
		bbsNoticeList();
	}
	
	function bbsNoticeSave(bId){ 
		var data = $("#frm").serialize();
		// update
		
		console.log(bId);
		
		if(bId!=null && bId!="") { 
			
			console.log("update");
			$.ajax({
				url: "/admin/bbsNoticeUpdate", 
				type: "POST", 
				data: data, 
				dataType: "json", 
				success: function( result ){ 
					if( result > 0 ){ 
						alert("수정완료"); 
					}else{ 
						alert("수정실패"); 
					}
				}
			})
		} else {
			// insert
			if(bId==null || bId=="") {
				$.ajax({
					url: "/admin/bbsNoticeInsert", 
					type: "POST", 
					data: data, 
					dataType: "json", 
					success: function( result ){ 
						if( result > 0 ){ 
							alert("게시글등록완료"); 
							bbsNoticeList(); 
						}else{ 
							alert("게시글등록실패"); 
						}
					}
				})
			}
		}
	}
	
</script>



<form id="frm" method="post">
<input type="hidden" id="bId" name="bId" value="${ bbsNoticeInfo.B_ID }">
<input type="hidden" id="uId" name="uId" value="">
	<div class="searchWrap2">
	    <div class="id searchBox">
	        <h2>글쓴이 ID</h2>
			<input type="text" id="uId" name="uId" value="${ userInfo.U_ID }">
	    </div>

	    <div class="name searchBox">
	        <h2>글 제목</h2>
	        <input type="text" id="title" name="title" value="${ bbsNoticeInfo.TITLE }"> 
	    </div><!--e:searchBox-->

		<div class="name searchBox"> 
	        <h2>게시글</h2>
	        <textarea id="contents" name="contents" cols="40" rows="20">${ bbsNoticeInfo.CONTENTS }</textarea> 
	    </div><!--e:searchBox-->


	</div><!--searchWrap-->


	<div class="btnWrap">
		<c:if test="${ bbsNoticeInfo.B_ID != null or bbsNoticeInfo.B_ID != '' }">
		<button type="button" class="confirmBtn" onclick="bbsNoticeSave('${ bbsNoticeInfo.B_ID }')">확인</button>
		</c:if>
	    <c:if test="${ bbsNoticeInfo.B_ID != null and bbsNoticeInfo.B_ID !='' }">
		    <button type="button" class="deleteBtn" onclick="bbsNoticeDelete('${ bbsNoticeInfo.B_ID }')">삭제</button>
	    </c:if>
	    <button type="button" class="cancelBtn" onclick="goBack()">취소</button>
	</div><!--e:btnWrap-->

</form>


