<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="PartnersWrap">
	<div class="searchBox">
		<input type="text" id="PartnersName" placeholder="파트너스명 검색">
		<button onclick="GetPartners($('#PartnersName').val());">검색</button>
	</div>
	<c:forEach var="list" items="${list}">
		<div class="Contents">
		    <div class="Df Df_Ac Contents_head">
		        <p>새로운 파트너스 신청 : ${list.PartnerName}</p>
		        <p>주차장 명 : ???</p>
		        <p>보험 종류 : ???</p>
		    </div>
		    <div class="Df Df_Ac Contents_body">
		        <div class="Df Wc3">
		            <p>대표자명 :</p>
		            <p>${list.PartnerName}</p>    
		        </div>
		        <div class="Df Wc3">
		            <p>E-Mail :</p>
		            <p>${list.OwnerEmail}</p>
		        </div>
		        <div class="Df Wc3">
		            <p>주소 :</p>
		            <p>???</p>
		        </div>
		        
		    </div>
		    <div class="Df Df_Ac Contents_body">
		        <div class="Df Wc3">
		            <p>전화번호 :</p>
		            <p>${list.PhoneNumber}</p>
		        </div>
		        <div class="Df Wc3">
		            <p>사업자 번호 :</p>
		            <p>?????</p>
		        </div>
		        <div class="Df Wc3">
		            <p> 계좌번호 :</p>
		            <p>${list.BankName} ${list.BankAccount}</p>
		        </div>
		
		    </div>
		    <section class="Df mr_130 Jc_Fd mt-30">
		        <article class="accept_Box cursor">
		            <p>수락</p>
		        </article>
		        <article class="cancellation_Box cursor">
		            <p>취소</p>
		        </article>
		    </section>
		</div>
	</c:forEach>
</html>





