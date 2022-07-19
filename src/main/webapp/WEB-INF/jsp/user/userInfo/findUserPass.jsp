<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <jsp:include page="/WEB-INF/jsp/user/layout/loading.jsp"/> -->
<script>
function checkData(){ 
	if(!$('#uId').val()){ 
		alert('ID를 입력하세요.'); 
		$('#uId').focus(); 
		return false; 
	} 
	if(!$('#userName').val()){ 
		alert('NAME을 입력하세요.'); 
		$('#userName').focus(); 
		return false; 
	} 
	if(!$('#phone').val()){ 
		alert('phone을 입력하세요.'); 
		$('#phone').focus(); 
		return false; 
	} 
} 

function checkData(){
	if(!$('#uId').val()){ 
		alert('ID를 입력하세요.'); 
		$('#uId').focus(); 
		return false; 
	} 
	if(!$('#userName').val()){ 
		alert('NAME을 입력하세요.'); 
		$('#userName').focus(); 
		return false; 
	}
	if(!$('#phone').val()){ 
		alert('PHONE NUMBER를 입력하세요.'); 
		$('#phone').focus(); 
		return false; 
	}
	return true;
}


function checkUserPass(){ 

	if (!checkData()){ 
		return; 
	} 

	var data = $("#frm").serialize(); 
	$.ajax({ 
		url:"/findUserPassProcess", 
		type:"POST", 
		data: data, 
		dataType: "json", 
		success: function( result ){ 
			if (result>0){ 
				alert("임시비번을 문자로 발송 하였습니다."); 
			} else { 
				alert("해당하는 정보를 찾지 못했습니다. 재확인 필요합니다."); 
			} 
		} 
	}) 
} 
</script> 

<body>
<form id="frm" name="frm" method="post"> 
		<section id="login-body"> 
			<div class="login-wrap"> 
				<h1>비밀번호 찾기</h1> 
				<input type="text" id="uId" name="uId" placeholder="ID"> 
				<input type="text" id="userName" name="userName" placeholder="NAME"> 
				<input type="text" id="phone" name="phone" placeholder="PHONE NUMBER" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"> 
				<div class="Df_Ac_Sb">
					<a href="/userJoin" class="font-Size14">회원가입</a> 
					<!-- <div class="findBox"> 

						<a href="#">비밀번호 찾기</a> 
					</div> -->
				</div>
				<div class="mo_but " >
					<button type="button" class="loginBtn justLoginBtn" onclick="checkUserPass()">확인</button> 
				</div> 
			</div> 
		</section> 
</form> 

</body> 


