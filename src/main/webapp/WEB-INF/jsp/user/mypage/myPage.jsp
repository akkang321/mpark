<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--
	<link rel="stylesheet" href="assets/all.css">
	<link rel="stylesheet" href="assets/test.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700|Voltaire" rel="stylesheet">

	<script src="assets/jquery.js"></script>
-->

<script>

	function refresh(){
		$("#frm").attr("action", "/user/mypage");
		$("#frm").submit();
	}

	function userInfoUpdate() {

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
				alert('새 비번을 입력하세요.');
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
				} else if( result > 0){
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

</script>

<form id="frm" method="post">
<input id="userId" name="userId" type="hidden" value="${selectMyPageInfo.U_ID}">
	<nav>
		<h1>
			<a href="/">
				<svg id="그룹_11" data-name="그룹 11" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="105" height="41.593" viewBox="0 0 105 41.593">
					<defs>
					  <clipPath id="clip-path">
						<rect id="사각형_131" data-name="사각형 131" width="105" height="41.593" fill="none"/>
					  </clipPath>
					</defs>
					<g id="그룹_10" data-name="그룹 10" clip-path="url(#clip-path)">
					  <path id="패스_44" data-name="패스 44" d="M0,43.378H7.5V58.512a23.9,23.9,0,0,0,.276,4.67,4.588,4.588,0,0,0,2.3,2.756,9.953,9.953,0,0,0,4.952,1.042A9.415,9.415,0,0,0,19.841,66a3.871,3.871,0,0,0,1.951-2.412,23.9,23.9,0,0,0,.328-4.747V43.378h7.5v14.68a28.552,28.552,0,0,1-.608,7.11,7.3,7.3,0,0,1-2.243,3.509A11.936,11.936,0,0,1,22.4,70.952a24.75,24.75,0,0,1-7.146.851,26.814,26.814,0,0,1-8.071-.928,11.792,11.792,0,0,1-4.347-2.4,7.22,7.22,0,0,1-2.1-3.1A25.7,25.7,0,0,1,0,58.285Z" transform="translate(0 -30.21)" fill="#e22786"/>
					  <path id="패스_45" data-name="패스 45" d="M94.144,57.481l5.659-.774a3.652,3.652,0,0,0,1.463,2.243,5.369,5.369,0,0,0,3.091.768A6.048,6.048,0,0,0,107.644,59a1.552,1.552,0,0,0,.743-1.349,1.269,1.269,0,0,0-.4-.958,4.788,4.788,0,0,0-1.886-.664q-6.821-1.355-8.649-2.47a4.813,4.813,0,0,1-2.528-4.3,5.114,5.114,0,0,1,2.187-4.181q2.19-1.691,6.784-1.693c2.912,0,5.081.427,6.494,1.278a6.593,6.593,0,0,1,2.931,3.785l-5.315.882a2.957,2.957,0,0,0-1.293-1.711,5.13,5.13,0,0,0-2.719-.6,6.708,6.708,0,0,0-3.189.559,1.174,1.174,0,0,0-.642,1.026,1.091,1.091,0,0,0,.563.919,22.879,22.879,0,0,0,5.266,1.423,16.721,16.721,0,0,1,6.286,2.252,4.47,4.47,0,0,1,1.769,3.767,5.574,5.574,0,0,1-2.451,4.519q-2.443,1.89-7.239,1.893a12.936,12.936,0,0,1-6.894-1.586,7.364,7.364,0,0,1-3.318-4.307" transform="translate(-65.565 -30.211)" fill="#e22786"/>
					  <path id="패스_46" data-name="패스 46" d="M159.706,43.79h5.033v2.694a7.285,7.285,0,0,1,2.652-2.246,8.008,8.008,0,0,1,3.708-.86,8.186,8.186,0,0,1,6.034,2.5,9.467,9.467,0,0,1,2.477,6.968,9.759,9.759,0,0,1-2.5,7.134,8.174,8.174,0,0,1-6.052,2.544,7.538,7.538,0,0,1-3.066-.6,10.227,10.227,0,0,1-2.894-2.071v9.229h-5.4Zm5.34,8.851A6.544,6.544,0,0,0,166.41,57.2a4.355,4.355,0,0,0,3.324,1.475,4.079,4.079,0,0,0,3.131-1.352q1.249-1.355,1.25-4.443a6.122,6.122,0,0,0-1.29-4.277,4.141,4.141,0,0,0-3.186-1.4,4.362,4.362,0,0,0-3.287,1.37,5.7,5.7,0,0,0-1.306,4.065" transform="translate(-111.225 -30.21)" fill="#e22786"/>
					  <path id="패스_47" data-name="패스 47" d="M236.4,56.209l5.352.808a7.991,7.991,0,0,1-3.26,4.022,10.378,10.378,0,0,1-5.57,1.382q-5.291,0-7.832-3.106a9.682,9.682,0,0,1-2.006-6.277,9.436,9.436,0,0,1,2.636-7.094,9.167,9.167,0,0,1,6.667-2.565,9.513,9.513,0,0,1,7.146,2.685q2.618,2.682,2.5,8.225H228.585a4.6,4.6,0,0,0,1.3,3.34,4.3,4.3,0,0,0,3.094,1.192,3.557,3.557,0,0,0,2.123-.62,3.765,3.765,0,0,0,1.3-1.991m.307-4.87a4.365,4.365,0,0,0-1.2-3.183,4.179,4.179,0,0,0-5.693.058,4.172,4.172,0,0,0-1.127,3.125Z" transform="translate(-155.363 -30.211)" fill="#e22786"/>
					  <path id="패스_48" data-name="패스 48" d="M301.769,49.21l-5.288.857a3.335,3.335,0,0,0-1.208-2.141,3.95,3.95,0,0,0-2.454-.719,4.228,4.228,0,0,0-3.2,1.241q-1.193,1.24-1.192,4.154,0,3.239,1.211,4.574A4.184,4.184,0,0,0,292.9,58.51a3.879,3.879,0,0,0,2.5-.777,4.489,4.489,0,0,0,1.37-2.682l5.266.805a8.258,8.258,0,0,1-3.146,4.919,10.543,10.543,0,0,1-6.237,1.662,9.863,9.863,0,0,1-7.091-2.519,9.166,9.166,0,0,1-2.642-6.974,9.178,9.178,0,0,1,2.655-7.011,9.984,9.984,0,0,1,7.171-2.513,10.63,10.63,0,0,1,5.887,1.432,7.937,7.937,0,0,1,3.14,4.36" transform="translate(-197.033 -30.238)" fill="#e22786"/>
					  <path id="패스_49" data-name="패스 49" d="M156.921,13.168l-1.635-5.029,4.277-3.106h-5.287L152.641,0l-1.634,5.033h-5.288L150,8.139l-1.634,5.029,4.277-3.109Z" transform="translate(-101.484 0)" fill="#fff"/>
					</g>
				</svg>
			</a>
		</h1>
	</nav>
<!--
    <div id="rightTop">
		<a href="MyPage.html">
			MY PAGE
			<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22">
				<g id="타원_10" data-name="타원 10" transform="translate(0 22) rotate(-90)" fill="none" stroke="#fff" stroke-width="1.5">
				  <circle cx="11" cy="11" r="11" stroke="none"/>
				  <circle cx="11" cy="11" r="10.25" fill="none"/>
				</g>
			</svg>
		</a>
	</div>
-->
<!--
	<div class="loadingCover">
		<div class="container">
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
		  </div>
	</div>
-->
<!--
	<script>
		window.onload = async() => {
			$('.loadingCover').fadeOut(500)
		}
	</script>
-->

	<section id="MyPage-body2">
		<c:import url="mMyPageMenu.jsp" />
        <div class="BuyPass-wrap">
            <h1>
                MY PAGE
                <svg xmlns="http://www.w3.org/2000/svg" width="34.332" height="34.332" viewBox="0 0 34.332 34.332">
                    <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(11.611 -9.611) rotate(45)">
                      <path id="패스_5" data-name="패스 5" d="M0,0H30.011" transform="translate(0 15.006)" fill="none" stroke="#fff" stroke-linejoin="round" stroke-width="2"/>
                      <path id="패스_6" data-name="패스 6" d="M0,0,15.006,15.006,0,30.011" transform="translate(15.006 0)" fill="none" stroke="#fff" stroke-width="2"/>
                    </g>
                </svg>
            </h1>
            <div class="mypageWrap">
                <div class="tabBox2">
                    <button onclick="PageChange(1);">수업관리</button>
                    <button onclick="PageChange(2);">패스 구매내역</button>
                    <button onclick="PageChange(3);">쿠폰</button>
                    <button onclick="PageChange(4);">회원정보 수정</button>
                </div>
                <div class="pageBox">
                    <div class="page1">
                        <div class="top">
                            <h1>수업관리</h1>
                            <select name="" id="">
                                <option value="">전체</option>
                                <option value="">1</option>
                            </select>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>수업일정</th>
                                    <th>강의명</th>
                                    <th>일정</th>
                                    <th>시간</th>
                                    <th>장소</th>
                                    <th>결제일자</th>
                                    <th>진행상황</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>수업예정</td>
                                    <td>No:ze - Oneday Class</td>
                                    <td>2022.03.08</td>
                                    <td>16:00</td>
                                    <td>Uspec 연습실 1</td>
                                    <td>2022.03.01</td>
                                    <td><button>취소</button></td>
                                </tr>
                                <tr class="page1-completion">
                                    <td>수업완료</td>
                                    <td>No:ze - Oneday Class</td>
                                    <td>2022.03.08</td>
                                    <td>16:00</td>
                                    <td>Uspec 연습실 1</td>
                                    <td>2022.03.01</td>
                                    <td><button>취소</button></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="pageNation">
                            <div class="pageNation-inner">
                                <button>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="27.1" height="14.813" viewBox="0 0 27.1 14.813">
                                        <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(27.1 14.407) rotate(180)">
                                          <path id="패스_1" data-name="패스 1" d="M7.5,18H34.1" transform="translate(-7.5 -11)" fill="none" stroke="#616161" stroke-linejoin="round" stroke-width="1"/>
                                          <path id="패스_2" data-name="패스 2" d="M18,7.5l9.8,7-9.8,7" transform="translate(-1.2 -7.5)" fill="none" stroke="#616161" stroke-linejoin="round" stroke-width="1"/>
                                        </g>
                                    </svg>
                                </button>
                                <div class="pageNumBox">
                                    <button>1</button>
                                </div>
                                <button>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="27.099" height="14.813" viewBox="0 0 27.099 14.813">
                                        <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(0 0.407)">
                                          <path id="패스_1" data-name="패스 1" d="M7.5,18H34.1" transform="translate(-7.5 -11)" fill="none" stroke="#616161" stroke-linejoin="round" stroke-width="1"/>
                                          <path id="패스_2" data-name="패스 2" d="M18,7.5l9.8,7-9.8,7" transform="translate(-1.2 -7.5)" fill="none" stroke="#616161" stroke-linejoin="round" stroke-width="1"/>
                                        </g>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="page2">
                        <div class="top">
                            <h1>패스 구매내역</h1>
                            <select name="" id="">
                                <option value="">전체</option>
                                <option value="">1</option>
                            </select>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>구매일자</th>
                                    <th>상품정보</th>
                                    <th>수량</th>
                                    <th>사용기간</th>
                                    <th>상품금액</th>
                                    <th>진행상황 </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2022.03.08</td>
                                    <td>No:ze - Oneday Class</td>
                                    <td>1</td>
                                    <td>~ 2022.12.31 PM 23:59</td>
                                    <td>15,000원</td>
                                    <td><button>취소</button></td>
                                </tr>
                                <tr class="page2-completion">
                                    <td>2022.03.08</td>
                                    <td>No:ze - Oneday Class</td>
                                    <td>1</td>
                                    <td>~ 2022.12.31 PM 23:59</td>
                                    <td>15,000원</td>
                                    <td><button>사용</button></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="pageNation">
                            <div class="pageNation-inner">
                                <button>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="27.1" height="14.813" viewBox="0 0 27.1 14.813">
                                        <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(27.1 14.407) rotate(180)">
                                          <path id="패스_1" data-name="패스 1" d="M7.5,18H34.1" transform="translate(-7.5 -11)" fill="none" stroke="#616161" stroke-linejoin="round" stroke-width="1"/>
                                          <path id="패스_2" data-name="패스 2" d="M18,7.5l9.8,7-9.8,7" transform="translate(-1.2 -7.5)" fill="none" stroke="#616161" stroke-linejoin="round" stroke-width="1"/>
                                        </g>
                                    </svg>
                                </button>
                                <div class="pageNumBox">
                                    <button>1</button>
                                </div>
                                <button>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="27.099" height="14.813" viewBox="0 0 27.099 14.813">
                                        <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(0 0.407)">
                                          <path id="패스_1" data-name="패스 1" d="M7.5,18H34.1" transform="translate(-7.5 -11)" fill="none" stroke="#616161" stroke-linejoin="round" stroke-width="1"/>
                                          <path id="패스_2" data-name="패스 2" d="M18,7.5l9.8,7-9.8,7" transform="translate(-1.2 -7.5)" fill="none" stroke="#616161" stroke-linejoin="round" stroke-width="1"/>
                                        </g>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="page3">
                        <div class="top">
                            <h1>쿠폰</h1>
                            <select name="" id="">
                                <option value="">전체</option>
                                <option value="">1</option>
                            </select>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>쿠폰번호</th>
                                    <th>쿠폰명</th>
                                    <th>혜택</th>
                                    <th>사용기간</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>a123458000</td>
                                    <td>Uspec 신규가입 Welcome 쿠폰</td>
                                    <td>5,000원 할인</td>
                                    <td>~ 2022.12.31 PM 23:59</td>
                                </tr>
                                <tr>
                                    <td>2022.03.08</td>
                                    <td>Uspec 연강할인 쿠폰</td>
                                    <td>10% 할인</td>
                                    <td>~ 2022.12.31 PM 23:59</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="couponField">
                            <input type="text" placeholder="쿠폰코드를 입력해주세요.">
                            <button>쿠폰 등록</button>
                        </div>
                    </div>
                    
                    <div class="page4">
                        <div class="top">
                            <h2>회원정보 수정</h2>
                        </div>
                        <div class="editBox nameBox">
                            <div class="txtBox">
                                <h3>아이디</h3>
                               	<c:choose>
									<c:when test="${selectMyPageInfo != null}">
										<p class="id-p">${selectMyPageInfo.U_ID}</p>
					 					<input type="hidden" id="userId" name="userId" value="${selectMyPageInfo.U_ID}">					 
									</c:when>
								<c:otherwise>
					 				<input type="text" id="userId" name="userId">
								</c:otherwise>
								</c:choose>
                            </div>
                        </div>
                        <div class="editBox nameBox">
                            <div class="txtBox">
                                <h3>이름</h3>
                                <input type="text" id="userName" name="userName" value="${ selectMyPageInfo.USER_NAME }">
                            </div>
                        </div>
                        <div class="editBox emailBox">
                            <div class="txtBox">
                                <h3>이메일</h3>
                                <input type="email" id="email" name="email" value="${ selectMyPageInfo.EMAIL }">
                            </div>
                        </div>
                        <div class="editBox telBox">
                            <div class="txtBox">
                                <h3>연락처</h3>
                                <input type="text" id="phone" name="phone" value="${ selectMyPageInfo.PHONE }">
                            </div>
                        </div>
                        <div class="editBox pwBox">
                            <div class="txtBox">
                                <h3>비밀번호</h3>
                                <input type="password" id="userPw1" name="userPw1" value="">
                            </div>
                        </div>
                        <div class="editBox pwBox">
                            <div class="txtBox">
                                <h3>비밀번호 확인</h3>
                                <input type="password" id="userPw2" name="userPw2" value="">
                            </div>
                        </div>
                        <div class="editBox pwBox">
                            <div class="txtBox">
                                <h3>신규 비밀번호</h3>
                                <input type="password" id="userPw" name="userPw">
                            </div>
                        </div>
                        <div class="btm">
                            <button class="WithdrawalBtn" onclick="memCancel()">회원탈퇴하기</button>
                            <button class="submitBtn" onclick="userInfoUpdate()">OK</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/parallax/2.1.3/parallax.min.js"></script>
	<script src="assets/all.js"></script>
	<script src="assets/test.js"></script>
	<script src="assets/header.js"></script>

    <script>
        var $page = $('.pageBox > div');
        $page.hide();
        $page.eq(3).show();
        function PageChange(tab) {
            $page.hide();
            $page.eq(tab - 1).show()
        }
    </script>


