<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>


function coinUserList(){
	$("#frm").attr("action", "/admin/coinUserList");
	$("#frm").submit();
};


function coinUserSave(){
	var data = $("#frm").serialize();
	$.ajax({
		url: "/admin/coinUserSave",
		type: "POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result>0){
				alert("저장 완료");
				coinUserList();
			} else {
				alert("저장 실패")
			}
		}
	})
}

function coinUserDelete(id){
	alert();
	var data = $("#frm").serialize();
	$.ajax({
		url:"/admin/coinUserDelete",
		type:"POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result>0){
				alert("삭제 완료");
				coinUserList();
			} else {
				alert("삭제 실패");
			}
		}
	})
}

function goTest(){
	$("#frm").attr("action", "/admin/coinTrace")
	$("#frm").submit();
}
</script>

<form id="frm" method="post" action="" >
	<input type="hidden" id="id" name="id" value="${coinUserInfo.ID}">
	<div class="searchWrap2">
	    <div class="name searchBox">
	        <h2>User Id</h2>
	        <input type="text" id="userId" name="userId" value="${coinUserInfo.USER_ID}">
	    </div><!--e:searchBox-->
		
		<div class="name searchBox">
	        <h2>API_KEY</h2>
	        <input type="text" id="apiKey" name="apiKey" value="${coinUserInfo.API_KEY}">
	    </div><!--e:searchBox-->
	    <div class="name searchBox">
	        <h2>Scret Key</h2>
	        <input type="text" id="scrKey" name="scrKey" value="${coinUserInfo.SCR_KEY}">
	    </div><!--e:searchBox-->
	    <div class="name searchBox">
	        <h2>코인마켓</h2>
	        <input type="text" id="coinMarket" name="coinMarket" value="${coinUserInfo.COIN_MARKET}">
	    </div><!--e:searchBox-->
	    <div class="name searchBox">
	        <h2>매수시간(초)</h2>
	        <input type="text" id="buyTime" name="buyTime" value="${coinUserInfo.BUY_TIME}">
	    </div><!--e:searchBox-->
	    <div class="name searchBox">
	        <h2>매수최고가</h2>
	        <input type="text" id="buyHPrice" name="buyHPrice" value="${coinUserInfo.BUY_H_PRICE}">
	    </div><!--e:searchBox-->
	    <div class="name searchBox">
	        <h2>매수최저가</h2>
	        <input type="text" id="buyLPrice" name="buyLPrice" value="${coinUserInfo.BUY_L_PRICE}">
	    </div><!--e:searchBox-->
	    <div class="name searchBox">
	        <h2>매수최고수량</h2>
	        <input type="text" id="buyHCnt" name="buyHCnt" value="${coinUserInfo.BUY_H_CNT}">
	    </div><!--e:searchBox-->
	    <div class="name searchBox">
	        <h2>매수최저수량</h2>
	        <input type="text" id="buyLCnt" name="buyLCnt" value="${coinUserInfo.BUY_L_CNT}">
	    </div>
	    <div class="name searchBox">
	        <h2>매도시간(초)</h2>
	        <input type="text" id="sellTime" name="sellTime" value="${coinUserInfo.SELL_TIME}">
	    </div>
	    <div class="name searchBox">
	        <h2>매도최고가격</h2>
	        <input type="text" id="sellHPrice" name="sellHPrice" value="${coinUserInfo.SELL_H_PRICE}">
	    </div>
	    <div class="name searchBox">
	        <h2>매도최저가격</h2>
	        <input type="text" id="sellLPrice" name="sellLPrice" value="${coinUserInfo.SELL_L_PRICE}">
	    </div>
	    <div class="name searchBox">
	        <h2>매도최고수량</h2>
	        <input type="text" id="sellHCnt" name="sellHCnt" value="${coinUserInfo.SELL_H_CNT}">
	    </div>
	    <div class="name searchBox">
	        <h2>매도최소수량</h2>
	        <input type="text" id="sellLCnt" name="sellLCnt" value="${coinUserInfo.SELL_L_CNT}">
	    </div>
	    
	</div><!--e:addImgWrap-->

	<div class="btnWrap">
	    <button type="button" class="confirmBtn" onclick="coinUserSave()">확인</button>
	    <c:if test="${coinUserInfo.ID != null and coinUserInfo.ID !=''}">
		    <button type="button" class="deleteBtn" onclick="coinUserDelete('${coinUserInfo.ID }')">삭제</button>
	    </c:if>
	    <button type="button" class="cancelBtn" onclick="coinUserList()">취소</button>
	    
	    <button type="button" class="cancelBtn" onclick="goTest();">테스트</button>
	</div><!--e:btnWrap-->
	
		
</form>




