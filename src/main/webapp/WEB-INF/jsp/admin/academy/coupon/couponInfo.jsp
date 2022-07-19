<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>

$(document).ready(function() {
	<c:if test="${couponInfo != null}"> 
		$('#couponType').val("${couponInfo.COUPON_TYPE}"); 
		$('#useYn').val("${couponInfo.USE_YN}"); 
	</c:if>
});

function couponList(){
	$("#frm").attr("action", "/admin/academyCouponList"); 
	$("#frm").submit(); 
}; 

function couponSave(){ 
	if (!checkData()){ 
		return; 
	} 

	var url = "";
	if ("${couponInfo}" == ""){ 
		url = "/admin/academyCouponInsert"; 
	} else {
		url = "/admin/academyCouponUpdate"; 
	}
	var data = $("#frm").serialize();

	$.ajax({
		url: url,
		type: "POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result == 999){
				alert("중복된 쿠폰ID 입니다.");
			} else if (result>0){
				alert("저장 완료");
				couponList();
			} else {
				alert("저장 실패")
			}
		}
	})
} 

function couponDelete(){
	var data = $("#frm").serialize();
	$.ajax({
		url:"/admin/couponDelete",
		type:"POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result>0){
				alert("삭제 완료");
				couponList();
			} else {
				alert("삭제 실패");
			}
		}
	})
};

function checkData(){
	if (!$('#couponId').val()) {
		alert('푸폰ID 입력하세요.')
		$('#couponId').focus();
		return false;
	}
	
	if (!$('#couponName').val()) {
		alert('쿠폰명을 입력하세요.');
		$('#couponName').focus();
		return false;
	}
	
	if (!$('#couponType').val()) {
		alert('쿠폰유형을 입력하세요.');
		$('#couponType').focus();
		return false;
	}

	if (!$('#couponDiscount').val()) {
		alert('할인액을 입력하세요.');
		$('#couponDiscount').focus();
		return false;
	}
	
	if (!$('#useYn').val()) {
		alert('사용여부를 입력하세요.');
		$('#useYn').focus();
		return false;
	}
	
	if (!$('#expiryDate').val()) {
		alert('유효기간을 입력하세요.');
		$('#expiryDate').focus();
		return false;
	}
	
	return true;

}

function goBack(){
	history.back();
}


</script>

<form id="frm" method="POST">
	<div class="searchWrap2">

	    <div class="name searchBox">
	        <h2>쿠폰ID</h2>
	        <input type="text" id="couponId" name="couponId" value="${couponInfo.COUPON_ID}" placeholder="쿠폰ID">
	    </div><!--e:searchBox-->

	    <div class="name searchBox">
	        <h2>쿠폰명</h2>
	        <input type="text" id="couponName" name="couponName" value="${couponInfo.COUPON_NAME}" placeholder="쿠폰명"> 
	    </div><!--e:searchBox-->

	    <div class="name searchBox">
	        <h2>쿠폰유형</h2>
			<select id="couponType" name="couponType">
				<option>선택</option>
				<c:forEach var="list" items="${couponTypeList}">
					<option value="<c:out value='${list.CODE_ID}' />"><c:out value='${list.CODE_NAME}' /></option>
				</c:forEach>
			</select>
	        <!--<input type="text" id="couponType" name="couponType" value="${couponInfo.COUPON_TYPE}">-->
	    </div><!--e:searchBox-->

		<div class="name searchBox">
	        <h2>할인액</h2>
	        <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="couponDiscount" name="couponDiscount" value="${couponInfo.COUPON_DISCOUNT}" placeholder="할인액수">
	    </div><!--e:searchBox-->

		<div class="name searchBox">
	        <h2>사용여부</h2>
	       	<select id="useYn" name="useYn" id="useYnReadOnly">
				<option>선택</option>
				<c:forEach var="list" items="${couponUseList}">
					<option value="<c:out value='${list.CODE_ID}' />"><c:out value='${list.CODE_NAME}' /></option>
				</c:forEach>
			</select>
	        <!--<input type="text" id="useYn" name="useYn" value="${couponInfo.CODE_NAME}">-->
	    </div><!--e:searchBox-->

		<div class="name searchBox">
	        <h2>유효기한</h2>
	        <input type="datetime-local" id="expiryDate" name="expiryDate" value="${couponInfo.EXPIRY_DATE}">
	    </div><!--e:searchBox-->


	</div><!--searchWrap-->

	<div class="btnWrap">
	    <button type="button" class="confirmBtn" onclick="couponSave()">확인</button>
		<c:if test="${couponInfo != null}">
	    	<button type="button" class="deleteBtn" onclick="couponDelete()">삭제</button>
		</c:if>
	    <button type="button" class="cancelBtn" onclick="goBack()">취소</button>
	</div><!--e:btnWrap-->

</form>


