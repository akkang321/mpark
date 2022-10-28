<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                                    </div>

                                    <div class="PartnersDetailWrap">
                                        <div class="btm">
                                            <div class="tabBox">
                                                <button onclick="location.href='partnersdetail_1.html'">상세정보</button>
                                                <button class="active" onclick="">입출차</button>
                                                <button onclick="location.href='partnersdetail_3.html'">주차장 정보</button>
                                                <button onclick="location.href='partnersdetail_4.html'">직원목록</button>
                                            </div>
                                            <div id="subTabBox" class="subTabBox ht40">
                                                
                                                <div class="Search">
                                                    <div>
                                                        <input type="text" name="" id="Search">
                                                        <p onclick="Search()" id="Search">검색</p>
                                                    </div>
                                                </div>

                                                <div class="btn " onclick="">
                                                    <p style="width: 144px;"> 캘린더형식 검색</p>
                                                </div>
                                                
                                            </div>

                                            <div class="PartnersDetailCon2">
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th><h5 class="m-0">차량번호</h5> </th>
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
                                                    <!--여기 코드 수정해야 -->
                                                    <c:forEach var="list" items="${list}">
                                                    <tbody>
                                                        <tr>
                                                            <td>11다1313</td>
                                                            <td class="">010-1234-5678</td>
                                                            <td class="">감자탕</td>
                                                            <td class="">2022.01.15
                                                                15:48:51</td>
                                                            <td class="">2022.01.15
                                                                09:40:15</td>
                                                            <td class="">01:01:46</td>
                                                            <td class="">0원</td>
                                                            <td class="">현금결제완료</td>
                                                            <td class="">
                                                                <button class="enter">
                                                                    입차중
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                    </c:forEach>                                       
                                                </table>
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
