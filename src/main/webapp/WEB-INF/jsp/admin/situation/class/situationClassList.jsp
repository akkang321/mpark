<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function classSituationInfo(sId){ 
		$("#sId").val(sId);
		$("#frm").attr("action", "/admin/situationClassInfo"); 
		$("#frm").submit();
	}

	function goPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/situationClassList"); 
		$("#frm").submit();
	}
</script>

<form id="frm" method="POST">
<input id="sId" name="sId" type="hidden" value="" />
	<div class="searchWrap">
    	<div class="id searchBox">
    	<h2>클래스</h2>
    		<input type="text" id="sClassName" name="sClassName" value="${param.sClassName}" placeholder=""> 
        </div><!--e:searchBox-->

		<div class="name searchBox">
		<h2>강사</h2>
			<input type="text" id="sTeacherName" name="sTeacherName" value="${param.sTeacherName}" placeholder="">
		</div><!--e:searchBox-->

		<button type="submit" class="searchBtn">검색</button>
	</div><!--searchWrap-->

    <table class="tableWrap">
    	<tr>
        	<th>클래스명</th>
        	<th>담당강사</th>
        	<th>날짜</th>
       		<th>회원인원</th>
        	<th>회원인원(참석)</th>
    	</tr>


        <c:forEach var="list" items="${situationClassList}"> 
        	<tr>
            	<td><a href="javascript:classSituationInfo('${list.S_ID}')">${list.CLASS_NAME}</a></td> 
                <td><a href="javascript:classSituationInfo('${list.S_ID}')">${list.TEACHER_NAME}</a></td> 
                <td><a href="javascript:classSituationInfo('${list.S_ID}')">${list.SCHEDULE_DATE} - ${list.START_TIME} ~ ${list.END_TIME}</a></td> 
                <td><a href="javascript:classSituationInfo('${list.S_ID}')">${list.CNT}</a></td> 
                <td><a href="javascript:classSituationInfo('${list.S_ID}')">${list.REAL_CNT}</a></td> 
           	</tr> 
        </c:forEach> 


	</table><!--e:tableWrap--> 

<c:import url="page.jsp" /> 
</form>


