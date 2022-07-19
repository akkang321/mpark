<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	function priceUserInfo(){ 
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
        	<th>회원ID</th>
        	<th>회원명</th>
        	<th>총금액</th>
        	<th>실결제금액</th>
        	<th>환불금액</th> 
    	</tr> 

    	<c:forEach var="list" items="${ priceUserList }"> 
	   		<tr> 
        		<td onclick="priceUserInfo()">${ list.U_ID }</td> 
        		<td onclick="priceUserInfo()">${ list.USER_NAME }</td> 
        		<td onclick="priceUserInfo()">${ list.ORG_PRICE_TOL }</td> 
       			<td onclick="priceUserInfo()">${ list.PAY_PRICE_TOL }</td> 
        		<td onclick="priceUserInfo()">${ list.REFUND_TOL }</td> 
    		</tr> 
    	</c:forEach>

	</table><!--e:tableWrap--> 

	<c:import url="page.jsp" /> 

</form>


