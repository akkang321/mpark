<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>


/*
	function goPage(pageNo){ 
		$("#pageNo").val(pageNo); 
		$("#frm").attr("action", "/teacher/teacherClassList"); 
		$("#frm").submit(); 
	}
*/


	function teacherClassInfo(tId, cId){ 
		$("#tId").val(tId); 
		$("#cId").val(cId); 
		$("#frm").attr("action","/teacher/teacherClassInfo"); 
		$("#frm").submit(); 
	} 

</script>

<form id="frm" name="frm" method="post">
<input type="hidden" id="tId" name="tId" />
<input type="hidden" id="cId" name="cId" />


    <table class="tableWrap">

    	<tr> 
        	<th>클래스명</th>
        	<th>전체건수(스케줄)</th>
        	<th>남은건수(스케줄)</th>
       		<th>회원수</th>
        	<th>클래스 상태</th>
    	</tr> 

<c:forEach var="list" items="${ teacherClassList }"> 
		<tr> 
			<td onclick="teacherClassInfo('${ list.T_ID }', '${ list.C_ID }')">${ list.CLASS_NAME }</td> 
			<td onclick="teacherClassInfo('${ list.T_ID }', '${ list.C_ID }')">${ list.SCHEDULE_TOL }</td> 
			<td onclick="teacherClassInfo('${ list.T_ID }', '${ list.C_ID }')">${ list.SCHEDULE_ON_CNT }</td> 
			<td onclick="teacherClassInfo('${ list.T_ID }', '${ list.C_ID }')">${ list.USER_CNT }</td> 
			<td onclick="teacherClassInfo('${ list.T_ID }', '${ list.C_ID }')">${ list.CLASS_STATE }</td> 
		</tr> 
</c:forEach>

         <c:if test="${teacherClassList.size() == 0 }">
			<tr>
				<td align="center" colspan="8">No Data</td>
			</tr>
		</c:if>
	</table><!--e:tableWrap-->

<c:import url="page.jsp" />
</form>


