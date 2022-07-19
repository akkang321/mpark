<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
function scheduleBook(){
	if (!$("#checkRadio").is(":checked")) {  
		alert("반드시 동의해야 합니다.").$("#checkRadio1").focus();    
		return;  
	}

	var data = $("#frm").serialize();
	$.ajax({
		url: "/scheduleTicketBook",
		type: "POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result == 99){
				alert("로그인후 예약 가능합니다.");
				window.location.href = "/login";
			} else if (result == 98){
				alert("이미 예약 상태입니다.");
			} else if (result == 97){
				alert("과거 시간은 예약할수 없습니다.");
			} else if (result == 96){
				alert("티켓이 이미 매진 완료 입니다.");
			} else if (result == 95){
				$("#frm").attr("action", "pay/ticketInfo");
				$("#frm").submit();
			} else if (result == 0){
				alert("예약이 실패했습니다. 잠시후 다시 시도해 보세요");
			} else {
				$("#frm").attr("action", "/bookSuccess");
				$("#frm").submit();
			}
		}
	})
}
</script>

<form id="frm" method="POST">
	<input type="hidden" name="sId" value="${param.sId}">
	<input type="hidden" name="cPId" value="${scheduleInfo.C_P_ID}">
	<input type="hidden" name="cId" value="${scheduleInfo.C_ID}">
	<input type="hidden" name="classType" value="${scheduleInfo.CLASS_TYPE}">
	<section class="white class_booking ">
        <div class="mo_version moclass_booking">
            <p>
                CLASS BOOKING
            </p>
           
        </div>
        <div class="buy_bt_1">
            <div class="uspec_pass pc_version">
                <p>CLASS BOOKING</p>
            </div>

        </div>
        <div class="Df_JC">
            <div class="uspec_oneday_pass_AllBox">
                <div class="Df Df_Ac uspec_oneday_pass_SubBox_1">

                    <p>수업 정보 <c:if test="${scheduleInfo.CLASS_TYPE eq 'C060200'}"> <p style="color: red;">(SPECIAL)</p></c:if></p>
                </div>
                <div class="padding20" id="Df">
                    <div class="uspec_oneday_pass_InBox">
                        <div class="mt30_1">
                            <div class="mt25">
                                <p class="class_Preface">${scheduleInfo.CLASS_NAME}</p>
                                <p class="mt5">${scheduleInfo.CLASS_LEVEL} - ${scheduleInfo.FN_TEACHER_NAME}</p>
                            </div>
                            <div class="mt25">
                                <p class="class_Preface">수업 일정</p>
                                <c:choose>
									<c:when test="${scheduleInfo.CLASS_TYPE eq 'C060100'}">
										<p class="mt5">${scheduleInfo.SCHEDULE_DATE} ${scheduleInfo.START_TIME} ~ ${scheduleInfo.END_TIME}</p>		 
									</c:when>
									<c:otherwise>
										 <p class="mt5">${scheduleInfo.START_DATE} ~ ${scheduleInfo.END_DATE}</p>
									</c:otherwise>
								</c:choose>
                            </div>
                            <div class="mt25">
                                <p class="class_Preface">장소</p>
                                <p class="mt5">${scheduleInfo.CLASS_ROOM}</p>
                            </div>
                            <div class="mt25">
                                <p class="class_Preface">문의</p>
                                <p class="mt5">Uspec 02-555-5555</p>
                                <p class="mt5">uspec.help@uspec.co.kr</p>
                            </div>
                        </div>
                    </div>
                    <div class="uspec_oneday_pass_InBox_M">
                        <div class="uspec_oneday_pass_InBox_M_sub">
                            <div>
                                <div  class="mt25">
                                    <p class="class_Preface">수강생 이름</p>
                                    <p class="mt5">${userInfo.USER_NAME}</p>
                                </div>
                                <div  class="mt25">
                                    <p class="class_Preface">이메일</p>
                                    <p class="mt5">${userInfo.EMAIL}</p>
                                </div>
                                <div  class="mt25">
                                    <p class="class_Preface">연락처</p>
                                    <p class="mt5">${userInfo.PHONE}</p>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="uspec_oneday_pass_InBox_R">
                        <div class="mt30">
                            <p>수업 취소는 수업 시작 60분전 까지만 가능합니다.
					                                예약 후 수업 미 참석시 해당 Pass권은 사용된 것으로 간주 됩니다. 수업 취소는 수업 시작 60분전 까지만 가능합니다.
					                                예약 후 수업 미 참석시 해당 Pass권은 사용된 것으로 간주 됩니다. </p>
                            <a href="#" ><input type="radio" id="checkRadio" value="1"> 예약 내용을 확인하였으며, 정보 제공 등에 동의합니다.</a>
                        </div>

                        <div class="buy_button_1">
                            <a href="javascript:scheduleBook();">
                                <p>BOOKING</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</form>

