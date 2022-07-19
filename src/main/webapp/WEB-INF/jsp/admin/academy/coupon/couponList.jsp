<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script> 
	function couponInfo(couponId){ 
		$("#couponId").val(couponId);
		$("#frm").attr("action", "/admin/academyCouponInfo")
		$("#frm").submit();
	}
	
	function goPage(pageNo){ 
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/academyCouponList");
		$("#frm").submit();
	}
</script>

<form id="frm" method="POST">
<input type="hidden" id="pageNo" name="pageNo" value="">
<input type="hidden" id="couponId" name="couponId" value="">

    <table class="tableWrap">
    	<tr>
        	<th>쿠폰ID</th>
        	<th>쿠폰명</th>
        	<th>만료일</th>
    	</tr>

        <c:forEach var="list" items="${ couponList }"> 
        	<tr>
            	<td><a href="javascript:couponInfo('${list.COUPON_ID}')">${list.COUPON_ID}</a></td> 
                <td><a href="javascript:couponInfo('${list.COUPON_ID}')">${list.COUPON_NAME}</a></td> 
                <td><a href="javascript:couponInfo('${list.COUPON_ID}')">${list.EXPIRY_DATE}</a></td> 
           	</tr>
        </c:forEach>
	</table><!--e:tableWrap-->

	<div class="newBtnBox"> 
        <button type="button" onclick="couponInfo();" class="newBtn">신규</button> 
    </div> 
<c:import url="page.jsp" /> 
</form> 


