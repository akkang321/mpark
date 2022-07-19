<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="KO">
<!--
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <script src="jquery.js"></script>
-->
    <style>
        .ticket1Wrap h1 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 40px;
        }

        .ticketBox {
            display: flex;
            align-items: center;
        }

        .ticketDiv {
            display: flex;
            align-items: center;
            margin-right: 40px;
        }

        .ticketDiv label {
            color: #333;
            font-size: 1.5rem;
            font-weight: 500;
            margin-right: 15px;
        } 

        .ticketDiv input {
            width: 100px;
            height: 37px;
            border-radius: 5px;
            border: 1px solid #333;
        }

        .ticket2Wrap input {
            width: 150px;
        }
    </style>

    <title>비용</title>
<script>
   function tPriceInsert() {
   	var priceName = $('#priceName').val();
   	var price = $('#price').val();
   	var teacherPrice = $('#teacherPrice').val();
   	var cnt = $('#cnt').val();
   	var discount = $('#discount').val();
   	var discount = $('#discount').val();
   	
	if (!priceName) {
		alert('제목을 입력하세요.');
		$('#priceName').focus();
		return false;
	}
	
	if (!price) {
		alert('가격을 입력하세요.');
		$('#price').focus();
		return false;
	}
	
	if (!teacherPrice) {
		alert('강사비를 입력하세요.');
		$('#teacherPrice').focus();
		return false;
	}
	
	if (!t_cnt) {
		alert('횟수를 입력하세요.');
		$('#t_cnt').focus();
		return false;
	}
	
	if (!discount) {
		alert('할인금액을 입력하세요');
		$('#discount').focus();
		return false;
	}
	
	if (!expirationDateCnt) {
		alert('만료수를 입력하세요');
		$('#expirationDateCnt').focus();
		return false;
	}
	
	$("#frm").attr("action", "/admin/tPriceInsert");
	$("#frm").submit();
	
   };
  
   function cPriceInsert() {
   	var priceName2 = $('#priceName2').val();
   	var price2 = $('#price2').val();
   	var teacherPrice2 = $('#teacherPrice2').val();
   	
	if (!priceName2) {
		alert('품목을 입력하세요.');
		$('#priceName2').focus();
		return false;
	}
	if (!price2) {
		alert('비용을 입력하세요.');
		$('#price2').focus();
		return false;
	}
	if (!teacherPrice2) {
		alert('강사비를 입력하세요.');
		$('#teacherPrice2').focus();
		return false;
	}
	
	$("#frm").attr("action", "/admin/cPriceInsert");
	$("#frm").submit();
	
   };
   
function priceList(){
	$("#frm").attr("action", "/admin/academyPriceList"); 
	$("#frm").submit();
};

function tPriceUpdate(cPId, index){
	var data = { 
					"c_pId":cPId
					,"cPriceName":$('#cPriceName'+index).val()
					,"price":$('#price'+index).val()
					,"teacherPrice":$('#teacherPrice'+index).val()
					,"cPriceCnt":$('#cPriceCnt'+index).val()
					,"discount":$('#discount'+index).val()
					,"expirationDateCnt":$('#expirationDateCnt'+index).val()
				}
	$.ajax({
		type: "post",
		url: "/admin/tPriceUpdate",
		dataType: "json",
		data: data,
		success: function( result ){
			if (result>0){
				alert("수정완료");
				priceList();
			} else {
				alert("수정 실패");
				priceList();
			}
		}
	});
};

function cPriceUpdate(cPId, index){
	var data = { 
					"c_pId": cPId
					,"priceName2": $('#cPriceName2'+index).val()
					,"price2": $('#cPrice2'+index).val()
					,"teacherPrice2": $('#cTeacherPrice2'+index).val()
					,"expirationDateCnt2":$('#expirationDateCnt2'+index).val()
				}

	$.ajax({
		type: "post",
		url: "/admin/cPriceUpdate",
		dataType: "json",
		data: data,
		success: function( result ){
			if (result>0){
				alert("수정완료");
				priceList();
			} else {
				alert("수정 실패");
				priceList();
			}
		}
	});
};

function priceDelete(c_pId){
	var data = { "c_pId": c_pId }
	$.ajax({
		type: "post",
		url: "/admin/priceDelete",
		datatype:"json",
		data: data,
		success:function( result ) {
			if (result>0){
				alert("삭제 성공");
				priceList();
			} else {
				alert("삭제 실패");
			}
		}
	});
};
   
   </script>
</head>
<form id="frm" method="POST">
    <div id="wrap">
                <div class="ticket1Wrap">
                    <h1>일비용(티켓)</h1>
                    <div class="ticketBox">
                        <div class="ticketDiv">
                            <label for="">품목</label>
                            <input type="text" id="priceName" name="priceName" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">가격</label>
                            <input type="text" id="price" name="price" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">강사비용</label>
                            <input type="text" id="teacherPrice" name="teacherPrice" /> 
                        </div>
                        <div class="ticketDiv">
                            <label for="">횟수</label>
                            <input type="text" id="t_cnt" name="t_cnt" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">할인</label>
                            <input type="text" id="discount" name="discount" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">만료수</label>
                            <input type="text" id="expirationDateCnt" name="expirationDateCnt" />
                        </div>
                        <div class="btnWrap" style="width: auto;">
                            <button type="button" class="confirmBtn" onclick="tPriceInsert()">추가</button>
                        </div>
                        <!--e:btnWrap-->
                    </div>

<!-- 티켓 -->
            <c:if test="${ tPriceList != null and tPriceList != '' }">
			<c:forEach var="tPriceList" items="${tPriceList}" varStatus="status">
                    <div class="ticketBox" style="margin:70px 0 20px;">
                        <div class="ticketDiv">
                            <label for="">품목</label>
                            <input type="text" id="cPriceName${status.index}" value="${tPriceList.C_PRICE_NAME}" style="background-color:lightyellow; font-weight:bold" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">가격</label>
                            <input type="text" id="price${status.index}" value="${tPriceList.PRICE}" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">강사비용</label>
                            <input type="text" id="teacherPrice${status.index}" value="${tPriceList.TEACHER_PRICE}" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">횟수</label>
                            <input type="text" id="cPriceCnt${status.index}" value="${tPriceList.C_PRICE_CNT}" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">할인</label>
                            <input type="text" id="discount${status.index}" value="${tPriceList.DISCOUNT}" />
                        </div>
                        <div class="ticketDiv"> 
                            <label for="">만료수</label>
                            <input type="text" id="expirationDateCnt${status.index}" value="${tPriceList.EXPIRATION_DATE_CNT}" />
                        </div>
                        
                        
                        <div class="btnWrap" style="width: auto;">
                            <button type="button" class="confirmBtn" onclick="tPriceUpdate('${tPriceList.C_P_ID}','${status.index}')">수정</button>
                            <button type="button" class="deleteBtn" onclick="priceDelete('${tPriceList.C_P_ID}')">삭제</button>
                        </div>
                        <!--e:btnWrap-->
                    </div>
			</c:forEach>
			</c:if>
		</div>			<!-- class="ticket1Wrap" -->

                <div class="ticket1Wrap ticket2Wrap" style="margin-top: 70px;">
                    <h1>기타(기간제)</h1>
                    <div class="ticketBox">
                        <div class="ticketDiv">
                            <label for="">품목</label>
                            <input type="text" id="priceName2" name="priceName2" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">비용</label>
                            <input type="text" id="price2" name="price2" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">강사비용</label>
                            <input type="text" id="teacherPrice2" name="teacherPrice2" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">만료수</label>
                            <input type="text" id="expirationDateCnt2" name="expirationDateCnt2" />
                        </div>
                        <div class="btnWrap" style="width: auto;">
                            <button type="button" class="confirmBtn" onclick="cPriceInsert()">추가</button>
                        </div>
                        <!--e:btnWrap-->
                    </div>

<!-- 기간제 --> 
            <c:if test="${ cPriceList != null and cPriceList != '' }">
			<c:forEach var="cPriceList" items="${cPriceList}" varStatus="status">
                    <div class="ticketBox" style="margin:70px 0 20px;"> 
                        <div class="ticketDiv">
                            <label for="">품목</label>
                            <input type="text" id="cPriceName2${status.index}" value="${cPriceList.C_PRICE_NAME}" style="background-color:lightyellow; font-weight:bold" /> 
                        </div>
                        <div class="ticketDiv">
                            <label for="">비용</label>
                            <input type="text" id="cPrice2${status.index}" value="${cPriceList.PRICE}" />
                        </div>
                        <div class="ticketDiv">
                            <label for="">강사비용</label>
                            <input type="text" id="cTeacherPrice2${status.index}" value="${cPriceList.TEACHER_PRICE}" />
                        </div>
                        <div class="ticketDiv"> 
                            <label for="">만료수</label>
                            <input type="text" id="expirationDateCnt2${status.index}" value="${cPriceList.EXPIRATION_DATE_CNT}" />
                        </div>
                        <div class="btnWrap" style="width: auto;">
                            <button type="button" class="confirmBtn"  onclick="cPriceUpdate('${cPriceList.C_P_ID}','${status.index}')">수정</button>
                            <button type="button" class="deleteBtn" onclick="priceDelete('${cPriceList.C_P_ID}')">삭제</button>
                        </div>
                        <!--e:btnWrap-->
				</div>
			</c:forEach>
			</c:if>
		</div>
	</div>			<!--e:wrap-->
</form>

