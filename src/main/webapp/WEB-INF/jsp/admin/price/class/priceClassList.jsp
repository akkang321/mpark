<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	function priceClassInfo(cId){
		alert(cId);
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
<input type="hidden" id="cId" name="cId" value="" /> 

	<div class="searchWrap"> 
		<div class="name searchBox"> 
		<h2>클래스명</h2> 
			<input type="text" id="sClassName" name="sClassName" value="${ param.sClassName }" placeholder="클래스명"> 
		</div><!--e:searchBox--> 

		<button type="submit" class="searchBtn">검색</button> 
	</div><!--searchWrap--> 

    <table class="tableWrap"> 

    	<tr> 
        	<th>클래스명</th> 
        	<th>강사명</th> 
        	<th>허용 회원수</th> 
        	<th>실결제 회원수</th> 
       		<th>수강료 총 금액</th> 
        	<th>실제 결제한 총 금액</th> 
        	<th>환불 추후 추가</th> 
    	</tr> 

    	<c:forEach var="list" items="${ priceClassList }"> 
	   		<tr> 
        		<td onclick="priceClassInfo('${ list.C_ID }')">${ list.CLASS_NAME }</td> 
        		<td onclick="priceClassInfo('${ list.C_ID }')">${ list.TEACHER_NAME }</td> 
        		<td onclick="priceClassInfo('${ list.C_ID }')">${ list.USER_CNT }</td> 
        		<td onclick="priceClassInfo('${ list.C_ID }')">${ list.PAY_USER_CNT }</td> 
       			<td onclick="priceClassInfo('${ list.C_ID }')">${ list.ORG_PAY_PRICE_TOL }</td> 
        		<td onclick="priceClassInfo('${ list.C_ID }')">${ list.PAY_PRICE_TOL }</td> 
        		<td onclick="priceClassInfo('${ list.C_ID }')">환불 추후 추가</td> 
    		</tr> 
    	</c:forEach> 

	</table><!--e:tableWrap--> 

	<c:import url="page.jsp" /> 

</form> 


