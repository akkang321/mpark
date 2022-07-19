<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script> 
	function teacherSituationInfo(tId){ 
		$("#tId").val(tId); 
		$("#frm").attr("action", "/admin/situationTeacherInfo"); 
		$("#frm").submit(); 
	} 

	function goPage(pageNo){ 
		$("#pageNo").val(pageNo); 
		$("#frm").attr("action", "/admin/situationTeacherList"); 
		$("#frm").submit(); 
	} 
</script> 

<form id="frm" method="POST">
<input id="tId" name="tId" type="hidden" value="" /> 
	<div class="searchWrap">
		<div class="name searchBox">
		<h2>강사명</h2>
			<input type="text" id="sTeacherName" name="sTeacherName" value="${ param.sTeacherName }" placeholder="강사명">
		</div><!--e:searchBox-->

		<button type="submit" class="searchBtn">검색</button>
	</div><!--searchWrap-->

    <table class="tableWrap">
    	<tr>
        	<th>강사ID</th>
        	<th>강사명</th>
        	<th>클래스(전체)</th>
       		<th>클래스(예약마감)</th>
        	<th>클래스(진행중)</th>
        	<th>스캐쥴건수(전체)</th>
        	<th>스케쥴(예약마감)</th>
        	<th>스케쥴(진행중)</th>
        	<th>재직여부</th>
    	</tr>

        <c:forEach var="list" items="${ situationTeacherList }">
        	<tr>
            	<td><a href="javascript:teacherSituationInfo('${list.T_ID}')">${list.T_ID}</a></td>
                <td><a href="javascript:teacherSituationInfo('${list.T_ID}')">${list.TEACHER_NAME}</a></td>
                <td><a href="javascript:teacherSituationInfo('${list.T_ID}')">${list.CLASS_TOL}</a></td>
                <td><a href="javascript:teacherSituationInfo('${list.T_ID}')">${list.CLASS_OVER_CNT}</a></td>
                <td><a href="javascript:teacherSituationInfo('${list.T_ID}')">${list.CLASS_ON_CNT}</a></td>
                <td><a href="javascript:teacherSituationInfo('${list.T_ID}')">${list.SCH_TOL}</a></td>
                <td><a href="javascript:teacherSituationInfo('${list.T_ID}')">${list.SCH_OVER_CNT}</a></td>
                <td><a href="javascript:teacherSituationInfo('${list.T_ID}')">${list.SCH_ON_CNT}</a></td>
                <td><a href="javascript:teacherSituationInfo('${list.T_ID}')">${list.TEACHER_STATE}</a></td>
           	</tr>
        </c:forEach>

        <c:if test="${ situationTeacherList.size() == 0 }">
        	<tr>
            	<td colspan="9">No Data</td>
       		</tr>
        </c:if>

	</table><!--e:tableWrap-->

	<c:import url="page.jsp" />
</form>


