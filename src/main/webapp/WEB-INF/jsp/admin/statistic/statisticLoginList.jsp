<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	function goPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/statisticLoginList");
		$("#frm").submit();
	}

</script>

<form id="frm" method="POST">
	<div class="searchWrap">
		<div class="name searchBox">
		<h2>ID</h2>
			<input type="text" id="sUId" name="sUId" value="${ param.sUId }" placeholder="사용자 ID">
		</div><!--e:searchBox-->

		<button type="submit" class="searchBtn">검색</button>
	</div><!--searchWrap-->

    <table class="tableWrap">

    	<tr>
        	<th>강사ID</th>
        	<th>IP주소</th>
        	<th>로그인날짜</th>
    	</tr>

        <c:forEach var="list" items="${ statisticLoginList }"> 
        	<tr>
            	<td><a href="#">${ list.U_ID }</a></td>
                <td><a href="#">${ list.LOGIN_IP }</a></td> 
                <td><a href="#">${ list.LOGIN_DATE }</a></td>
           	</tr>
        </c:forEach>

        <c:if test="${ statisticLoginList.size() == 0 }"> 
        	<tr>
            	<td colspan="9">No Data</td>
       		</tr>
        </c:if>

	</table><!--e:tableWrap-->

	<c:import url="page.jsp" />
</form>


