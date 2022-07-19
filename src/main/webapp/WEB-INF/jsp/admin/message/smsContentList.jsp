<!DOCTYPE html> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script> 
	function smsContentInfo(cId){ 
		$("#cId").val(cId); 
		$("#frm").attr("action", "/admin/messageSmsContentInfo"); 
		$("#frm").submit(); 
	} 

	function goPage(pageNo){ 
		$("#pageNo").val(pageNo); 
		$("#frm").attr("action", "/admin/messageSmsContentList"); 
		$("#frm").submit(); 
	} 
</script> 

<form id="frm" method="POST"> 
<input type="hidden" id="pageNo" name="pageNo" value=""> 
<input type="hidden" id="cId" name="cId" value=""> 

	<div class="searchWrap"> 
    	<div class="id searchBox"> 
    	<h2>제목</h2> 
    		<input type="text" id="sCTitle" name="sCTitle" value="${param.sCTitle}" placeholder="메신저 제목"> 
        </div><!--e:searchBox--> 

		<button type="submit" class="searchBtn">검색</button> 

	</div><!--searchWrap--> 

    <table class="tableWrap"> 
    	<tr>
    		<th>컨텐츠 ID</th> 
        	<th>제목</th> 
        	<th>작성ID</th> 
        	<th>작성날짜</th> 
        	<th>수정ID</th> 
        	<th>수정날짜</th> 
    	</tr> 
		<c:forEach var="list" items="${ adminSmsContentList }"> 
        	<tr> 
        		<td><a href="javascript:smsContentInfo('${list.C_ID}')">${list.C_ID}</a></td> 
            	<td><a href="javascript:smsContentInfo('${list.C_ID}')">${list.C_TITLE}</a></td> 
            	<td><a href="javascript:smsContentInfo('${list.C_ID}')">${list.CREATE_ID}</a></td> 
            	<td><a href="javascript:smsContentInfo('${list.C_ID}')">${list.CREATE_DATE}</a></td> 
            	<td><a href="javascript:smsContentInfo('${list.C_ID}')">${list.UPDATE_ID}</a></td> 
            	<td><a href="javascript:smsContentInfo('${list.C_ID}')">${list.UPDATE_DATE}</a></td> 
           	</tr> 
		</c:forEach> 

        <c:if test="${adminSmsContentList.size() == 0 }"> 
			<tr> 
				<td align="center" colspan="6">No Data</td> 
			</tr> 
		</c:if> 

	</table><!--e:tableWrap--> 

	<div class="newBtnBox"> 
        <button type="button" onclick="smsContentInfo();" class="newBtn">신규</button> 
    </div> 

<c:import url="page.jsp" /> 
</form> 


