<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	function goPage(pageNo){ 
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/priceUserList"); 
		$("#frm").submit();
	} 

</script>

<form id="frm" method="POST"> 
<input type="hidden" id="pageNo" name="pageNo" value="" /> 
<input type="hidden" id="uId" name="uId" value="" /> 

	<div class="searchWrap">
		<div class="name searchBox"> 
		<h2>클래스명</h2>
			<input type="text" id="sClassName" name="sClassName" value="${ param.sClassName }" placeholder="클래스명"> 
		</div><!--e:searchBox-->
		
		<div class="name searchBox"> 
		<h2>강사명</h2>
			<input type="text" id="sTeacherName" name="sTeacherName" value="${ param.sTeacherName }" placeholder="회원명"> 
		</div><!--e:searchBox-->

		<button type="submit" class="searchBtn">검색</button> 
	</div><!--searchWrap-->

    <table class="tableWrap"> 

    	<tr>
        	<th>클래스명</th>
        	<th>강사</th>
        	<th>총금액</th>
       		<th>실제금액</th>
        	<th>환불금액</th>
        	<th>결제날짜</th>
        	<th>환불날짜</th>
    	</tr>

    	<c:forEach var="list" items="#"> 
	   		<tr>
        		<td></td> 
        		<td></td>
        		<td></td>
       			<td></td>
        		<td>실제 결제한 총 금액</td>
        		<td>환불금액</td>
        		<td>환불금액</td>
    		</tr>
    	</c:forEach>

	</table><!--e:tableWrap--> 

	<c:import url="page.jsp" /> 

</form>


