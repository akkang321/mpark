<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function classChargeInfo(cId){
		alert(cId)
		$("#cId").val(cId);
		$("#frm").attr("action", "/admin/classChargeInfo")
		$("#frm").submit();
	}
</script>

<form id="frm" method="POST"> 
	<input type="hidden" id="cId" name="cId" value=""> 
	<div class="searchWrap">
    	<div class="id searchBox"> 
    	<h2>클래스명</h2>
    		<input type="text" id="sClassName" name="sClassName" value="${param.sClassName}" placeholder="클래스명"> 
        </div><!--e:searchBox--> 

		<button type="submit" class="searchBtn">검색</button> 

	</div><!--searchWrap--> 


    <table class="tableWrap"> 

    	<tr> 
        	<th>클래스명</th> 
        	<th>강사</th> 
        	<th>회원수</th> 
        	<th>수강료 총 가격</th> 
        	<th>실제 결제한 총 금액</th> 
        	<th>환불 총 금액</th> 
    	</tr>

	</table><!--e:tableWrap--> 


	<c:import url="page.jsp" /> 

</form> 


