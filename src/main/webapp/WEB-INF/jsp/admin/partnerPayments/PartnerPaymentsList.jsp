<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

const realUpload = document.querySelector('.real-upload');
const upload = document.querySelector('.pont_cursor');

upload.addEventListener('click', () => realUpload.click());

function correction() {
    $('.put_text').removeClass('put_text');
    $('.in_text').addClass('put_text')
}

function cancel() {
    $('input').addClass('put_text');
    $('.in_text').removeClass('put_text')
    $('#cancel').addClass('put_text');
}
function visit(){
    $(".visit").show();
    $(".month").hide();
    $('#month').removeClass('background-B')
    $('#visit').addClass('background-B')
    $('#visit_1').hide();
    $("#visit").show();
}

function month(){
    $('.month').show();
    $(".visit").hide();
    $('#visit_1').show();
    $("#visit").hide();
    $('#visit').removeClass('background-B')
    $('#month').addClass('background-B')

}
      
function show() {
    $('#open').removeClass('hide');
}

function yoy() {
    $('#open').addClass('hide');
}

function searchList(){
    $("#frm").attr("action","/admin/getPartnersPayments");
    $("#frm").submit();
}

function goPage(pageNo){
    $("#pageNo").val(pageNo);
    $("#frm").attr("action","/admin/getPartnersPayments");
    $("#frm").submit();
}

</script>



<form id="frm" method="post" action="" >
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- <div class="back">
                                    <div class="Df W100 padding15">
                                        <div class="back_Box">
                                            <div class="Df Ac W100">
                                                <h1 class="Wc7">미팍 1호점</h1>
                                                <p class="m-0 Wc8">이지섭</p>
                                                <div class="C_button">
                                                    <button type="button"
                                                        class="btn btn-primary waves-effect waves-light"
                                                        onclick="correction()">수정하기</button>
                                                    <button type="button"
                                                        class="btn btn-primary waves-effect waves-light put_text"
                                                        id="cancel" onclick="cancel()">취소하기</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div>
                                            <img src="static/picture/avatar-1.jpg" alt="" class="Mw_Ha">
                                        </div>
                                    </div>
                                </div> -->

                                <div class="PartnersDetailWrap">

                                    <div class="btm" >
                                        <div class="PartnersDetailCon2">
                                            <table>
                                                <tr>
                                                    <td class="cursor  active client Wc2" onclick="">파트너스 목록</td>
                                                    <td class="cursor client Wc2">정산</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div id="subTabBox" class="subTabBox">

                                            <div class="Search">
                                                <div>
                                                    <input type="text" name="PartnerName" id="PartnerName" value="${param.PartnerName}" placeholder="  파트너스 이름">
                                                    <p onclick="searchList()" id="Search">검색</p>
                                                </div>
                                            </div>
<%--                                            <div class="btn" onclick="">--%>
<%--                                                <p style="width: 144px;"> 캘린더형식 검색</p>--%>
<%--                                            </div>--%>
<%--                                            <div class="Df Df_Ac ml30">--%>
<%--                                                <p class="m-0">${StartDate}</p> ~ <p class="m-0">${EndDate}</p>--%>
<%--                                            </div>--%>

                                            <p class="m-0">
                                                <input type="date"  id="StartDate" 	name="StartDate" value="${StartDate}" class="calendar" style="width: 120px;"> ~
                                                <input type="date"  id="EndDate"	name="EndDate"	 value="${EndDate}" class="calendar" style="width: 120px;">
                                                <input type="submit" value="검색">
                                            </p>
                                        </div>


                                        <div class="PartnersDetailCon2">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th><h5 class="m-0">파트너스</h5></th>
                                                        <th><h5 class="m-0">주차장 명</h5></th>
                                                        <th><h5 class="m-0">총 입출차 수</h5></th>
                                                        <th><h5 class="m-0">방문지</h5></th>
                                                        <th><h5 class="m-0">총 회차차량 수</h5></th>
                                                        <th><h5 class="m-0">현금결제 건수 및 금액</h5></th>
                                                        <th><h5 class="m-0">간편결제 건수 및 금액</h5></th>
                                                        <th><h5 class="m-0">총 매출</h5></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="list" items="${list}">
                                                        <tr onclick="">
                                                            <td>${list.PartnerName}</td>
                                                            <td class="">${list.ParkingName}</td>
                                                            <td class="">${list.EntranceExitCount}대</td>
                                                            <td class="">
                                                                <div class="Df W100 JC_SA">
                                                                    <p class="Df Df_Ac m-0">총 방문지 <u>${list.VisitPlaceCount}</u> 개</p>
                                                                    <div class="View_more cursor" onclick="show()">
                                                                        더보기
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="">${list.returnCount}대</td>
                                                            <td>
                                                                <div class="Df Df_Ac Df_JC">
                                                                    <p class=" m-0">${list.Payment1Count}건 </p> <p class="Solidus">&#47;</p>
                                                                    <p class=" m-0">${list.Payment1}원</p>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="Df Df_Ac Df_JC">
                                                                    <p class=" m-0">${list.Payment2Count}건 </p> <p class="Solidus">&#47;</p>
                                                                    <p class=" m-0">${list.Payment2}원</p>
                                                                </div>
                                                            </td>
                                                            <td>${list.Payment1 + list.Payment2}원</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <c:import url="page.jsp" />
                                        </div>
                                    </div>
                                </div>
                                <div class="open hide" id="open">

                                    <div class="open_text">
                                        <div class="Df Jc_Fd" onclick="yoy() ">
                                            <svg clip-rule="evenodd" style="width: 40px; height: 40px;" fill-rule="evenodd" class=" pointer"
                                                stroke-linejoin="round" stroke-miterlimit="2" viewBox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="m12 10.93 5.719-5.72c.146-.146.339-.219.531-.219.404 0 .75.324.75.749 0 .193-.073.385-.219.532l-5.72 5.719 5.719 5.719c.147.147.22.339.22.531 0 .427-.349.75-.75.75-.192 0-.385-.073-.531-.219l-5.719-5.719-5.719 5.719c-.146.146-.339.219-.531.219-.401 0-.75-.323-.75-.75 0-.192.073-.384.22-.531l5.719-5.719-5.72-5.719c-.146-.147-.219-.339-.219-.532 0-.425.346-.749.75-.749.192 0 .385.073.531.219z"/>
                                            </svg>
                                        </div>
                                        <div class="Df Df_JA font25">
                                            <p>미팍 1호점</p>
                                            <p>강원 빌딩</p>
                                        </div>
                                        <div class="mt40">
<%--                                            --%>
                                            <div style="text-align: center;">
                                                <p class="open_text_heard">1. A방문지</p>
                                            </div>
                                            <div class="w400">
                                                <div>
                                                    <div class="Df Df_JS">
                                                        <div class="Df">
                                                            <p>입출차 건수 </p> :
                                                            <p>???건</p>
                                                        </div>
                                                        <div class="Df">
                                                            <p>간편결제 건수 </p> :
                                                            <p>???건</p>
                                                        </div>
                                                    </div>
                                                    <div class="Df Df_JS">
                                                        <div class="Df">
                                                            <p>회차 건수 </p>:
                                                            <p>???건</p>
                                                        </div>
                                                        <div class="Df">
                                                            <p>현금결제 건수</p> :
                                                            <p>???건</p>
                                                        </div>
                                                    </div>
                                                    <div class="Df Df_JS">
                                                        <div class="Df">
                                                            <p>간편결제 </p>:
                                                            <p>???건</p>
                                                        </div>
                                                        <div class="Df">
                                                            <p>현금결제</p> :
                                                            <p>???건</p>
                                                        </div>
                                                        <div class="Df">
                                                            <p>총 매출</p> :
                                                            <p>???건</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
<%--                                            --%>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- end card body-->
                        </div> <!-- end card -->
                    </div><!-- end col-->

                </div>

            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->

        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2022.Company name All rights reserved.<a target="_blank"
                            href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-end d-none d-sm-block">
                            Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesdesign
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</form>

