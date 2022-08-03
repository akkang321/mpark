<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function() {
	
}) 

function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	console.log(googleUser);
	console.log(googleUser.getAuthResponse().id_token);
	$("#token").val(googleUser.getAuthResponse().id_token);
	$("#frm").submit(); 
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.'); 
    });
}

</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="582641289119-vge5hepgljfbeabh48r6km55iln3s2c9.apps.googleusercontent.com">

<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>

<form id="frm" method="post" action="/admin/loginProcess">
	<input type="hidden" id="token" name="token">
</form>

<body>
	<div id="wrap">
		<div id ="divBtn2"></div>
	<!-- <a href="#" onclick="signOut();">Sign out</a> -->
	</div><!--e:wrap-->
	
	<div class="Df Df_Ac Df_JC Me_Park_All_Box" >
		<div>
	  		<div>
	    		<p class="Me_Park">Me.Park</p>
	  		</div>
	  		<div class="cursor" >
	  			<div id ="divBtn"  class="g-signin2" data-onsuccess="onSignIn"></div>
				<!-- <a href="#" onclick="signOut();">Sign out</a> -->
	    	</div>
		</div>
	</div>
</body>

