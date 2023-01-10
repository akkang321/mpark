<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    function searchList() {

        $("#frm").attr("action", "/admin/getParkingHistory");
        $("#frm").submit();

    }

    function goPage(pageNo) {
        $("#pageNo").val(pageNo);
        $("#frm").attr("action", "/admin/getParkingHistory");
        $("#frm").submit();

    }
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
                                        <div class="back_Box">
                                            <div class="Df Ac W100">
                                                <h1 class="Wc7">미팍 1호점</h1>
                                                <p class="m-0 Wc8">이지섭</p>
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

                                        <div>
                                            <img src="static/picture/avatar-1.jpg" alt="" class="Mw_Ha">
                                        </div>
                                    </div>
                                </div>

                                <div class="PartnersDetailWrap">
                                    <div class="btm">
                                        <div class="tabBox">
                                            <button onclick="location.href='/admin/getPartner'">상세정보</button>
                                            <button onclick="location.href='/admin/getParkingHistory'" class="active">입출차</button>
                                            <button onclick="location.href='/admin/getParkingLots'">주차장 정보</button>
                                            <button onclick="location.href='/admin/getMyPartners'">직원목록</button>
                                        </div>

                                        <div id="subTabBox" class="subTabBox ht40">

                                            <div class="Search">
                                                <div>
                                                    <input type="text" name="Keyword" id="Keyword"
                                                           value="${param.Keyword}" placeholder="  전화번호 or 차량번호">
                                                    <p onclick="searchList()" id="Search">검색</p>
                                                </div>
                                            </div>

                                            <div>
                                                <p class="m-0">
                                                    <input type="date"  id="StartDate" 	name="StartDate" value="${StartDate}" class="calendar" style="width: 120px;"> ~
                                                    <input type="date"  id="EndDate"	name="EndDate"	 value="${EndDate}" class="calendar" style="width: 120px;">
                                                    <input type="submit" value="검색">
                                                </p>
                                            </div>

                                        </div>

                                        <div class="PartnersDetailCon2">
                                            <table>
                                                <thead>
                                                <tr>
                                                    <th><h5 class="m-0">차량번호</h5></th>
                                                    <th><h5 class="m-0">연락처</h5></th>
                                                    <th><h5 class="m-0">방문지</h5></th>
                                                    <th><h5 class="m-0">입차일시</h5></th>
                                                    <th><h5 class="m-0">출차일시</h5></th>
                                                    <th><h5 class="m-0">주차시간</h5></th>
                                                    <th><h5 class="m-0">결제금액</h5></th>
                                                    <th><h5 class="m-0">결제방법</h5></th>
                                                    <th><h5 class="m-0">현 상태</h5></th>
                                                </tr>
                                                </thead>
                                                <c:forEach var="list" items="${list}">
                                                    <tbody>
                                                    <tr>
                                                        <td>${list.LP}</td>
                                                        <td class="">${list.Contact}</td>
                                                        <td class="">${list.VisitPlace}</td>
                                                        <td class="">${list.EnterDateTime}</td>
                                                        <td class="">${list.ExitDateTime}</td>
                                                        <td class="">${list.TotalTime}</td>
                                                        <td class="">${list.Profit}원</td>
                                                        <td class="">${list.Payment}</td>
                                                        <td class="">
                                                            <button class="enter">
                                                                    ${list.Status}
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </c:forEach>
                                            </table>
                                        </div>
                                        <c:import url="page.jsp" />
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