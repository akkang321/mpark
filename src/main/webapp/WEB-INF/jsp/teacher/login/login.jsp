<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<script type="text/javascript"> 
$(document).ready(function(){ 
	if("${param.msg}") { 
		alert("아이디 비밀번호 확인하세요."); 
	} 
}); 
</script> 


<body> 
    <div id="wrap"> 
    	<form id="frm" method="post" action="/teacher/loginProcess"> 
			<div class="login"> 
				<h1>ZENITH 강사</h1> 
	            <div class="id"> 
	                <h2>아이디</h2> 
	                <input type="text" id="tId" name="tId" value="t001" placeholder="아이디"> 
	            </div><!--e:id-->
	            <div class="pw"> 
	                <h2>비밀번호</h2> 
	                <input type="password" id="userPw" name="userPw" value="123123" placeholder="비밀번호"> 
	            </div><!--e:pw-->
	            <button type="submit">로그인</button>
	        </div><!--e:login-->
        </form> 
    </div><!--e:wrap--> 
</body> 

