<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                                        <div class="top_1">
                                            <div>
                                                <div>
                                                    <p class="m-0"><input type="date" value="기간별 검색" class="calendar"> ~ <input type="date" value="기간별 검색"
                                                            class="calendar"></p>
                                                </div>
                            
                                                <div class="insurance_Text_B ">
                                                    <div class="parking">
                                                        <div>
                                                            <p class="m-0">현 주차장 수 : </p>
                                                            <p class="m-0">${map.AllParkingLotCount}</p>
                                                        </div>
                                                        <div>
                                                            <p class="m-0">총 입출차량 :</p>
                                                            <p class="m-0">${map.AllEntranceAndExitCount}</p>
                                                        </div>
                                                        <div>
                                                            <p class="m-0">총 회차량 :</p>
                                                            <p class="m-0">${map.AllReturnCount}</p>
                                                        </div>
                                                        <div>
                                                            <p class="m-0">최종 입출차량 : </p>
                                                            <p class="m-0">${map.FinalEntranceAndExitCount}</p>
                                                        </div>
                                                    </div>
                                                    <div class="parking_1">
                                                        <div style="width: calc(100%/4);">
                                                            <p class="m-0">기본형 보험건수 : </p>
                                                            <p class="m-0">${map.AllATypeInsuranceCount}</p>
                                                        </div>
                                                        <div style="width: calc(100%/4);">
                                                            <p class="m-0" >렌트형 보험건수 : </p>
                                                            <p class="m-0">${map.AllBTypeInsuranceCount}</p>
                                                        </div>
                                                        <div style="width: calc(100%/4);">
                                                            <p class="m-0">총 보험료 :</p>
                                                            <p class="m-0">${map.AllInsuranceFee}</p>
                                                        </div>
                                                    </div>
                                                </div>
                            
                            
<!--                                                 <div class="Partners_Text_B hide_1">
                                                    <div class="parking">
                                                        <div>
                                                            <p>현 주차장 수 : </p>
                                                            <p>281</p>
                                                        </div>
                                                        <div>
                                                            <p>총 입출차량 :</p>
                                                            <p>5148 대 </p>
                                                        </div>
                            
                                                    </div>
                                                    <div class="parking_1">
                                                        <div>
                                                            <p>기본형 보험건수 : </p>
                                                            <p> 2500 대 </p>
                                                        </div>
                                                        <div>
                                                            <p>렌트형 보험건수 : </p>
                                                            <p>2648 대 </p>
                                                        </div>
                                                        <div>
                                                            <p>총 보험료 :</p>
                                                            <p> 1,790,000원 </p>
                                                        </div>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                            
                                        <div class="btm">
                            
                                            <div id="subTabBox" class="subTabBox">
                                                <div class="btn hide_1" onclick="Partners('N')" style="margin-right:20px ;">
                                                    <p>뒤로가기</p>
                                                </div>
                                    
                            
                                                <div class="Search">
                                                    <div>
                                                        <input type="text" name="" id="Search">
                                                        <p onclick="Search()" id="Search">검색</p>
                                                    </div>
                                                </div>
                                                <div class="btn">
                                                    <p> 캘린더형식 검색</p>
                                                </div>
                                            </div>
                            
                                            <div class="PartnersDetailCon2">
                                                <table class="insurance ">
                                                    <thead>
                                                        <tr>
                                                            <th><h5 class="m-0">차량번호</h5></th>
                                                            <th><h5 class="m-0">주차장 명</h5></th>
                                                            <th><h5 class="m-0">입차시간</h5></th>
                                                            <th><h5 class="m-0">출차시간</h5></th>
                                                            <th><h5 class="m-0">주차장 주소</h5></th>
                                                            <th><h5 class="m-0">보험종류</h5></th>
                                                            <th><h5 class="m-0">금액</h5></th>
                            
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    	<c:forEach var="list" items="${list}">
	                                                        <tr>
	                                                            <td>${list.LP}</td>
	                                                            <td class="">${list.Name}</td>
	                                                            <td class="">${list.EnterDateTime}</td>
	                                                            <td class="">${list.ExitDateTime}</td>
	                                                            <td class="">${list.ParkingLotAddress}</td>
	                                                            <td class="">${list.Insurance}</td>
	                                                            <td class="">${list.Insurance}</td>
	                                                            
	                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                            
                            
                            
                                                <!-- <table class="Partners hide_1">
                                                    <thead>
                                                        <tr>
                                                            <th>파트너스 명</th>
                                                            <th>보유 주차장 수</th>
                                                            <th>보험 등록 주차장 수</th>
                                                            <th>일반형</th>
                                                            <th>렌트형</th>
                                                            <th>일반형 건수</th>
                                                            <th>렌트형 건수</th>
                                                            <th>총 보험 적용 건수</th>
                                                            <th> 총 입출차량 </th>
                                                            <th>총 보험료 </th>
                                                            <th>총 보험수수료 </th>
                                                            <th>예치금 잔액</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>미팍</td>
                                                            <td>2 개</td>
                                                            <td>2 개</td>
                                                            <td>1 개</td>
                                                            <td>1 개</td>
                                                            <td>8 건</td>
                                                            <td>40 건</td>
                                                            <td>48 건</td>
                                                            <td> 50 대</td>
                                                            <td>???원</td>
                                                            <td>???원</td>
                                                            <td>215,000원</td>
                            
                                                        </tr>
                                                    </tbody>
                            
                                                </table> -->
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
        <!-- end main content-->


