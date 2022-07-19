<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>	
	function goPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/situationClassList");
		$("#frm").submit();
	}
</script>


<form id="frm" method="POST">


   	<div style="font-size:15px;">
    	클래스명 : ${ sClassInfo.CLASS_NAME }
	</div>
	<br/>
    <div style="font-size:15px; "> 
    	강사명 : ${ sClassInfo.TEACHER_NAME }
	</div>
<br/>
    <div style="font-size:15px; ">
    	시간 : ${ sClassInfo.SCHEDULE_DATE } - ${ sClassInfo.START_TIME } ~ ${ sClassInfo.END_TIME }
	</div>
	<br/><br/><br/>
	<div style="font-size:15px; ">
		참가인원
	</div>
<br/>
    <table class="tableWrap">

    	<tr>
        	<th>ID</th>
        	<th>이름</th>
        	<th>전화</th>
       		<th>메일주소</th>
        	<th>참석여부</th>
    	</tr>

        <c:forEach var="list" items="${situationClassInfo}">
        	<tr>
        		<!--<td><a href="javascript:userInfo()">${list.U_ID}</a></td>-->
            	<td><a href="#">${list.U_ID}</a></td>
                <td><a href="#">${list.USER_NAME}</a></td>
                <td><a href="#">${list.PHONE}</a></td>
                <td><a href="#">${list.EMAIL}</a></td>
                <td><a href="#">${list.JOIN_STATE}</a></td>
           	</tr>
        </c:forEach>
        <c:if test="${situationClassInfo.size() == 0 }">
        <tr>
        		<!--<td><a href="javascript:userInfo()">${list.U_ID}</a></td>-->
            	<td colspan="5">No Data</td>
           	</tr>
        </c:if>


	</table><!--e:tableWrap-->

<c:import url="page.jsp" />
</form>


