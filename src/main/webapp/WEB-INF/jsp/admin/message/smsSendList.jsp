<!DOCTYPE html> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script> 
	function goPage(pageNo){ 
		$("#pageNo").val(pageNo); 
		$("#frm").attr("action", "/admin/messageSmsSendList"); 
		$("#frm").submit(); 
	} 
</script> 
<form id="frm" method="POST" action="/admin/messageSmsSendList"> 
<input type="hidden" id="pageNo" name="pageNo" value=""> 
	<div class="searchWrap"> 
    	<div class="id searchBox"> 
    	<h2>회원ID</h2>
    		<input type="text" id="sUId" name="sUId" value="${ param.sUId }" placeholder="회원ID"> 
        </div><!--e:searchBox--> 
		
		<div class="id searchBox">
    	<h2>이름</h2>
    		<input type="text" id="sUserName" name="sUserName" value="${ param.sUserName }" placeholder="이름">
        </div><!--e:searchBox-->
        
        <div class="id searchBox">
    	<h2>전화번호</h2>
    		<input type="text" id="sPhone" name="sPhone" value="${ param.sPhone }" placeholder="전화번호">
        </div><!--e:searchBox-->

		<button type="submit" class="searchBtn">검색</button> 

	</div><!--searchWrap--> 

    <table class="tableWrap"> 
    	<tr>
    		<th>발송ID</th> 
        	<th>발송제목</th> 
        	<th>수신자ID</th> 
        	<th>수신자명</th> 
        	<th>핸드폰번호</th> 
        	<th>문자유형</th> 
        	<th>MID</th>
        	<th>리턴코드</th>
        	<th>리턴메시지</th>
        	<th>발송날짜</th> 
    	</tr> 
		<c:forEach var="list" items="${smsSendList}"> 
        	<tr>
        		<td>${list.SEND_ID}</td>
        		<td>${list.C_TITLE}</td>
        		<td>${list.U_ID}</td>
        		<td>${list.USER_NAME}</td>
        		<td>${list.PHONE}</td>
        		<td>${list.SMS_TYPE}</td>
        		<td>${list.MID}</td>
        		<td>${list.RESULT_CODE}</td>
        		<td>${list.RESULT_MESSAGE}</td>
        		<td>${list.CREATE_DATE}</td>
           	</tr> 
		</c:forEach> 
        <c:if test="${smsSendList.size() == 0 }"> 
			<tr> 
				<td align="center" colspan="10">No Data</td> 
			</tr> 
		</c:if> 
	</table><!--e:tableWrap--> 
	<c:import url="page.jsp" /> 
</form> 