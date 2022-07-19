<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<jsp:include page="/WEB-INF/jsp/user/layout/loading.jsp"/> 

<html>
<title>google login test</title> 
<head> 

    <meta name="google-signin-scope" content="profile email"> 
    <meta name="google-signin-client_id" content="715826611914-p6hb40o5cofprbq7k3kf0ms71g59pqhf.apps.googleusercontent.com"> 
    <script src="https://apis.google.com/js/platform.js" async defer></script> 

</head> 

<body> 

<section id="login-body"> 


<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div> 
    <script> 

      function onSignIn( googleUser ) { 
    	alert('onSignIn() 호출'); 

        // Useful data for your client-side scripts: 
        var profile = googleUser.getBasicProfile(); 
        console.log("ID: " + profile.getId()); // Don't send this directly to your server! 
        console.log('Full Name: ' + profile.getName()); 
        console.log('Given Name: ' + profile.getGivenName()); 
        console.log('Family Name: ' + profile.getFamilyName()); 
        console.log("Image URL: " + profile.getImageUrl()); 
        console.log("Email: " + profile.getEmail()); 

        // The ID token you need to pass to your backend: 
        var id_token = googleUser.getAuthResponse().id_token; 
        console.log("ID Token: " + id_token); 

      } 

    </script> 


</section> 

</body> 

</html> 


