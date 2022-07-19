<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <jsp:include page="/WEB-INF/jsp/user/layout/loading.jsp"/> -->


<head>
<!--
    <meta name="google-signin-scope" content="profile email"> 
    <meta name="google-signin-client_id" content="715826611914-p6hb40o5cofprbq7k3kf0ms71g59pqhf.apps.googleusercontent.com"> 
    <script src="https://apis.google.com/js/platform.js" async defer></script> 
-->
</head>


<script>

	window.onload = async () => { 
		$('.loadingCover').fadeOut(500) 
	} 

	function checkData(){
		if(!$('#uId').val()){
			alert('ID를 입력하세요.'); 
			$('#uId').focus();
			return false;
		}

		if(!$('#userPw').val()){
			alert('비번을 입력하세요.'); 
			$('#userPw').focus();
			return false;
		}
	}

	function join(){
		$("#frm").attr("action", "/userJoin"); 
		$("#frm").submit(); 
	}

	function loginProcess(){
		checkData();
		$("#frm").attr("action", "/user/loginProcess"); 
		$("#frm").submit();
	}

</script> 


<body>
	<script> 
/*
      function onSignIn(googleUser) { 
    	  alert('onSignIn 호출'); 
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server! 
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
        alert(profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
*/
    </script> 

<form id="frm" name="frm" method="post"> 
		<section id="login-body"> 
			<div class="login-wrap"> 
				<h1>LOGIN</h1> 
				<input type="text" id="uId" name="uId" placeholder="ID" class="ID" value=""> 
				<input type="password" id="userPw" name="userPw" placeholder="PASSWORD" class="pass" value=""> 
				<div class="Df_Ac_Sb"> 
					<a href="/userJoin" class="font-Size14">회원가입</a> 
					<div class="findBox"> 
						<a href="/findUserId">ID찾기</a> 
						<span>|</span> 
						<a href="/findUserPass">비번초기화</a> 
					</div> 
				</div> 
				<div class="mo_but"> 
					<button type="button" class="loginBtn justLoginBtn" onclick="javascript:loginProcess()">LOGIN</button> 

					<a href="#" type="button" class="loginBtn googleLoginBtn" id="GgCustomLogin"> 
						<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div> 
					</a>

				</div> 
			</div> 
		</section> 
</form> 

</body>


