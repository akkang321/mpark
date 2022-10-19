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
                                        <button onclick="location.href='partnersdetail_2.html'">입출차</button>
                                        <button onclick="location.href='partnersdetail_3.html'">주차장 정보</button>
                                        <button class="active" onclick="">직원목록</button>
                                    </div>
                                    <div class="PartnersDetailCon2">
                                    	<c:forEach var="list" items="${list}">
	                                        <table>
	                                    
	                                            <div class="tite" >
	                                                <p class="m-0">${list.ParkingName}</p>
	                                            </div>
	                                   
	                                            <thead>
	                                                <tr>
	                                                    <th><h5 class="m-0">이름</h5></th>
	                                                    <th><h5 class="m-0">연락처</h5></th>
	                                                    <th><h5 class="m-0">생년월일</h5></th>
	                                                    <th><h5 class="m-0">E-Mail</h5></th>
	                                                    <th><h5 class="m-0">출근 시작일</h5></th>
	                                                    <th><h5 class="m-0">권한등급</h5></th>
	                                                    <th><h5 class="m-0">근퇴기록</h5></th>
	                                                  
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr>
	                                                    <td>이지섭</td>
	                                                    <td >010-1234-5678</td>
	                                                    <td >(최초 파트너는 공란)</td>
	                                                    <td >me.park@gmail.com</td>
	                                                    <td >(최초 파트너는 공란)</td>
	                                                    <td class="padding10"  >
	                                                        <div class="wh100" >
	                                                            <select name="" id="" >
	                                                                <option value="">관리자(정산자)</option>
	                                                            </select>
	                                                        </div>
	                                                    </td>
	                                                    <td  class="padding8" >
	                                                        <div class="cursor work"onClick="location.href='work_schedule.html'">
	                                                            <p >근퇴기록</p>
	                                                        </div>
	                                                    </td>
	                                                </tr>
	                                       
	                                                <tr>
	                                                    <td>임수열</td>
	                                                    <td >010-1234-5678</td>
	                                                    <td >1994.04.13</td>
	                                                    <td >me.park@gmail.com</td>
	                                                    <td >2022.01.13</td>
	                                                    <td class="padding10"  >
	                                                        <div class="wh100" >
	                                                            <select name="" id="" >
	                                                                <option value="">관리자(정산자)</option>
	                                                                <option value="">관리자</option>
	                                                                <option value="">직원</option>
	                                                            </select>
	                                                        </div>
	                                                    </td>
	                                                    <td  class="padding8" >
	                                                        <div class="cursor work" >
	                                                            <p >근퇴기록</p>
	                                                        </div>
	                                                    </td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
                                       	</c:forEach>
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
