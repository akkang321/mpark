<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	
function searchList(){
	
	$("#frm").attr("action","/admin/getDBManagementTest");
	$("#frm").submit();
	
}

function goPage(pageNo){
	$("#pageNo").val(pageNo);
	$("#frm").attr("action","/admin/getDBManagementTest");
	$("#frm").submit();
}
function table(){
	if ($('#open_table').css('display') == 'none'){
		$('#open_table').css('display','block');
	} else {
		$('#open_table').css('display','none');
	}
}

function table_close(){
	$('#open_table').css('display','none');
}


</script>
<form id="frm" method="post" action="" >
    <div class="main-content" >

        <div class="page-content" style="position: relative;">
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
                                                <div class="parking" >
                                                    <div  onclick="table()" style="cursor: pointer;">
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
                                        </div>
                                    </div>
                        
                                    <div class="btm">
                        
                                        <div id="subTabBox" class="subTabBox">
                                            <div class="btn hide_1" onclick="Partners('N')" style="margin-right:20px ;">
                                                <p>뒤로가기</p>
                                            </div>
                                
                        
                                            <div class="Search">
                                                <div>
                                                    <input type="text" name="Keyword" id="Keyword" value="${param.Keyword}" placeholder="  주차장명 or 차량번호">
                                                    <p onclick="searchList()" id="Search">검색</p>
                                                </div>
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
                                                     <tr style="font-size: 1.2rem; font-weight: bold;">
                                                         <td>${list.LP}</td>
                                                         <td class="">${list.Name}</td>
                                                         <td class="">${list.EnterDateTime}</td>
                                                         <td class="">${list.ExitDateTime}</td>
                                                         <td class="">${list.ParkingLotAddress}</td>
                                                         <td class="">
                                                         	<c:choose>
                                                         		<c:when test="${list.Insurance == 'A'}">
                                                         			일반형
                                                         		</c:when>
                                                         		<c:otherwise>
                                                         			렌트형
                                                         		</c:otherwise>
                                                         	</c:choose>
                                                         
                                                         </td>
                                                         <td class="">
                                                         	<c:choose>
                                                         		<c:when test="${list.Insurance == 'A'}">
                                                         			300원
                                                         		</c:when>
                                                         		<c:otherwise>
                                                         			400원
                                                         		</c:otherwise>
                                                         	</c:choose>
                                                         </td>
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
                        Copyright &copy; 2022.Company name All rights reserved
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

	<div >
	    <div id="open_table" class="open_table" style="display: none;">
	        <div class="open_table_Box">
	            <div class="open_table_Box_Sub">
	                <p class="close" onclick="table_close()">닫기</p>
	                <table style="padding: 20px;" class="table_border ">
	                    <thead style="text-align: center;" >
	                        <tr>
	                            <td>주차장명</td>
	                            <td>주소</td>
	                            <td>보험종류</td>
	                        </tr>
	                    </thead>
	                    <tbody class="table_body">
	                    	<c:forEach var="list" items="${listParkingLot}">
		                        <tr>
		                            <td>${list.Name}</td>
		                            <td>${list.Address}</td>
		                            <td>${list.Insurance}</td>
		                        </tr>
	                        </c:forEach>
	                    </tbody>
	                </table>
	            </div>  
	        </div>
	    </div>
	</div>
</form>