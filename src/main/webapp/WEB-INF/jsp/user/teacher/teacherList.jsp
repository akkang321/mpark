<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="serverName" value="${pageContext.request.serverName}" />

<script>
    window.onload = async () => {
    	$('.loadingCover').fadeOut(500)
	}
</script>

<script>
	function teacherInfo(tId) {
		$("#tId").val(tId);
		$("#frm").attr("action", "/instructor")
		$("#frm").submit();	
	}
</script>


<section>

<!-- 왼쪽 -->
<form id="frm" name="frm" method="post">
<input type="hidden" id="tId" name="tId" value="">
            <div class="mo_Instructors">
                <div class="Df Df_Ac">
                    <p>
                        INSTRUCTORS
                    </p>

                    <div>
                        <div class="mo_Instructors_searchlog">
                            <p class="mo_search"> <input type="text"></p>
                            <a onclick="mo_Instructors_searchlog()">
                                <svg xmlns="http://www.w3.org/2000/svg" width="12.993" height="12.983"
                                    viewBox="0 0 12.993 12.983">
                                    <path id="패스_75" data-name="패스 75"
                                        d="M14.789,13.868l-2.409-2.389a5.843,5.843,0,1,0-.9.9l2.389,2.389a.645.645,0,1,0,.922-.9ZM7.836,12.381a4.545,4.545,0,1,1,4.545-4.545,4.545,4.545,0,0,1-4.545,4.545Z"
                                        transform="translate(-1.979 -1.979)" />
                                </svg>
                            </a>
                        </div>
                    </div>

                </div>
            </div>

            <div class="wrap">
                <div class="pc_version">
                <div class="INSTRUCTORS_total " >
                    <div>
                        <p class="INSTRUCTORS">INSTRUCTORS</p>
                    </div> 
                    <div class="Search" >
                        <input type="text">
                        <a href="">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="17.986" viewBox="0 0 18 17.986">
                            <path id="패스_70" data-name="패스 70" d="M19.726,18.449l-3.337-3.31a8.1,8.1,0,1,0-1.25,1.25l3.31,3.31a.894.894,0,1,0,1.277-1.25Zm-9.633-2.06a6.3,6.3,0,1,1,6.3-6.3,6.3,6.3,0,0,1-6.3,6.3Z" transform="translate(-1.979 -1.979)" />
                          </svg>
                        </a>
                    </div>
                </div></div>
                <div class="teacher_introduction_total" >
                    <div class="teacher_introduction">
                        <!-- 왼쪽 -->
                        <div class="teacher_introduction_Box">
                       	<c:forEach var="list" items="${ teacherList }" varStatus="status">
							<c:if test="${ status.index%2 == 0 }">
                            <div class="teacher_introduction_subBox">
                                <a href="javascript:teacherInfo('${ list.T_ID }');" class="teacher_introduction_subBox_a">
                                    <div class="Df">
                                        <div class="teacher_introduction_TextBox">
                                            <p class="teacher_introduction_Text">${ list.TEACHER_NAME }</p>
                                            <div class="next_arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="48.414" height="48.828"
                                                    viewBox="0 0 48.414 48.828">
                                                    <g id="Icon_feather-arrow-right"
                                                        data-name="Icon feather-arrow-right"
                                                        transform="translate(47 47.414) rotate(180)">
                                                        <path id="패스_5" data-name="패스 5" d="M46,0H0"
                                                            transform="translate(0 23)" fill="none" stroke="#191919"
                                                            stroke-linecap="round" stroke-linejoin="round"
                                                            stroke-width="2" />
                                                        <path id="패스_6" data-name="패스 6" d="M23,46,0,23,23,0"
                                                            fill="none" stroke="#191919" stroke-linecap="round"
                                                            stroke-width="2" />
                                                    </g>
                                                </svg>
                                            </div>
                                        </div>

                                        <div class="teacher_introduction_ImgBox">
                                 		<c:set var="myImg" />
										<c:if  test="${list.PHOTO_PATH != null}">
											<c:set var="myImg">myImg${list.PHOTO_PATH}</c:set>
										</c:if>
							     			<img src="${myImg}" name="previewImage" alt="">
                                        </div>

                                    </div>
                                </a>
                            </div>
						</c:if>
						</c:forEach>
                        </div>
                        <!-- 왼쪽-->

                        <!--오른쪽-->
                        <div class="teacher_introduction_Box">
                        <c:forEach var="list" items="${ teacherList }" varStatus="status">
               			<c:if test="${ status.index%2 != 0 }">
                            <div class="teacher_introduction_ImgBox_L">
                                <a href="javascript:teacherInfo('${ list.T_ID }');" class="teacher_introduction_subBox_a">
                                    <div class="Df">
                                        <div class="teacher_introduction_TextBox">
                                            <p class="teacher_introduction_Text">${ list.TEACHER_NAME }</p>
                                            <div class="next_arrow_L">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="48.414" height="48.828"
                                                    viewBox="0 0 48.414 48.828">
                                                    <g id="Icon_feather-arrow-right"
                                                        data-name="Icon feather-arrow-right"
                                                        transform="translate(47 47.414) rotate(180)">
                                                        <path id="패스_5" data-name="패스 5" d="M46,0H0"
                                                            transform="translate(0 23)" fill="none" stroke="#191919"
                                                            stroke-linecap="round" stroke-linejoin="round"
                                                            stroke-width="2" />
                                                        <path id="패스_6" data-name="패스 6" d="M23,46,0,23,23,0"
                                                            fill="none" stroke="#191919" stroke-linecap="round"
                                                            stroke-width="2" />
                                                    </g>
                                                </svg>
                                            </div>
                                        </div>

                                        <div class="teacher_introduction_ImgBox">
                                 		<c:set var="myImg" />
										<c:if  test="${list.PHOTO_PATH != null}">
											<c:set var="myImg">myImg${list.PHOTO_PATH}</c:set>
										</c:if>
							     			<img src="${myImg}" name="previewImage" alt="">
                                        </div>
                                    </div>

                                </a>
                            </div>
						</c:if>
						</c:forEach>

                        </div>
                        <!-- 오른쪽 -->
                    </div>
                </div>
			</form>

</section>




