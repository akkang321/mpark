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
<input type="hidden" id="cId" name="cId" value="" />

	<div class="searchWrap"> 
		<div class="name searchBox"> 
		<h2>티켓종류</h2>  
			<select id="ticketType"> 
				<option id="ticket1" name="ticket1" value="">1</option> 
				<option id="ticket2" name="ticket2" value="">2</option> 
				<option id="ticket2" name="ticket3" value="">3</option> 
			</select> 
		</div><!--e:searchBox--> 
		
		<div class="name searchBox"> 
		<h2>티켓명</h2> 
			<input type="text" id="sTeacherName" name="sTeacherName" value="${ param.sTicketName }" placeholder="티켓명"> 
		</div><!--e:searchBox--> 

		<button type="submit" class="searchBtn">검색</button> 
	</div><!--searchWrap-->

    <table class="tableWrap"> 

    	<tr>
        	<th>티켓번호</th>
        	<th>티켓명</th>
        	<th>티켓종류</th>
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
        		<td>환불금액</td>
    		</tr> 
    	</c:forEach>

	</table><!--e:tableWrap--> 

	<c:import url="page.jsp" /> 

</form>


