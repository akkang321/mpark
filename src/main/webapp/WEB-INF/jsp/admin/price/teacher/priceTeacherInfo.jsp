<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	function priceClassInfo(){ 
		$("#frm").attr("action", "/admin/priceUserInfo"); 
		$("#frm").submit();
	}

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
		<h2>회원 ID</h2>
			<input type="text" id="sUId" name="sUId" value="${ param.sUId }" placeholder="회원ID"> 
		</div><!--e:searchBox-->
		
		<div class="name searchBox"> 
		<h2>회원 ID</h2>
			<input type="text" id="sUserName" name="sUserName" value="${ param.sUserName }" placeholder="회원명"> 
		</div><!--e:searchBox-->

		<button type="submit" class="searchBtn">검색</button> 
	</div><!--searchWrap-->

    <table class="tableWrap"> 

    	<tr>
        	<th>클래스명</th>
        	<th>회원명</th>
        	<th>총금액</th>
       		<th>수강료 총 가격</th>
        	<th>실제 결제한 총 금액</th>
        	<th>환불금액</th>
    	</tr>

    	<c:forEach var="list" items="${ priceClassList }"> 
	   		<tr>
        		<td onclick="priceClassInfo()">${ list.CLASS_NAME }</td> 
        		<td onclick="priceClassInfo()">${ list.USER_NAME }</td>
        		<td onclick="priceClassInfo()"></td>
       			<td onclick="priceClassInfo()">${ list.PRICE_TOL }</td>
        		<td onclick="priceClassInfo()">실제 결제한 총 금액</td>
        		<td onclick="priceClassInfo()">환불금액</td>
    		</tr>
    	</c:forEach>

	</table><!--e:tableWrap--> 

	<c:import url="page.jsp" /> 

</form>


