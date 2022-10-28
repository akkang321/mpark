<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <div class="main-content">
	<div class="page-content">
		<div class="container-fluid">
			<div class="row">
				<form class="app-search d-none d-lg-block " style="margin-left: 13px;">
					<div class="position-relative" style="width: 170px;">
						<input type="text" class="form-control" placeholder="Search..." style="color: black; background-color: white;">
						<span class="ri-search-line" style="color: black;"></span>
					</div>
				</form>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<c:forEach var="list" items="${list}">
								<div class="part_Box">
								    <div>
								        <h3>새로운 파트너스 신청 : ${list.PartnerName}</h3>
								        <div>
								            <div class="Df">
								                <div class="part_Text">
								                    <p class="m-0">대표자 명 : </p>
								                    <p class="m-0">${list.OwnerName}</p>
								                </div>
								                <div class="part_Text">
								                    <p class="m-0">E-Mail :</p>
								                     <p class="m-0">${list.OwnerEmail}</p>
								                </div>
								            </div>
								        </div>
								
								        <div class="Df">
								            <div class="part_Text">
								                 <p class="m-0">전화번호 :  </p>
								                 <p class="m-0">${list.PhoneNumber}</p>
								            </div>
								            <div class="part_Text">
								                 <p class="m-0">사업자 번호 : </p>
								                 <p class="m-0">${list.PartnerBN}</p>
								            </div>
								            <div class="part_Text">
								                 <p class="m-0">계좌번호 : </p>
								                 <p class="m-0">${list.BankName} ${list.BankAccount}</p>
								            </div>
								            <div class="part_Text">
								                <div>
								                    <div>
								
								                        <button type="button"
								                            class="btn btn-primary waves-effect waves-light"
								                            id="sa-params">체크 하기</button>
								                    </div>
								                </div>
								            </div>
								        </div>
								    </div>
								</div>
							</c:forEach>
			 			</div>
			 		</div>	
			 	</div>
			</div>			
		</div>
	</div>
 </div>
