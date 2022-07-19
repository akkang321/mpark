<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>

	function userCouponList(){ 
		$("#frm").attr("action","/user/couponList"); 
		$("#frm").submit(); 
	} 


	function userCouponInsert() { 
		var data = {'couponId': $('#couponId').val()};
		$.ajax({
			type: "post", 
			url: "/user/couponUseCheck",
			datatype:"json",
			data: data,
			success:function( result ) {
				if (result > 0){
					alert("이미 등록한 쿠폰입니다.")
				} else {
					$.ajax({
						type: "post", 
						url: "/user/userCouponInsert",
						datatype:"json",
						data: data,
						success:function( result ) {
							if (result > 0){
								alert("쿠폰등록완료")
								userCouponList();
							} else {
								alert("쿠폰번호를 잘못 입력하셨습니다.");
								userCouponList();
							}
						}
					})
				}
			}
		})
	}


	function userCouponUse() { 
		var couponId = $('#couponId').val(); 
		if (couponId){	// 쿠폰ID 있을 때 
			var data = {"couponId": couponId}; 
			$.ajax({
				type: "post", 
				url: "/user/couponIdCheck",
				datatype:"json",
				data: data,
				success:function( result ) {
					if (result > 0){
						userCouponInsert();
					} else {
						alert("쿠폰번호를 잘 못 입력하셨습니다.");
						userCouponList();
					}
				}
			})
		} else {
			alert('쿠폰코드를 입력하십시오.')
		}
	}


</script>


<form id="frm" name="frm" method="post">
	<section class="wrap">
	<c:import url="mMyPageMenu.jsp" />
		<div class="mypage_Box">
    		<div class="mypage_In_Box">
        		<div>
            		<div class="Df_Ac_Sb D_D">
                		<p class="mypagefont26">쿠폰</p>
                		<div class="Df D_D mo_pad14">
                    		<div class="coupon_Text_Box">
                        		<input type="text" placeholder="쿠폰코드를 입력해주세요." id="couponId" name="couponId" class="coupon_Text_Box_input">
                    		</div>
                    		<div class="ml10">
                        		<a href="javascript:userCouponUse()" class="cp_Box"> 
                           			<div class="cp_Box_in">
                            			<p class="color_W">쿠폰등록</p>
                           			</div>
                        		</a>
                    		</div>
                		</div>
            		</div>
        		</div>
        		<div class="border_black"></div>
				<c:set var="divClass"></c:set>
				<c:set var="divImg"></c:set>
				<c:forEach var="list" items="${ userCouponList }" varStatus="status"> 
					<c:if test="${ status.index%4 == 0 }">
						<c:choose>
							<c:when test="${divClass != 'coupon_img'}"> 
								<c:set var="divClass">coupon_img</c:set>
								<c:set var="divImg"><img src="/img/user/couponBox.png" alt=""></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="divClass">coupon_img_2</c:set>
								<c:set var="divImg"><img src="/img/user/couponBox_1.png" alt=""></c:set>
							</c:otherwise>
						</c:choose>
						<div class="${divClass}">
					</c:if>
					<div class="coupon_pr">
						${divImg}
						<div class="coupon_img_Text">
    						<p>${ list.COUPON_ID }</p>
							<p class="coupon_img_Text_1" >${ list.COUPON_NAME } 쿠폰</p> 
							<p class="coupon_img_Text_2">~ ${ list.EXPIRY_DATE } 까지 사용가능</p>
    					</div>
					</div>
					<c:if test="${ status.index%4 == 3 || status.count == userCouponList.size()}"> 
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${ userCouponList.size() == 0 }">
					<tr align="center">
						<td align="center">구매하신 쿠폰이 없습니다.</td> 
					</tr>
				</c:if>
            <div class="border_black"></div>
        </div>
    </div>
</section>
</form>


