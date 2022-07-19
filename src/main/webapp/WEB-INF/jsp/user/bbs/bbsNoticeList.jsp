<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
	function goPage(pageNo){ 
		$("#pageNo").val(pageNo); 
		$("#frm").attr("action", "/bbsNoticeList"); 
		$("#frm").submit(); 
	} 
	
	
	function bbsNoticeInfo(bId){ 
		$('#bId').val(bId);
		$("#frm").attr("action", "/bbsNoticeInfo"); 
		$("#frm").submit(); 
	}
</script>


<form id="frm" name="frm" method="post"> 
<input type="hidden" id="pageNo" name="pageNo"> 
<input type="hidden" id="bId" name="bId"> 
        <section class="wrap">
            <div class="Notice_Box">
                <div class="">
                    <p style="font-size: 30px; font-weight: bolder;">NOTICE</p>
                </div>

                <div class="border_black"></div>
                <div class="NoTice_count">
                    <p>총 ${ bbsNoticeCnt } 건</p>
                </div>

<c:set var="divClass"></c:set>
<c:forEach var="list" items="${ bbsNoticeList }" varStatus="status">
	<c:if test="${ status.index%3 == 0 }">
		<c:choose>
			<c:when test="${divClass != 'coupon_img'}">
				<c:set var="divClass">coupon_img</c:set>
			</c:when>
			<c:otherwise>
				<c:set var="divClass">coupon_img_2</c:set>
			</c:otherwise>
		</c:choose>
		<div class="${ divClass }">
	</c:if>

    <div class="NoTice" onclick="bbsNoticeInfo('${ list.B_ID }')"> 
    	<div class="Notice_In_Box">
        <p class="NoTice_title">${ list.TITLE }</p> 
        <p class="NoTice_sub">${ list.CONTENTS }</p> 

        <div class="Notice_Df_Js"> 
        <p class="NoTice_day">${ list.CREATE_DATE }</p> 
        <div>
        	<svg xmlns="http://www.w3.org/2000/svg" width="23.49" height="19.689"
            viewBox="0 0 23.49 19.689">
            <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right"
            transform="translate(3.152 0.345)">
            <path id="패스_5" data-name="패스 5" d="M7.5,18H30.3"
            transform="translate(-10.652 -8.5)" fill="none" stroke="#191919"
            stroke-linejoin="round" stroke-width="1" />
            <path id="패스_6" data-name="패스 6" d="M18,7.5,27.043,17,18,26.5"
            transform="translate(-7.394 -7.5)" fill="none" stroke="#191919"
            stroke-width="1" />
            </g>
            </svg>
       	</div>
        </div>
        </div>
	</div>



	<c:if test="${ status.index%3 == 2 || status.count == bbsNoticeList.size()}"> 
		</div>
		</c:if>
</c:forEach> 


                    <c:if test="${ userCouponList.size() == 0 }">
						<tr align="center">
							<td align="center">공지사항이 없습니다.</td> 
						</tr>
					</c:if>


            <div class="border_black"></div>

            </div>

</section>
<c:import url="page.jsp" /> 
</form>


