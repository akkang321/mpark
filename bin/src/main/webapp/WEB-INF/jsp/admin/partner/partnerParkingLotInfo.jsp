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
                                    <div class="back_Box" style="position: relative;">
                                        <div class="Df Ac Wc2 Df_JS">
                                            <div class="Df Ac">
                                                <h1 style="margin-right: 10px;">미팍 1호점</h1>
                                                <p style="margin: 0 10px 0 0;">이지섭</p>
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
                                        <div  style="position: absolute; bottom: 0; left: 0; margin-bottom: 40px; margin-left: 15px;">
                                            <h5 class="m-0">서울특별시 서초구 서초대로 29</h5>
                                        </div>
                                        <div class="Df Jc_Fr W100">
                                            <div>
                                                <div class="Df W100 Ac Wc2 ">
                                                    <p class="m-0">주차장 고유번호 :</p>
                                                    <p class="m-0">13923874758</p> <br>
                                                </div>
                                                <p class="m-0" style="text-align: center;"><u>QR 코드 다운로드</u></p>
                                                <div class="Df Df_Ac mt10">
                                                    <p class="m-0 font-size-24">주차장 A</p>
                                                    <div class="Df AC">
                                                        <p class="m-0">현 주차 상황</p>
                                                        <p class="m-0">상황 10/50</p>
                                                    </div>
                                                </div>
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
                                        <button onclick="location.href='partnersdetail_2.html'">입출차</button>
                                        <button class="active" onclick="">주차장 정보</button>
                                        <button onclick="location.href='partnersdetail_4.html'">직원목록</button>
                                    </div>
                                    <div class="headertite_Box">
                                        <p class="headertite m-0">주차장 목록</p>
                                    </div>

                                    <div class="PartnersDetailCon2">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>
                                                        <h5 class="m-0">주차장 명</h5>
                                                    </th>
                                                    <th>
                                                        <h5 class="m-0">방문지 수</h5>
                                                    </th>
                                                    <th>
                                                        <h5 class="m-0">주소</h5>
                                                    </th>
                                                    <th>
                                                        <h5 class="m-0">보험 유형</h5>
                                                    </th>
                                                    <th>
                                                        <h5 class="m-0">총 입출차</h5>
                                                    </th>
                                                    <th>
                                                        <h5 class="m-0">총 회차</h5>
                                                    </th>
                                                    <th>
                                                        <h5 class="m-0">주차면수</h5>
                                                    </th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- <tr onclick="location.href='parking_information.html'"
                                                    class="cursor"> -->
                                                <c:forEach var="list" items="${list}">
	                                                <tr>
	                                                    <td>${list.Name}</td>
	                                                    <td class="">${list.VisitPlacesCount}</td>
	                                                    <td class="">${list.Address}</td>
	                                                    <td class="">
										                	<c:choose>
										                		<c:when test="${list.Insurance == 'A'}">
										                			일반형
										                		</c:when>
										                		<c:when test="${list.Insurance == 'B'}">
										                			렌트형 
										                		</c:when>
										                		<c:otherwise>
										                			없음
										                		</c:otherwise>
										                	</c:choose>
	                                                    </td>
	                                                    <td class="">${list.AllEnterExitCarCount}</td>
	                                                    <td class="">${list.AllReturnCarCount}</td>
	                                                    <td class="">${list.NowParkedCarCount} / ${list.Spaces}</td>                               
	                                                </tr>
	                                            </c:forEach>
                                                <!-- </tr> -->                                                
                                            </tbody>
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
