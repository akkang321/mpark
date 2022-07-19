<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script>

	function userSituationInfo(uId){ 
		$("#uId").val(uId);
		$("#frm").attr("action", "/admin/situationUserInfo"); 
		$("#frm").submit();
	}

	function goPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/situationUserList"); 
		$("#frm").submit();
	}

</script>

<form id="frm" method="POST">
<input id="uId" name="uId" type="hidden" value="" />
	<div class="searchWrap">
		<div class="name searchBox">
		<h2>회원 ID</h2>
			<input type="text" id="sUserId" name="sUserId" value="${ param.sUserId }" placeholder="회원 ID">
		</div><!--e:searchBox-->

		<div class="name searchBox">
		<h2>회원명</h2>
			<input type="text" id="sUserName" name="sUserName" value="${ param.sUserName }" placeholder="회원명">
		</div><!--e:searchBox-->

		<button type="submit" class="searchBtn">검색</button>
	</div><!--searchWrap-->

    <table class="tableWrap">

    	<tr>
        	<th>회원ID</th>
        	<th>강사명</th>
        	<th>클래스(Total)</th>
       		<th>클래스(마감)</th>
        	<th>클래스(진행중)</th>
        	<th>스캐쥴건수(Total)</th>
        	<th>스케쥴(마감)</th>
        	<th>스케쥴(진행중)</th>
    	</tr>

        <c:forEach var="list" items="${ situationUserList }"> 
        	<tr>
            	<td><a href="javascript:userSituationInfo('${list.U_ID}')">${list.U_ID}</a></td>
                <td><a href="javascript:userSituationInfo('${list.U_ID}')">${list.TEACHER_NAME}</a></td>
                <td><a href="javascript:userSituationInfo('${list.U_ID}')">${list.CLASS_TOL}</a></td>
                <td><a href="javascript:userSituationInfo('${list.U_ID}')">${list.CLASS_OVER_CNT}</a></td>
                <td><a href="javascript:userSituationInfo('${list.U_ID}')">${list.CLASS_ON_CNT}</a></td>
                <td><a href="javascript:userSituationInfo('${list.U_ID}')">${list.SCHEDULE_TOL}</a></td>
                <td><a href="javascript:userSituationInfo('${list.U_ID}')">${list.SCHEDULE_OVER_CNT}</a></td>
                <td><a href="javascript:userSituationInfo('${list.U_ID}')">${list.SCHEDULE_ON_CNT}</a></td>
           	</tr>
        </c:forEach>

        <c:if test="${ situationUserList.size() == 0 }">
        	<tr>
            	<td colspan="9">No Data</td>
       		</tr>
        </c:if>

	</table><!--e:tableWrap-->

	<c:import url="page.jsp" />

</form>


