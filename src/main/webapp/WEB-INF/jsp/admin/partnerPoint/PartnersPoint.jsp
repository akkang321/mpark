<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
	
function searchList(){
	
	$("#frm").attr("action","/admin/getPartnersPoints");
	$("#frm").submit();	
}

function goPage(pageNo) {
    $("#pageNo").val(pageNo);
    $("#frm").attr("action", "/admin/getPartnersPoints");
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
	                            <div class="PartnersDetailWrap">
	                                <div class="top_1">
	                                    <div>
	                                        <div>
                                                <p class="m-0">
                                                 	<input type="date"  id="StartDate" 	name="StartDate" value="${StartDate}" class="calendar" style="width: 120px;"> ~ 
                                                	<input type="date"  id="EndDate"	name="EndDate"	 value="${EndDate}" class="calendar" style="width: 120px;">
                                                	<input type="submit" value="검색">
                                                	</p>
	                                        </div>
	                    
	                                        <div class="insurance_Text_B ">
	                                            <div class="parking">
	                                                <div>
	                                                    <p class="m-0">현 주차장 수 : </p>
	                                                    <p class="m-0">${map.AllParkingLotCount}</p>
	                                                </div>
	                                                <div>
	                                                    <p class="m-0">총 입출차량 :</p>
	                                                    <p class="m-0">${map.AllEntranceAndExitCount} 대 </p>
	                                                </div>
	                                              
	                                            </div>
	                                            <div class="parking_1">
	                                                <div style="width: calc(100%/4);">
	                                                    <p class="m-0">기본형 보험건수 : </p>
	                                                    <p class="m-0"> ${map.AllATypeInsuranceCount} 대</p>
	                                                </div>
	                                                <div style="width: calc(100%/4);">
	                                                    <p class="m-0" >렌트형 보험건수 : </p>
	                                                    <p class="m-0">${map.AllBTypeInsuranceCount} 대 </p>
	                                                </div>
	                                                <div style="width: calc(100%/4);">
	                                                    <p class="m-0">총 보험료 :</p>
	                                                    <p class="m-0"> ${map.AllInsuranceFee}원 </p>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                    
	                                <div class="btm">
	                    
	                                    <div id="subTabBox" class="subTabBox">
	                                       
	                                       
	                                       
	                                       
	                                        <div class="Search">
	                                            <div>
	                                                <input type="text" name="PartnerName" id="PartnerName" value="${param.PartnerName}" placeholder="파트너 이름">
	                                                <p onclick="searchList()" id="Search">검색</p>
	                                            </div>
	                                        </div>
	                                    </div>
	                    
	                                    <div class="PartnersDetailCon2">
	                                        <table class="insurance ">
	                                            <thead>
	                                                <tr>
	                                                    <th><h5 class="m-0">파트너스 명</h5></th>
	                                                    <th><h5 class="m-0">보유 주차장 수</h5></th>
	                                                    <th><h5 class="m-0">보험 등록 주차장 수</h5></th>
	                                                    <th><h5 class="m-0">일반형</h5></th>
	                                                    <th><h5 class="m-0">렌트형</h5></th>
	                                                    <th><h5 class="m-0">일반형 건수</h5></th>
	                                                    <th><h5 class="m-0">렌트형 건수</h5></th>
	                                                    <th><h5 class="m-0">총 보험 적용 건수</h5></th>
	                                                    <th><h5 class="m-0">회차</h5></th>
	                                                    <th><h5 class="m-0">총 입출차량</h5></th>
	                                                    <th><h5 class="m-0">총 보험료</h5></th>
	                                                    <th><h5 class="m-0">총 보험중계수수료</h5></th>
	                                                    <th><h5 class="m-0">예치금 잔액</h5></th>
	                    
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                            	<c:forEach var="list" items="${list}">                                            
	                                                <tr>
	                                                    <td>${list.PartnerName}</td>
	                                                    <td class="">${list.ParkingLotCount} 개</td>
	                                                    <td class="">${list.InsuranceParkingLotCount} 개</td>
	                                                    <td class="">${list.ATypeParkingLotCount} 개</td>
	                                                    <td class="">${list.BTypeParkingLotCount} 개</td>
	                                                    <td class="">${list.ATypeInsuranceCount} 건</td>
	                                                    <td class="">${list.BTypeInsuranceCount} 건</td>
	                                                    <td class="">${list.InsuranceCount} 건</td>
	                                                    <td class="">${list.ReturnCount} 건</td>
	                                                    <td class="">${list.EntranceAndExitCount} 대</td>
	                                                    <td class="">${list.InsuranceFee}원</td>
	                                                    <td class="">${list.InsuranceBrokerageFee}원</td>
	                                                    <td class="">${list.Point}원</td>
	                                                </tr>
	                                                </c:forEach>
	                                            </tbody>
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