<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

</script>

<form id="frm" method="post" action="">
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="back">
                                    <div class="Df W100 padding15">
                                        <div class="back_Box" style="position: relative;">
                                            <div class="Df Ac Wc2 Df_JS">
                                                <div class="Df Ac">
                                                    <h1 style="margin-right: 10px;">${info.PartnerName}</h1>
                                                    <p style="margin: 0 10px 0 0;">${info.OwnerName}</p>
                                                    <div class="C_button">
                                                        <button type="button"
                                                                class="btn btn-primary waves-effect waves-light"
                                                                onclick="correction()">수정하기
                                                        </button>
                                                        <button type="button"
                                                                class="btn btn-primary waves-effect waves-light put_text"
                                                                id="cancel" onclick="cancel()">취소하기
                                                        </button>
                                                    </div>
                                                </div>


                                            </div>
<%--                                            <div style="position: absolute; bottom: 0; left: 0; margin-bottom: 40px; margin-left: 15px;">--%>
<%--                                                <h5 class="m-0">서울특별시 서초구 서초대로 29</h5>--%>
<%--                                            </div>--%>
                                            <div class="Df Jc_Fr W100">
                                                <div>
<%--                                                    <div class="Df W100 Ac Wc2 ">--%>
<%--                                                        <p class="m-0">주차장 고유번호 :</p>--%>
<%--                                                        <p class="m-0">13923874758</p> <br>--%>
<%--                                                    </div>--%>
<%--                                                    <p class="m-0" style="text-align: center;"><u>QR 코드 다운로드</u></p>--%>
<%--                                                    <div class="Df Df_Ac mt10">--%>
<%--                                                        <p class="m-0 font-size-24  ">주차장 A</p>--%>
<%--                                                        <div class="Df AC ml30">--%>
<%--                                                            <p class="m-0">현 주차 상황</p>--%>
<%--                                                            <p class="m-0">상황 10/50</p>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
                                                </div>
                                            </div>

                                        </div>

                                        <div>
                                            <img src="static/picture/avatar-1.jpg" alt="" class="Mw_Ha">
                                        </div>

                                    </div>
                                </div>

                                <div class="PartnersDetailCon2">
                                    <table>
                                        <thead>
                                        <tr>
                                            <th colspan="4" onclick="visit()" id="visit" class="cursor background-B">
                                                방문지
                                            </th>
                                            <th colspan="3" onclick="visit()" id="visit_1" class="cursor hide_1">방문지
                                            </th>
                                            <th colspan="3" onclick="month()" id="month" class="cursor">월 주차</th>

                                        </tr>
                                        </thead>
                                        <tbody class="visit ">
                                        <tr>
                                            <td>방문지 명</td>
                                            <td>무료주차시간</td>
                                            <td>기본 요금</td>
                                            <td>기본 시간</td>
                                            <td>10분당 요금</td>
                                            <td>기타 방문지 10분당 요금</td>
                                            <td>일주차 요금</td>
                                        </tr>
                                        <c:forEach var="list" items="${list}">
                                        <tr>
                                            <td>${list.PlaceName}</td>
                                            <td>${list.FreeTime}</td>
                                            <td>${list.DefaultFee}원</td>
                                            <td>${list.DefaultTime}시간</td>
                                            <td>${list.TenMinutesFee}원</td>
                                            <td>${list.OtherPlaceFee}원</td>
                                            <td>${list.DayParkFee}원</td>
                                        </tr>
                                        </c:forEach>
<%--                                        <tr>--%>
<%--                                            <td>카페</td>--%>
<%--                                            <td>없음</td>--%>
<%--                                            <td>2,000원</td>--%>
<%--                                            <td>30분</td>--%>
<%--                                            <td>1,000원</td>--%>
<%--                                        </tr>--%>
                                        </tbody>

                                        <tbody class="month hide_1">
                                        <tr>
                                            <td>수유자명</td>
                                            <td>차량번호</td>
                                            <td>연락처</td>
                                            <td>계약 시작일시</td>
                                            <td>계약 만료일시</td>
                                            <td>계약금액</td>
                                        </tr>

                                        <tr>
                                            <td>임수열</td>
                                            <td>183가1314</td>
                                            <td>010-1511-1548</td>
                                            <td>2022년01월01일</td>
                                            <td>2022년01월31일</td>
                                            <td>100,000원</td>
                                        </tr>

                                        <tr>
                                            <td>홍길동</td>
                                            <td>11러1234</td>
                                            <td>010-1234-4848</td>
                                            <td>2021년11월3일</td>
                                            <td>2021년12월2일</td>
                                            <td>100,000원</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- end card body-->
                        </div> <!-- end card -->
                    </div><!-- end col-->

                </div>

            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
    </div>
</form>