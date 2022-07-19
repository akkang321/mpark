<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/modal/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/modal/css/bootstrap.css">
<script>
	function test() {
		
		
		$('#timeModal').modal('show');
	}
	


</script>

<c:set var="serverName" value="${pageContext.request.serverName}" />

        <section>
            <div class="mo_Instructors">
                <div class="Df Df_Ac mo_mt10">
                    <p>
                        INSTRUCTORS
                    </p>
                    <div class="mo_Instructors_search mo_Instructors_page">
                        <a>
                            <svg xmlns="http://www.w3.org/2000/svg" width="12.993" height="12.983"
                                viewBox="0 0 12.993 12.983">
                                <path id="패스_75" data-name="패스 75"
                                    d="M14.789,13.868l-2.409-2.389a5.843,5.843,0,1,0-.9.9l2.389,2.389a.645.645,0,1,0,.922-.9ZM7.836,12.381a4.545,4.545,0,1,1,4.545-4.545,4.545,4.545,0,0,1-4.545,4.545Z"
                                    transform="translate(-1.979 -1.979)" />
                            </svg>
                        </a>
                    </div>
                    <div class="none">
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

            <div class="introduce_All_Box">
                <div class="introduce_AllBox">
                    <div class="introduce_AllBox_Bigimg">
                    
                    <div class="introduce_AllBox_div">
                    <c:set var="myImg" />
					<c:if test="${teacherInfo.PHOTO_PATH != null}">
					<c:set var="myImg">myImg${teacherInfo.PHOTO_PATH}</c:set>
					</c:if>
		     		<img src="${myImg}" name="previewImage" alt="">
               </div>

                    </div>
                    <div class="mo_introduce_All_Box">
                        <div class="ml73">
                            <div class="Df_Je mo_po_ab">
                                <div class="mr15 mo_mr15">
                                    <a href="">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="Youtube" 
                                            viewBox="0 0 53.9 55">
                                            <g id="그룹_19" data-name="그룹 19" transform="translate(-0.375)">
                                                <ellipse id="타원_32" data-name="타원 32" cx="26.95" cy="27.5" rx="26.95"
                                                    ry="27.5" transform="translate(0.375)" fill="#191919" />
                                                <path id="Icon_metro-youtube" data-name="Icon metro-youtube"
                                                    d="M11.35,1.928,9.278,6.051,7.207,1.928H4.564L8.3,8.457l.022-.013v5.021h1.916V8.444l.022.013,3.734-6.529Zm5.594,3.845a.973.973,0,0,1,.958.961V10.58a.958.958,0,1,1-1.916,0V6.735A.973.973,0,0,1,16.944,5.773Zm0-1.923a2.888,2.888,0,0,0-2.875,2.884V10.58a2.875,2.875,0,1,0,5.749,0V6.735a2.888,2.888,0,0,0-2.875-2.884Zm8.624,0v7.57c-.836.7-1.916,1.122-1.916-1.371v-6.2H21.735V10.44h0c.03,1.59.364,4.451,3.83,2.124v.9h1.916V3.851H25.568Zm2.875,19.227a.961.961,0,0,0-.958.961V25H29.4v-.961A.961.961,0,0,0,28.443,23.078Zm-8.624.961v5.047c.649.651,1.916.721,1.916-.24V24.34C21.735,23.378,20.777,23.078,19.819,24.039ZM33.077,19.4a3.991,3.991,0,0,0-3.918-3.855c-2.09-.1-6.871-.157-11.071-.157s-9.322.052-11.411.157A4.068,4.068,0,0,0,3.95,16.688,4.1,4.1,0,0,0,2.759,19.4c-.125,2.257-.188,3.075-.188,4.2s.063,2.821.188,5.078A4.1,4.1,0,0,0,3.95,31.391a4.069,4.069,0,0,0,2.727,1.144c2.09.1,7.211.157,11.411.157s8.981-.052,11.071-.157a3.991,3.991,0,0,0,3.918-3.855q.157-2.821.157-5.078c0-1.5-.052-2.323-.157-4.2ZM8.32,30.769H6.4V21.155H4.487V19.232h5.749v1.923H8.32Zm7.666,0H14.069v-.9c-3.643,2.052-3.8.066-3.83-1.524h0V23.078h1.916v5.3c0,1.162,1.08,1.049,1.916.35V23.078h1.916Zm7.666-1.95c0,2.01-2.051,2.6-3.833,1.033v.917H17.9V19.232h1.916v3.124c1.916-1.923,3.833-1.2,3.833.721ZM31.318,25v.961H27.485v1.923a.958.958,0,1,0,1.916,0v-.961h1.916v.961a2.875,2.875,0,1,1-5.749,0V24.039a2.875,2.875,0,1,1,5.749,0V25Z"
                                                    transform="translate(9.514 9.94)" fill="#fff" />
                                            </g>
                                        </svg>
                                    </a>
                                </div>
                                <div>
                                    <a href="">
                                        <svg xmlns="http://www.w3.org/2000/svg"
                                            xmlns:xlink="http://www.w3.org/1999/xlink" class="Instagram" 
                                            viewBox="0 0 55 55">
                                            <defs>
                                                <clipPath id="clip-path">
                                                    <path id="패스_23" data-name="패스 23" d="M0,0H26.341V26.341H0Z"
                                                        fill="#fff" />
                                                </clipPath>
                                            </defs>
                                            <g id="그룹_18" data-name="그룹 18" transform="translate(0.5)">
                                                <circle id="타원_33" data-name="타원 33" cx="27.5" cy="27.5" r="27.5"
                                                    transform="translate(-0.5)" fill="#191919" />
                                                <g id="그룹_7" data-name="그룹 7" transform="translate(14.133 14.027)"
                                                    clip-path="url(#clip-path)">
                                                    <path id="패스_22" data-name="패스 22"
                                                        d="M23.263,11.124H20.973a8.091,8.091,0,1,1-15.65,0H3.034V22.25a1.012,1.012,0,0,0,1.012,1.011h18.2a1.011,1.011,0,0,0,1.012-1.011Zm0-7.079A1.012,1.012,0,0,0,22.25,3.034H19.217a1.011,1.011,0,0,0-1.011,1.011V7.079a1.011,1.011,0,0,0,1.011,1.011H22.25a1.012,1.012,0,0,0,1.012-1.011ZM13.148,8.091a5.057,5.057,0,1,0,5.057,5.057,5.056,5.056,0,0,0-5.057-5.057M23.263,26.3H3.034A3.034,3.034,0,0,1,0,23.26V3.034A3.034,3.034,0,0,1,3.034,0H23.263A3.033,3.033,0,0,1,26.3,3.034V23.26A3.034,3.034,0,0,1,23.263,26.3"
                                                        fill="#fff" fill-rule="evenodd" />
                                                </g>
                                            </g>
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="All_nickname">
                                <p class="teacher_nickname">${ teacherInfo.TEACHER_NAME_EN }</p>
                                <p class="teacher_nickname_ko">${ teacherInfo.TEACHER_NAME }</p>
                            </div>
                            <div class="Introduce_Box">
                            	<% pageContext.setAttribute("newLineChar", "\n"); %>
                                <h1>강사 소개</h1><br>
                                <%-- <p>${ fn:replace(teacherInfo.SELF_INTRODUCTION, newLineChar, '<br/>') }</p> --%>
                                <p></p>
                           		<a href="javascript:test();" class="look">자세히보기</a>
                            </div>
                            <div class="mt123">
                            
                                <div class="Df Df_Ac">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"
                                        class="mr8">
                                        <path id="Icon_material-schedule" data-name="Icon material-schedule" 
                                            d="M12.99,3A10,10,0,1,0,23,13,10,10,0,0,0,12.99,3ZM13,21a8,8,0,1,1,8-8A8,8,0,0,1,13,21Zm.5-13H12v6l5.25,3.15L18,15.92l-4.5-2.67Z" 
                                            transform="translate(-3 -3)" />
                                    </svg>
                                    <p>CLASS SCHEDULE</p>
                                </div>

                                <div class="mt13">
                                <c:forEach var="list" items="${ instructor }">
                                    <div class="sub_Book_now_Box">
                                        <div class="Df_Ac_Sb">
                                            <div class="w46">
                                                <p class="main_day">${ list.DATE_D }</p>
                                                <p class="main_month">${ list.DATE_M }</p>
                                            </div>
                                            <div class="Db">
                                                <div class="mofont-Size15">
                                                    <p>${ list.START_TIME } ~ ${ list.END_TIME }</p>
                                                </div>
                                                <div class="mofont-Size15">
                                                    <p>${ CODE_NAME } - ${ list.CLASS_NAME }</p>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="main_Book_now_end">
                                                    <p class="main_Book_now_Text">BOOK NOW</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                	<c:if test="${ instructor.size() == 0 }">
										<br><br><br>
										<tr>
											<td align="center" style="color:red;">CLASS COMMING SOON ~</td>
										</tr>
									</c:if>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="Introduce_video_AllBox mo_introduce_All_Box">
                    <div class="Df Db">
                        <div class="w937">
                            <div class="w100">
                                <video src="./img/test.MOV"></video>
                            </div>
                        </div>
                        <div class="ml76">
                            <div class="class_video">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 43 35.182"
                                    class="class_video_icon">
                                    <path id="Icon_material-ondemand-video" data-name="Icon material-ondemand-video"
                                        d="M40.591,4.5H5.409A3.9,3.9,0,0,0,1.5,8.409V31.864a3.908,3.908,0,0,0,3.909,3.909h9.773v3.909H30.818V35.773h9.773a3.9,3.9,0,0,0,3.89-3.909L44.5,8.409A3.908,3.908,0,0,0,40.591,4.5Zm0,27.364H5.409V8.409H40.591ZM30.818,20.136,17.136,27.955V12.318Z"
                                        transform="translate(-1.5 -4.5)" />
                                </svg>

                                <p class="class_video_text">
                                    Class Video
                                </p>
                            </div>
                            <div class="class_video_text_contents">
                                <p>
									여기는 youtube나 mp4동영상을 넣을 것입니다.
                                </p>
                            </div>
                            <div class="mt68">
                                <div class="class_video_more">
                                    <a href="#">
                                        <p>more</p>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        
      <div class="modal fade" id="timeModal" tabindex="1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content mt11_4rem">
				<div class="modal-header">
	        		<h5 class="modal-title" id="exampleModalLabel">Career</h5>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
				<div class="modal-body modal-body_padding">
					<div class="mb-3">
		            <p class="body_padding_">
		              
		            <%-- ${ fn:replace(teacherInfo.TEACHER_INTRODUCTION, newLineChar, '<br/>') } --%>
		            </p>
		          	</div>
		      </div>
		    <!--   	<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div> -->
			</div>
		</div>
	</div>  
        

