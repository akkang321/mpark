<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>

	function refresh(){
		$("#frm").attr("action", "/user/userInfo");
		$("#frm").submit();
	}

	function checkData(){
		if (!$('#userName').val()) {
			alert('사용자명을 입력하세요.')
			$('#userName').focus();
			return false;
		}
	
		if (!$('#email').val()) {
			alert('이메일을 입력하세요.');
			$('#email').focus();
			return false;
		}
	
		if (!$('#phone').val()) {
			alert('핸드폰번호를 입력하세요.');
			$('#phone').focus();
			return false;
		}
			return true;
	}

	function userInfoUpdate(uId){ 
		
		if (!checkData()){ 
			return;
		}
		
			var userName = $('#userName').val(); 
			var email = $('#email').val(); 
			var phone = $('#phone').val(); 
			var userPw1 = $('#userPw1').val(); 
			var userPw2 = $('#userPw2').val(); 
			var userPw = $('#userPw').val(); 


			if(userPw1 != '' || userPw2 != ''){
				if(userPw1 != userPw2){
					alert('비번불일치, 다시입력하세요');
					$('#userPw2').focus();
					return false;
				}else{
					if(!userPw){
					alert('원래 비번을 입력하세요.');
					$('#userPw').focus();
					return false;
					}
				}

			var data = $("#frm").serialize();
			$.ajax({
				url: "/user/userInfoUpdate",
				type: "POST",
				data: data,
				dataType: "json",
				success: function( result ){
					if (result == 123){
						alert("비번이 맞지 않습니다, 다시입력하세요.");
					} else if( result > 0 ){
						alert("수정 완료");
						refresh();
					}else{
						alert("수정 실패");
					}
				}
			})
		}else{			// if문 끝
			
			var data = $("#frm").serialize();
			$.ajax({
				url: "/user/userInfoUpdate2",
				type: "POST",
				data: data,
				dataType: "json",
				success: function( result ){
					if( result > 0){
						alert("수정 완료");
						refresh()
					}else{
						alert("수정 실패");
					}
				}
			})
		}
	}

	function memCancle(){
		alert('memCancle');
	}
</script>


<form id="frm" name="frm" method="POST">
<section class="wrap">
    <c:import url="mMyPageMenu.jsp" />       
	<input type="hidden" id="uId" name="uId" value="${ userInfoCorrect.U_ID }">
    <div class="mypage_Box">
        <div class="mypage_In_Box">
            <div class="Df_JSB Df_Ac">
                <p class="mypagefont26">회원정보 수정</p>
                <div class="mo_PA">
                    <a href="" class="bb_line">
                        <p onclick="javascript:memCancle()">회원탈퇴하기</p>
                    </a>
                </div>
            </div>
            <div class="border_black"></div>
            <div class="mt37">
                <p class="pwd_Text">이름</p>
                <input class="pwd_font_Size18 pwd" id="userName" name="userName" value="${ userInfoCorrect.USER_NAME }"></input>
            </div>
            <div class="mt28">
                <p class="pwd_Text">이메일</p>
                <input class="pwd_font_Size18 pwd" id="email" name="email" value="${ userInfoCorrect.EMAIL }"></input>
            </div>
            <div class="mt28">
                <div class="Df Df_Ac">
                    <div class="w128">
                        <p class="pwd_Text">연락처</p>
                        <input class="pwd_font_Size18 pwd" id="phone" name="phone" value="${ userInfoCorrect.PHONE }"></input>
                    </div>

                </div>

            </div>

            <div class="mt28">
                <div class="Df Df_Ac">
                    <div>
                        <p class="pwd_Text">원래 비밀번호</p>
                        <input type="password" class="pwd" id="userPw" name="userPw">
                    </div>

                </div>
            </div>
            
            <div class="mt28">
                <div class="Df Df_Ac">
                    <div>
                        <p class="pwd_Text">새비밀번호</p>
                        <input type="password" class="pwd" id="userPw1" name="userPw1">
                    </div>

                </div>
            </div>
            
            <div class="mt28">
                <div class="Df Df_Ac">
                    <div>
                        <p class="pwd_Text">새비밀번호 확인</p>
                        <input type="password" class="pwd" id="userPw2" name="userPw2">
                    </div>

                </div>
            </div>

            <div class="ok_Box_All">
                <div class="ok_Box_Sub">
                    <a href="javascript:userInfoUpdate('${ userInfoCorrect.U_ID }')">
                        <p>OK</p>
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>
</form>
	
