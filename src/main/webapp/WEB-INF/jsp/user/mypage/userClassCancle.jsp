<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script> 
	function userClassList(){ 
		$("#frm").attr("action","/user/userClassList"); 
		$("#frm").submit(); 
	} 

	function reservationCancel() { 
		var data = $("#frm").serialize();
		$.ajax({
			url: "/user/reservationCancel",
			type: "POST",
			data: data, 
			dataType: "json", 
			success: function( result ){
				if (result > 0){
					alert("예약취소 완료.");
					userClassList();
				} else{
					alert("예약취소 실패");
				}
			}
		})
	}
</script> 


<form id="frm" name="frm" method="post">
	<input type="hidden" id="rId" name="rId" value="${scheduleInfo.R_ID }">
	<input type="hidden" id="tId" name="tId" value="${scheduleInfo.T_ID }">
	<section class="white class_booking ">
        <div class="mypage_Text_Box mo_Df_Js_AC">
            <p class="pc_logo_1 mo_version">MY PAGE</p>
            <div class="mo_logo pc_logo">
                <a class="open">
                    <div class="Db">
                        <svg xmlns="http://www.w3.org/2000/svg" width="41" height="41" viewBox="0 0 41 41">
                            <g id="그룹_187" data-name="그룹 187" transform="translate(-329 -97)">
                                <g id="사각형_457" data-name="사각형 457" transform="translate(329 97)" fill="#fff"
                                    stroke="#191919" stroke-width="1">
                                    <rect width="41" height="41" rx="20.5" stroke="none" />
                                    <rect x="0.5" y="0.5" width="40" height="40" rx="20" fill="none" />
                                </g>
                                <path id="Icon_ionic-md-arrow-dropdown" data-name="Icon ionic-md-arrow-dropdown"
                                    d="M9,13.5l8.409,8.409L25.818,13.5" transform="translate(332.25 100.875)"
                                    fill="none" stroke="#191919" stroke-linecap="round" stroke-width="1" />
                            </g>
                        </svg>
                    </div>

                </a>
                <a id="X">
                    <div class="Dn_1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="21.213" height="21.213"
                            viewBox="0 0 21.213 21.213">
                            <g id="그룹_156" data-name="그룹 156" transform="translate(-317.778 -74.367)">
                                <path id="패스_90" data-name="패스 90" d="M4.5,9h26"
                                    transform="translate(322.374 66.235) rotate(45)" fill="none" stroke="#191919"
                                    stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
                                <path id="패스_91" data-name="패스 91" d="M0,0H26"
                                    transform="translate(337.577 75.781) rotate(135)" fill="none" stroke="#191919"
                                    stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
                            </g>
                        </svg>

                    </div>
                </a>
            </div>
        </div>

        <div id="mypage_menu" class="Dn">
            <div class="w100 Df_JC ">
                <div class="mypage_menu">
                    <div>
                        <a href="">
                            <p>회원 정보 수정</p>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <p>수업관리</p>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <p>USPEC PASS 관리</p>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <p>쿠폰</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="Df Df_JC">
            <div class="classBook_success mt152" id="cancel">
                <div class="classBook_success_sub">
                    <div class="cancel_X">
                        <a href="javascript:userClassList();" >
                            <svg xmlns="http://www.w3.org/2000/svg" width="21.213" height="21.213"
                                viewBox="0 0 21.213 21.213">
                                <g id="그룹_156" data-name="그룹 156" transform="translate(-317.778 -74.367)">
                                    <path id="패스_90" data-name="패스 90" d="M4.5,9h26"
                                        transform="translate(322.374 66.235) rotate(45)" fill="none" stroke="#191919"
                                        stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
                                    <path id="패스_91" data-name="패스 91" d="M0,0H26"
                                        transform="translate(337.577 75.781) rotate(135)" fill="none" stroke="#191919"
                                        stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
                                </g>
                            </svg>
                        </a>
                    </div>
                    <div class="">
                        <div class="mt84">
                            <p class="cancel_text">강의명</p>
                            <p class="cancel_text_class mt5">${scheduleInfo.CLASS_LEVEL} - ${scheduleInfo.FN_TEACHER_NAME}</p>
                        </div>
                        <div>
                            <p class="cancel_text mt28">수업 일정</p>
                            <p class="cancel_text_class mt5">${scheduleInfo.SCHEDULE_DATE} ${scheduleInfo.START_TIME}-${scheduleInfo.END_TIME}</p>
                        </div>
                    </div>
                    <div class="border_black"></div>
                    <div class="font-Size20 mt29 line_h_1_5">
                        <p>수업 예약을 취소하겠습니까?</p>
						<p>예약 취소 시 패스는 바로 반환됩니다.</p>
                    </div>
                    <div class="ok_btn mt44">
                        <a href="javascript:reservationCancel();">
                            <p>OK</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </section>
</form>


