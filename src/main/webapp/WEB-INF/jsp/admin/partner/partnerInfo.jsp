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
                                                    <h1 class="Wc7">${info.PartnerName}</h1>
                                                    <p class="m-0 Wc8">${info.OwnerName}</p>
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

                                    <div>
                                        <div class="PartnersDetailWrap">
                                            <div class="btm">
                                                <div class="tabBox">
                                                    <button onclick="" class="active">상세정보</button>
                                                    <button onclick="location.href='partnersdetail_2.html'">입출차</button>
                                                    <button onclick="location.href='partnersdetail_3.html'">주차장 정보</button>
                                                    <button onclick="location.href='partnersdetail_4.html'">직원목록</button>
                                                </div>
                                            </div>
                                        </div>
                                        <table class="W100 mt20">

                                            <tbody>
                                                <tr class="Th">
                                                    <td>
                                                        <h5 class="m-0">파트너스 명</h5>

                                                    </td>
                                                    <td colspan="3">
                                                        <p class="in_text m-0"> ${info.PartnerName}</p>
                                                        <input type="text" class="put_text">
                                                    </td>
                                                </tr>
                                                <tr class="Th">
                                                    <td>
                                                        <h5 class="m-0">연락처</h5>
                                                    </td>
                                                    <td colspan="3">
                                                        <p class="in_text m-0">${info.PartnerName}</p>
                                                        <input type="text" class="put_text">
                                                    </td>
                                                </tr>
                                                <tr class="Th">
                                                    <td>
                                                        <h5 class="m-0">E-Mail</h5>
                                                    </td>
                                                    <td colspan="3">
                                                        <p class="in_text m-0">${info.OwnerEmail}</p>
                                                        <input type="text" class="put_text">
                                                    </td>
                                                </tr>
                                                <tr class="Th">
                                                    <td>
                                                        <h5 class="m-0">주차장 주소</h5>
                                                    </td>
                                                    <td colspan="3">
                                                        <p class="in_text m-0">${info.ParkingLot}</p>
                                                        <input type="text" class="put_text">
                                                    </td>
                                                </tr>
                                                <tr class="Th">
                                                    <div>
                                                        <td>
                                                            <h5 class="m-0">사업자번호</h5>
                                                        </td>
                                                        <td colspan="2">
                                                            <p class="in_text m-0">${info.PartnerBN}</p>
                                                            <input type="text" class="put_text">
                                                        </td>
                                                    </div>
                                                    <td>
                                                        <input type="file" class="real-upload" accept="image/*" required
                                                            multiple style="display: none;">
                                                        <u class="pont_cursor">사업자 등록증 이미지</u>
                                                    </td>
                                                </tr>
                                                <tr class="Th">
                                                    <td>
                                                        <h5 class="m-0">계좌번호</h5>
                                                    </td>
                                                    <td colspan="3">
                                                        <p class="in_text m-0">${info.BankAccount}</p>
                                                        <input type="text" class="put_text">
                                                    </td>
                                                </tr>
                                                <tr class="Th">
                                                    <td>
                                                        <h5 class="m-0">수수료</h5>
                                                    </td>
                                                    <td colspan="3">
                                                        <div class="Df_JC AC">
                                                            <p class="m-0">현금 수수료 :</p>
                                                            <p class="mr30 m-0 in_text"><u>${info.PaymentFee}%</u> </p>
                                                            <input type="text" class="put_text">
                                                            <p class="m-0">간편결제 수수료 :</p>
                                                            <p class="in_text m-0"><u>${info.CashFee}%</u></p>
                                                            <input type="text" class="put_text text_put">
                                                        </div>
                                                    </td>
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
