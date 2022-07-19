<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$(function(){
    var price = $("#ticket > option:selected").attr("price");
    $("#sumPrice").html(Number(price).toLocaleString('ko-KR')+"원")
    $("#totalPrice").html(Number(price).toLocaleString('ko-KR')+"원")
    $("#payPrice").val(price);
    
});

var countNum = 1;
function count(type){
	if (type == 'plus'){
		countNum ++;
		var price = $("#ticket > option:selected").attr("price");
        $("#count").text(countNum);
        $("#sumPrice").html(Number(price * countNum).toLocaleString('ko-KR')+"원")
        $("#totalPrice").html(Number(price * countNum).toLocaleString('ko-KR')+"원")
        $("#ticketCnt").val(countNum);
        $("#tCnt").text(countNum);
        return false;
	} else {
		countNum --;
		if (countNum == 0 ){
			countNum = 1;
			return false;
		}
		var price = $("#ticket > option:selected").attr("price");
        $("#count").text(countNum);
        $("#sumPrice").html(Number(price * countNum).toLocaleString('ko-KR')+"원")
        $("#totalPrice").html(Number(price * countNum).toLocaleString('ko-KR')+"원")
        $("#ticketCnt").val(countNum);
        $("#tCnt").text(countNum);
        return false;
	}
}

function changeTicket() {
	var cPId= $("#ticket").val();
	var cnt = $("#ticket > option:selected").attr("cnt");
	var price = $("#ticket > option:selected").attr("price");
	$("#cPId").val(cPId);
	
	if (cnt>1){
		$('.counting_Box').hide();
		$("#price").html(Number(price).toLocaleString('ko-KR')+"원");
		$("#sumPrice").html(Number(price).toLocaleString('ko-KR')+"원");
		$("#totalPrice").html(Number(price).toLocaleString('ko-KR')+"원");
		$("#ticketCnt").val(cnt);
		$("#payPrice").val(price);
	} else {
		$('.counting_Box').show();
		$("#sumPrice").html(Number(price).toLocaleString('ko-KR')+"원")
		$("#totalPrice").html(Number(price).toLocaleString('ko-KR')+"원");
		$("#tCnt").text(1);
		$("#ticketCnt").val(1);
		$("#payPrice").val(price);
	}
	changeCoupon();
}

function changeCoupon() {
	var couponId= $("#couponId").val();
	var couponType = $("#couponId > option:selected").attr("couponType");
	var couponDiscount = $("#couponId > option:selected").attr("couponDiscount");
	var price = $("#ticket > option:selected").attr("price");
	var crId = $("#couponId > option:selected").attr("crId");
	$("#crId").val(crId);
	
	if (couponType == "C100100"){
		console.log(Number(price - couponDiscount));
		var totalPrice = Number(price - couponDiscount);
		if (totalPrice < 0) {
			totalPrice = 0;
		} 
		$("#totalPrice").html(totalPrice.toLocaleString('ko-KR')+"원");
		$("#discount").html(Number(couponDiscount).toLocaleString('ko-KR')+"원");
	} else if (couponType == "C100200"){
		$("#totalPrice").html(Number(price*(100-couponDiscount)/100).toLocaleString('ko-KR')+"원");
		$("#discount").html(Number(couponDiscount)+"%");
	} else {
		$("#totalPrice").html(Number(price).toLocaleString('ko-KR')+"원");
		$("#discount").html("0원");
	}
}

function pay(){
	var data = $("#frm").serialize();
	$.ajax({
		url: "/pay/buyTicket",
		type: "POST",
		data: data,
		dataType: "text",
		success: function( result ){
			if (result != "") {
				$("#pId").val(result);
				$("#frm").attr("action", "/pay/ticketInfoSucess");
				$("#frm").submit();
			} else {
				alert("실패");
			}
		} ,
		error:function(request,status,error){        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       }
	
	})
}
</script>

<form id="frm" method="POST">
	<c:choose>
		<c:when test="${classType == 'C060200'}">
			<input type="hidden" id="cPId" name="cPId" value="${ticketInfo.get(0).C_P_ID}">
		</c:when>
		<c:otherwise>
			 <input type="hidden" id="cPId" name="cPId" value="${ticketList.get(0).C_P_ID}">
		</c:otherwise>
	</c:choose>
	
	<input type="hidden" id="classType"	name="classType" value="${classType}">
	<input type="hidden" id="ticketCnt"	name="ticketCnt" value="1">
	<input type="hidden" id="payPrice" name="payPrice" value="1">
	<input type="hidden" id="pId" name="pId">
	<input type="hidden" id="cId" name="cId" value="${cId}">
	<input type="hidden" id="crId" name="crId" >
	
	<section class="white buy_section ">
		<div class="mo_version buy_pass">
			<p>
				USPEC PASS
			</p>
			<div class="btn">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
					<g id="그룹_133" data-name="그룹 133" transform="translate(-341 -88)">
						<g id="그룹_75" data-name="그룹 75">
							<g id="사각형_311" data-name="사각형 311" transform="translate(341 88)" fill="#fff"
								stroke="#191919" stroke-width="2">
								<rect width="30" height="30" rx="15" stroke="none" />
								<rect x="1" y="1" width="28" height="28" rx="14" fill="none" />
							</g>
						</g>
						<path id="Icon_ionic-md-arrow-dropdown" data-name="Icon ionic-md-arrow-dropdown"
							d="M9,13.5l6,6,6-6" transform="translate(341 87.5)" fill="none" stroke="#191919"
							stroke-linecap="round" stroke-width="2" />
					</g>
				</svg>

			</div>
		</div>
		<div class="buy_bt">
			<div class="uspec_pass pc_version">
				<p>USPEC PASS</p>
			</div>
			<div class="Df">
				<c:choose>
					<c:when test="${classType == 'C060200'}">
						<div class="oneday_pass special_pass_back">
							<a href="">
								<p class="special_pass_black">Oneday Pass</p>
							</a>
						</div>
						<div class="special_pass passB">
							<a href="">
								<p class="special_pass_white">Special Pass</p>
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="oneday_pass passB">
							<a href="">
								<p class="special_pass_white">Oneday Pass</p>
							</a>
						</div>
						<div class="special_pass special_pass_back">
							<a href="">
								<p class="special_pass_black">Special Pass</p>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="Df_JC">
			<div class="uspec_oneday_pass_AllBox">
				<div class="Df Df_Ac uspec_oneday_pass_SubBox">
					<svg xmlns="http://www.w3.org/2000/svg" width="54.848" height="43.288" viewBox="0 0 54.848 43.288">
						<g id="그룹_89" data-name="그룹 89" transform="translate(0.395 13.145) rotate(-16)">
							<g id="합치기_6" data-name="합치기 6" transform="translate(0)" fill="#e22786">
								<path
									d="M 39.46950149536133 30.48990058898926 L 7.399800777435303 30.48990058898926 C 3.506790637969971 30.48990058898926 0.3396006226539612 27.32271003723145 0.3396006226539612 23.42970085144043 C 0.3396006226539612 22.12280082702637 0.6990606188774109 20.84687995910645 1.379120588302612 19.7398796081543 L 1.606310606002808 19.37005043029785 L 1.398840665817261 18.98880958557129 C 0.8401206135749817 17.96208953857422 0.5448006391525269 16.79701042175293 0.5448006391525269 15.61950016021729 C 0.5448006391525269 14.31290054321289 0.9042906165122986 13.03715991973877 1.584400653839111 11.93019008636475 L 1.811640620231628 11.56033039093018 L 1.604130625724792 11.17905044555664 C 1.045350670814514 10.15235996246338 0.7500005960464478 8.987430572509766 0.7500005960464478 7.810200214385986 C 0.7500005960464478 3.917190313339233 3.917190551757812 0.7500002980232239 7.810200691223145 0.7500002980232239 L 39.87990188598633 0.7500002980232239 C 43.77291107177734 0.7500002980232239 46.94010162353516 3.917190313339233 46.94010162353516 7.810200214385986 C 46.94010162353516 9.11677074432373 46.58061218261719 10.39249992370605 45.90048217773438 11.49949073791504 L 45.67324066162109 11.86935043334961 L 45.88076019287109 12.25063037872314 C 46.43954086303711 13.27733039855957 46.73490142822266 14.4422607421875 46.73490142822266 15.61950016021729 C 46.73490142822266 16.92636108398438 46.37544250488281 18.2022705078125 45.69536972045898 19.30929946899414 L 45.46818161010742 19.67913055419922 L 45.67565155029297 20.06036949157715 C 46.23437118530273 21.08710098266602 46.52970123291016 22.25218963623047 46.52970123291016 23.42970085144043 C 46.52970123291016 27.32271003723145 43.36251068115234 30.48990058898926 39.46950149536133 30.48990058898926 Z"
									stroke="none" />
								<path
									d="M 39.46950149536133 29.73990058898926 C 42.94895935058594 29.73990058898926 45.77970123291016 26.90916061401367 45.77970123291016 23.42970085144043 C 45.77970123291016 22.37705039978027 45.51591873168945 21.3359203338623 45.01687240600586 20.41887092590332 L 44.6019401550293 19.65637969970703 L 45.05632019042969 18.9167308807373 C 45.66379928588867 17.9278507232666 45.98490142822266 16.78769111633301 45.98490142822266 15.61950016021729 C 45.98490142822266 14.56713008880615 45.72109222412109 13.52618026733398 45.22200012207031 12.60916042327881 L 44.80698013305664 11.84660053253174 L 45.26145935058594 11.10687065124512 C 45.86898040771484 10.11805057525635 46.19010162353516 8.978080749511719 46.19010162353516 7.810200214385986 C 46.19010162353516 4.330740451812744 43.35935974121094 1.500000238418579 39.87990188598633 1.500000238418579 L 7.810200691223145 1.500000238418579 C 4.330740451812744 1.500000238418579 1.500000596046448 4.330740451812744 1.500000596046448 7.810200214385986 C 1.500000596046448 8.862560272216797 1.763800621032715 9.903520584106445 2.262880563735962 10.82052993774414 L 2.677900552749634 11.58308982849121 L 2.2234206199646 12.32281017303467 C 1.615910649299622 13.31161022186279 1.294800639152527 14.4515905380249 1.294800639152527 15.61950016021729 C 1.294800639152527 16.67214965820312 1.558580636978149 17.71327018737793 2.057620525360107 18.63031005859375 L 2.472550630569458 19.39279937744141 L 2.018160581588745 20.13245964050293 C 1.410690665245056 21.12131118774414 1.089600563049316 22.26147079467773 1.089600563049316 23.42970085144043 C 1.089600563049316 26.90916061401367 3.920340538024902 29.73990058898926 7.399800777435303 29.73990058898926 L 39.46950149536133 29.73990058898926 M 39.46950149536133 31.23990058898926 L 7.399800777435303 31.23990058898926 C 3.086100578308105 31.23990058898926 -0.4103993773460388 27.74340057373047 -0.4103993773460388 23.42970085144043 C -0.4103993773460388 21.93317985534668 0.01029061619192362 20.53524017333984 0.740070641040802 19.34729957580566 C 0.1371806114912033 18.23941993713379 -0.2051993906497955 16.96964073181152 -0.2051993906497955 15.61950016021729 C -0.2051993906497955 14.12329006195068 0.2155906111001968 12.72539043426514 0.945370614528656 11.5375804901123 C 0.3424806296825409 10.42983055114746 6.164550541143399e-07 9.160059928894043 6.164550541143399e-07 7.810200214385986 C 6.164550541143399e-07 3.496500253677368 3.496500730514526 2.94494640229459e-07 7.810200691223145 2.94494640229459e-07 L 39.87990188598633 2.94494640229459e-07 C 44.19359970092773 2.94494640229459e-07 47.69010162353516 3.496500253677368 47.69010162353516 7.810200214385986 C 47.69010162353516 9.30640983581543 47.26929092407227 10.70429039001465 46.53950881958008 11.89210033416748 C 47.14241027832031 12.99985027313232 47.48490142822266 14.26963996887207 47.48490142822266 15.61950016021729 C 47.48490142822266 17.11602973937988 47.06418991088867 18.51394081115723 46.33441925048828 19.70187950134277 C 46.93730926513672 20.80976104736328 47.27970123291016 22.07956123352051 47.27970123291016 23.42970085144043 C 47.27970123291016 27.74340057373047 43.78319931030273 31.23990058898926 39.46950149536133 31.23990058898926 Z"
									stroke="none" fill="#191919" />
							</g>
							<text id="PASS" transform="translate(9.98 18.379)" fill="#fff" font-size="10"
								font-family="Montserrat-Bold, Montserrat" font-weight="700">
								<tspan x="0" y="0">PASS</tspan>
							</text>
						</g>
					</svg>
					<c:choose>
						<c:when test="${classType == 'C060200'}">
							<p>Uspec Special Pass</p>
						</c:when>
						<c:otherwise>
							 <p>Uspec Oneday Pass</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="padding20" id="Df">
					<div class="uspec_oneday_pass_InBox">
						<div class="mt30">
							<p class="font-Size20 bold">수강료</p>
							<div class="mt16">
								<c:forEach var="list" items="${ticketList}">
									<p>${list.C_PRICE_NAME} - <fmt:formatNumber value="${list.PRICE}" pattern="#,###" />원
										<c:if test="${list.DISCOUNT > 0 }">
											 (할인 :  <fmt:formatNumber value="${list.DISCOUNT}" pattern="#,###" />원)
										</c:if>
									</p>
								</c:forEach>					
							</div>
							<div class="mt84">
								<p>Pass로 1회 수업을 들을 수 있습니다. 어쩌구정보들... 환불은 고객센터를 통해 어쩌구...</p>
							</div>
						</div>
					</div>
					<div class="uspec_oneday_pass_InBox_M">
						<div class="uspec_oneday_pass_InBox_M_sub">
							<div>
								<select id="ticket" onchange="changeTicket();">
									<c:choose>
										<c:when test="${classType == 'C060200'}">
											 <c:forEach var="list" items="${ticketInfo}">
												<option value="${list.C_P_ID}" cnt="1" price="${list.PRICE}" discount="${list.DISCOUNT }">${list.C_PRICE_NAME}</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											 <c:forEach var="list" items="${ticketList}">
												<option value="${list.C_P_ID}" cnt="${list.C_PRICE_CNT}" price="${list.PRICE}" discount="${list.DISCOUNT }">${list.C_PRICE_NAME}</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>
	                            </select>
							</div>
							<div class="counting_Box">
								<c:if test="${classType != 'C060200' }">
									<div class="counting_Box_InP" onclick='count("plus")'>
										<a><div>+</div></a>
									</div>
								</c:if>
								<div>
									<p class="font-Size18" id="tCnt">1</p>
								</div>
								<c:if test="${classType != 'C060200' }">
									<div class="counting_Box_InM" onclick='count("minus")'>
										<a>-</a>
									</div>
								</c:if>
							</div>
							<div class="border_line"></div>
							<div class="mt22">
								<p class="font-Size18">쿠폰 선택</p>
								<select onchange="changeCoupon();" id="couponId" name="couponId">
									<c:choose>
										<c:when test="${couponList.size() ==0}">
											 <option value="">사용가능 쿠폰 없음</option>
										</c:when>
										<c:otherwise>
											 <option value="">쿠폰을 선택해주세요 </option>
											 <c:forEach var="list" items="${couponList}">
											 	<option value="${list.COUPON_ID}" crId="${list.CR_ID}" couponType="${list.COUPON_TYPE}" couponDiscount="${list.COUPON_DISCOUNT}">${list.COUPON_NAME }</option>
											 </c:forEach>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
							<div class="Df Coupon_registration">
								<p><a href="/user/couponList">쿠폰등록하기 →</a></p>
							</div>
						</div>
					</div>
					<div class="uspec_oneday_pass_InBox_R">
						<div class="Df amount">
							<p class="font-Size20">총 상품 금액</p>
							<p class="bold font-Size24" id="sumPrice"></p>
						</div>
						<div class="Df coupon_discount">
							<p class="font-Size20">쿠폰 할인</p>
							<p class="bold font-Size24" id="discount">0원</p>
						</div>
						<div class="border_line"></div>
						<div class="Df final_amount">
							<p class="font-Size20">최종 결제 금액</p>
							<p class="bold font-Size24 total" id="totalPrice"></p>
						</div>

						<div class="buy_button">
							<a href="javascript:pay();">
								<p>BUY</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</form>

