<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function goPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/bbsNoticeList"); 
		$("#frm").submit();
	} 

	function bbsNoticeInfo(uId, bId){
		$("#uId").val(uId); 
		$("#bId").val(bId);
		$("#frm").attr("action", "/admin/bbsNoticeInfo"); 
		$("#frm").submit();
	}


</script>


<form id="frm" name="frm" method="POST"> 
<input type="hidden" id="uId" name="uId"> 
<input type="hidden" id="bId" name="bId"> 

	<div class="searchWrap"> 
    	<div class="id searchBox"> 
    	<h2>제목명</h2> 
    		<input type="text" id="sTitle" name="sTitle" value="${param.sTitle}" placeholder="제목명"> 
        </div><!--e:searchBox--> 

		<button type="submit" class="searchBtn">검색</button> 

	</div><!--searchWrap--> 

    <table class="tableWrap">
    	<tr>
        	<th>작성ID</th>
        	<th>수정ID</th> 
        	<th>제목</th>
        	<th>작성날짜</th> 
        	<th>수정날짜</th>
    	</tr>

        <c:forEach var="list" items="${ bbsNoticeList }"> 
        	<tr> 
                <td><a href="javascript:bbsNoticeInfo('${ list.CREATE_ID }', '${ list.B_ID }')">${ list.CREATE_ID }</a></td> 
                <td><a href="javascript:bbsNoticeInfo('${ list.CREATE_ID }', '${ list.B_ID }')">${ list.UPDATE_ID }</a></td> 
                <td><a href="javascript:bbsNoticeInfo('${ list.CREATE_ID }', '${ list.B_ID }')">${ list.TITLE }</a></td> 
                <td><a href="javascript:bbsNoticeInfo('${ list.CREATE_ID }', '${ list.B_ID }')">${ list.CREATE_DATE }</a></td> 
                <td><a href="javascript:bbsNoticeInfo('${ list.CREATE_ID }', '${ list.B_ID }')">${ list.UPDATE_DATE }</a></td> 
           	</tr> 
        </c:forEach> 

		<c:if test="${bbsNoticeList.size() == 0 }"> 
			<tr>
				<td align="center" colspan="8">No Data</td> 
			</tr>
		</c:if>

	</table><!--e:tableWrap-->
		<div class="newBtnBox">
        <button type="button" onclick="bbsNoticeInfo('${ userInfo.U_ID }', '');" class="newBtn">게시글 등록</button> 
    </div>
    
    <c:import url="page.jsp" />
</form>

