<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	
	<style>
		.rewriteCss{ border: 4px solid #E22786 } 
	</style>

<script>


function rewriteCss(){ 
	$('#uId').focus();
	var userId = $('#uId');
	userId.addClass('rewriteCss');
	return false;
}


function checkData(){
	var userId = $('#uId').val();
	var email = $('#email').val();
	var userName = $('#userName').val();
	var userPw1 = $('#userPw1').val();
	var userPw2 = $('#userPw2').val();
	var phone = $('#phone').val();
	
	if(!uId) {
		alert('ID를 입력하세요.');
		$('#uId').focus();
		return false;
	}

	if (!email) { 
		alert('이메일을 입력하세요.'); 
		$('#email').focus(); 
		return false;
	}

	if (!userName) { 
		alert('이름을 입력하세요.'); 
		$('#userName').focus(); 
		return false; 
	}
	
	if (!userPw1) { 
		alert('비번을 입력하세요.'); 
		$('#userPw1').focus(); 
		return false; 
	}
	
	if (!userPw2) {
		alert('확인비번을 입력하세요.');
		$('#userPw2').focus();
		return false;
	} 

	if (!phone) { 
		alert('휴대폰번호를 입력하세요.'); 
		$('#phone').focus(); 
		return false; 
	} 

	if(userPw1!=userPw2) { 
		alert('비번이 일치하지 않습니다, 다시입력하십시오.'); 
		$('#userPw1').focus(); 
		return false; 
	} 

	if(!radioBox.checked){ 
		alert('개인정보 수집 동의 확인하십시오.'); 
		return false; 
	} 

	return true; 

} 


function userInsert(){ 
	if (!checkData()){ 
		return false; 
	} 

	var data = $("#frm").serialize(); 

	$.ajax({ 
		url: "/user/userInsert", 
		type: "POST", 
		data: data, 
		dataType: "json", 
		success: function( result ){ 
			if (result == 123){ 
				alert("이미 사용중인 ID."); 
				rewriteCss(); 

			} else if (result > 0){ 
				joinSuccess(); 
			} else { 
				alert("회원가입 실패"); 
			} 
		} 
	}) 
} 


function joinSuccess(){ 
	$("#frm").attr("action", "/user/joinSuccess"); 
	$("#frm").submit(); 
} 


</script> 

<form id="frm" method="post"> 

	<section id="body"> 
		<div class="login-wrap mo-wrap"> 
			<h1>JOIN</h1> 
			<input type="text" id="uId" name="uId" placeholder="ID" value=""> 
			<input type="text" id="userName" name="userName" placeholder="NAME" value=""> 
			<input type="email" id="email" id="email" name="email" placeholder="EMAIL" value=""> 
			<input type="text" id="phone" name="phone" class="papapa" placeholder="Phone Number" value="" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"> 
			<input type="password" id="userPw1" name="userPw1" placeholder="PassWoard" value=""> 
			<input type="password" id="userPw2" name="userPw2" placeholder="PassWoard Confirm" value=""> 
			<div class="privacyBox"> 
				<input type="radio" id="radioBox" name="radioBox"> 
				<label for="privacyChk">개인정보 수집 동의</label> 
			</div> 
			<a href="javascript:userInsert()" class="loginBtn justLoginBtn joinBtn">JOIN</a> 
		</div> 
	</section> 

</form> 


