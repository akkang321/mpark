<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="path2" value="${requestScope['javax.servlet.forward.query_string']}" />

 <!-- ========== Left Sidebar Start ========== -->
        <div class="vertical-menu">

            <div data-simplebar="" class="h-100">

                <!-- User details -->
                <div class="user-profile text-center mt-3">
                    <div class="">
                        <img src="static/picture/avatar-1.jpg" alt="" class="avatar-md rounded-circle">
                    </div>
                    <!-- <div class="mt-3">
                        <h4 class="font-size-16 mb-1">Julia Hudda </p>
                        <span class="text-muted"><i
                                class="ri-record-circle-line align-middle font-size-14 text-success"></i> Online</span>
                    </div> -->
                </div>

                <!--- Sidemenu -->
                <div id="sidebar-menu">
                    <!-- Left Menu Start -->
                    <ul class="metismenu list-unstyled" id="side-menu">
                        <li class="menu-title">Menu</li>

                        <li>
                            <a href="./index.html" class="waves-effect">
                                <i class="ri-dashboard-line"></i><span
                                    class="badge rounded-pill bg-success float-end">3</span>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="" class="waves-effect">
                                <i class="fa fa-address-card-o"></i>
                                <span>파트너스 신청</span>
                            </a>
                        </li>

                        <li>
                            <a href="./partnersdetail_1.html" class="waves-effect">
                                <i class="ri-team-line"></i>
                                <span>파트너스</span>
                            </a>
                        </li>
                        <li>
                            <a href="./client.html" class="waves-effect">
                                <i class="ri-account-circle-line"></i>
                                <span>고객</span>
                            </a>
                        </li>

                        <li>
                            <a href="./Partners_Sales.html" class=" waves-effect"><i class="ri-line-chart-line"></i>
                                <span>파트너스 매출관리</span>
                            </a>

                        </li>

                        <li>
                            <a href="./total_sales.html" class="waves-effect"><i class="ri-pie-chart-2-fill"></i>
                                <span>전체 매출관리</span>
                            </a>

                        </li>
                      
                        <li>
                            <a href="./premium_1.html" class=" waves-effect">
                                <i class="ri-shield-user-line"></i>
                                <span>미팍 예치금관리</span>
                            </a>

                        </li>
                        <li>
                            <a href="./premium.html" class=" waves-effect">
                                <i class="ri-shield-user-line"></i>
                                <span>DB손해보험 관리페이지</span>
                            </a>

                        </li>
                    </ul>
                </div>
                <!-- Sidebar -->
            </div>
        </div>
