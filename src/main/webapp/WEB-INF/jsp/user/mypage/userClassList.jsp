
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script> 

	function goPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/user/userClassList"); 
		$("#frm").submit(); 
	}

	function userClassList(){ 
		$("#frm").attr("action","/user/userClassList"); 
		$("#frm").submit(); 
	} 

// reservation type update 
	function reservationCancel(rId) { 
		$("#rId").val(rId);
		$("#frm").attr("action","/user/userClassCancle"); 
		$("#frm").submit(); 
	}

</script>


<form id="frm" name="frm" method="post"> 
<input type="hidden" id="uId" name="uId" value="${ userInfo.U_ID }">
<input type="hidden" id="rId" name="rId" > 
<input type="hidden" id="pageNo" name="pageNo"> 

<section class="wrap"> 
	<c:import url="mMyPageMenu.jsp" />
    <div class="mypage_Box">
        <div class="mypage_In_Box">
            <div>
                <p class="mypagefont26">수업관리</p>
            </div>
            <div class="border_black"></div>
            
            <c:forEach var="list" items="${userClassList}">
	            <div class="mypage_In_Box_Text">
	                <div class="mypage_Df_JSB">
	                    <p class="mypagefont">${ list.SCHEDULE_DATE }  ${ list.START_TIME }~${ list.END_TIME } |  ${ list.CLASS_ROOM }</p> 
	                    <p class="mypagefont color">${ list.FN_RESERVATION_TYPE }</p> 
	                </div> 
	                <div class="mypage_Df_JSB mypage_mt16"> 
	                    <p class="mypagefont24 font-B">${ list.CLASS_NAME } - ${ list.TEACHER_NAME }</p> 
	                    <p class="mypagefont">예약일자  ${ list.CREATE_DATE }</p> 
	                </div> 
					
					<c:if test="${list.RESERVATION_TYPE == 'C080100'}" >
		                <div class="cancel"> 
	                		<c:choose>
								<c:when test="${list.R_ID = 'C060100'}">
									<div class="cancel_btn">
										 <a href="javascript:reservationCancel('${list.R_ID}')"> 
				                        	<p>취소</p> 
				                        </a>
			                        </div>
								</c:when>
								<c:otherwise>
									<p>스페셜 취소는 고객센터에 문의해 주세요</p>
								</c:otherwise>
							</c:choose>	
		                </div>
	                </c:if>
	            </div>
            </c:forEach>
            
            <c:if test="${userClassList.size() == 0}">
            	<div class="mypage_In_Box_Text">
            		 <div class="mypage_Df_JSB">
            			예약혹은 종료인 수업이 없습니다
            		</div>
            	</div>
            </c:if>
            
        </div>

<c:import url="page.jsp" />


    </div>

</section>

</form>


