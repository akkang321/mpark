<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function teacherInfo(tId){
		$("#tId").val(tId);
		$("#frm").attr("action", "/admin/teacherInfo") 
		$("#frm").submit();
	}
	
	function goPage(pageNo){ 
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/teacherList");
		$("#frm").submit();
	}
</script>

<form id="frm" method="POST" action="/admin/teacherList">
	<input type="hidden" id="tId" name="tId" value="">
	<div class="searchWrap">
    	<div class="id searchBox">
    	<h2>강사ID</h2>
    		<input type="text" id="sTId" name="sTId" value="${param.sTId}" placeholder="">
        </div><!--e:searchBox-->

		<div class="name searchBox">
		<h2>강사명</h2>
			<input type="text" id="sTeacherName" name="sTeacherName" value="${param.sTeacherName}" placeholder="">
		</div><!--e:searchBox-->

		<button type="submit" class="searchBtn">검색</button>

	</div><!--searchWrap-->

    <table class="tableWrap">
    	<tr>
        	<th>강사ID</th>
        	<th>이름</th>
        	<th>핸드폰</th>
       		<th>메일</th>
        	<th>상태</th>
    	</tr>

        <c:forEach var="list" items="${ teacherList }">
        	<tr>
            	<td><a href="javascript:teacherInfo('${list.T_ID}')">${list.T_ID}</a></td>
                <td><a href="javascript:teacherInfo('${list.T_ID}')">${list.TEACHER_NAME}</a></td>
                <td><a href="javascript:teacherInfo('${list.T_ID}')">${list.PHONE}</a></td>
                <td><a href="javascript:teacherInfo('${list.T_ID}')">${list.EMAIL}</a></td>
                <td><a href="javascript:teacherInfo('${list.T_ID}')">${list.FN_TEACHER_STATE}</a></td>
           	</tr>
        </c:forEach>
	</table><!--e:tableWrap-->

	<div class="newBtnBox">
        <button type="button" onclick="teacherInfo();" class="newBtn">신규</button>
    </div>
    
	<c:import url="page.jsp" />
</form>

