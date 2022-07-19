<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	shwoDetail("${calendarInfo.nowDay}");    
});

function goMonth(val){
	$("[name='addMonth']").val(val);
	$("#frm").attr("action", "/scheduleList");
	$("#frm").submit();
}
function scheduleList(){
	$("#frm").attr("action", "/scheduleList");
	$("#frm").submit();
}
function bookingClick(sId,classType){
	$("[name='sId']").val(sId);
	$("[name='classType']").val(classType);
	$("#frm").attr("action", "/scheduleInfo");
	$("#frm").submit();
}

function shwoDetail(idx){
	$("[name^='mSchedule']").hide();
	$("[name=mSchedule"+idx+"]").show();
}

</script>
<form id="frm" method="POST">
	<input type="hidden" name="sYear"	value="${calendarInfo.year}">
	<input type="hidden" name="sMonth"	value="${calendarInfo.month}">
	<input type="hidden" name="addMonth">
	<input type="hidden" name="sId">
	<input type="hidden" name="classType">
	
	<section class="pc_version">
            <div class="Df ">
                <div class="w100 background_W">
                    <div class="w100">
                        <div class="turn_the_month">
                            <div class="before">
                                <div>
                                    <a href="javascript:goMonth(-1);" class="before_a">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="33.621" height="34.243"
                                            viewBox="0 0 33.621 34.243">
                                            <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right"
                                                transform="translate(2.121 2.121)">
                                                <path id="패스_5" data-name="패스 5" d="M37.5,18H7.5"
                                                    transform="translate(-7.5 -3)" fill="none" stroke="#191919"
                                                    stroke-linecap="round" stroke-linejoin="round" stroke-width="3" />
                                                <path id="패스_6" data-name="패스 6" d="M33,7.5l-15,15,15,15"
                                                    transform="translate(-18 -7.5)" fill="none" stroke="#191919"
                                                    stroke-linecap="round" stroke-width="3" />
                                            </g>
                                        </svg>
                                    </a>
                                </div>
                                <div class="month">
                                    ${calendarInfo.year} . ${calendarInfo.month}
                                </div>
                                <div>
                                    <a href="javascript:goMonth(1);" class="after">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="33.621" height="34.243"
                                            viewBox="0 0 33.621 34.243">
                                            <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right"
                                                transform="translate(31.5 32.121) rotate(180)">
                                                <path id="패스_5" data-name="패스 5" d="M30,0H0" transform="translate(0 15)"
                                                    fill="none" stroke="#191919" stroke-linecap="round"
                                                    stroke-linejoin="round" stroke-width="3" />
                                                <path id="패스_6" data-name="패스 6" d="M15,30,0,15,15,0" fill="none"
                                                    stroke="#191919" stroke-linecap="round" stroke-width="3" />
                                            </g>
                                        </svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="All_select">
                            <div class="Df">
                                <div>
                                    <select name="sTId" id="sTId" class="Instructors" onchange="scheduleList();">
                                        <option value="">All Instructors</option>
                                        <c:forEach var="list" items="${teacherList}">
											<option value="${list.T_ID}" <c:if test="${param.sTId == list.T_ID}">selected="selected" </c:if>>${list.TEACHER_NAME}</option>
										</c:forEach>
                                    </select>
                                </div>
                                <div>
                                    <select name="sClassLevel" id="sClassLevel" class="class-choice" onchange="scheduleList();">
                                        <option value="">All Class Types</option>
                                        <c:forEach var="list" items="${levelList}">
											<option value="${list.CODE_ID}" <c:if test="${param.sClassLevel == list.CODE_ID}">selected="selected" </c:if>>${list.CODE_NAME}</option>
										</c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="calender_center">
                        <div class="calender_center_All_Box">
                            <div class="All_calendar">
                                <div class="All_days">
                                    <div class="SUN">SUN</div>
                                    <div class="day">MON</div>
                                    <div class="day">TUE</div>
                                    <div class="day">WED</div>
                                    <div class="day">THU</div>
                                    <div class="day">FRI</div>
                                    <div class="SAT">SAT</div>
                                </div>
                                
                               	<c:forEach var="list" items="${calendarInfo.dayList}" varStatus="status">
	                                <c:if test="${status.index % 7 == 0}">
				            			<div class="Df <c:if test="${calendarInfo.dayList.size() - status.index == 7}">mb111</c:if>"> 
				            		</c:if>
                                	<c:set var="allDayClass">All_one_day</c:set>
                                	<c:if test="${status.index % 7 == 6}">
                                		<c:set var="allDayClass">All_one_day_R</c:set>
                                	</c:if>
                                	<div class="${allDayClass}">
                                		<c:if test="${calendarInfo.year == calendarInfo.nowYear && calendarInfo.month == calendarInfo.nowMonth && calendarInfo.nowDay eq list }"><div class="circle"></div></c:if>
                                        <p class="one_day">${list}</p>
                                        <div class="calss_Box">
                                        	<c:forEach var="sList" items="${scheduleList}" >
                                        		<c:if test="${sList.DAY == list}">
                                        			<c:set var="classFill"/>
                                        			<c:set var="scheduleState">${sList.SCHEDULE_STATE}</c:set>
													<c:choose>
														<c:when test="${sList.SCHEDULE_STATE eq 'Sold out'}">
															<c:set var="classFill">#e7e7e7</c:set>
														</c:when>
														<c:when test="${calendarInfo.year+calendarInfo.month< calendarInfo.nowYear+calendarInfo.nowMonth || (calendarInfo.year+calendarInfo.month == calendarInfo.nowYear+calendarInfo.nowMonth  && list< calendarInfo.nowDay)}">
															<c:set var="classFill">#e7e7e7</c:set>
															<c:set var="scheduleState">Sold out</c:set>	
														</c:when>
														<c:when test="${calendarInfo.year == calendarInfo.nowYear && calendarInfo.month == calendarInfo.nowMonth && calendarInfo.nowDay eq list && sList.START_TIME_COMP < nowTime}">
															<c:set var="classFill">#e7e7e7</c:set>	
															<c:set var="scheduleState">Sold out</c:set>		
														</c:when>
														<c:when test="${sList.CLASS_LEVEL eq 'C050100'}">
															<c:set var="classFill">#8d74ff</c:set>		
														</c:when>
														<c:when test="${sList.CLASS_LEVEL eq 'C050200'}">
															<c:set var="classFill">#ffe374</c:set>
														</c:when>
														<c:otherwise>
															<c:set var="classFill">#ff7474</c:set>
														</c:otherwise>
													</c:choose>
													<c:set var="classCheck"/>
													<c:if test="${sList.U_ID != null }">
														<c:set var="classCheck">m-8,12.444L6.278,12.5l1.253-1.253,3.191,3.182,6.747-6.747,1.253,1.262Z</c:set>
													</c:if>
													<div class="choice_Box">
	                                        			<div class="mr5">
		                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
		                                                        <path id="Icon_material-check-box"
		                                                            data-name="Icon material-check-box"
		                                                            d="M18.722,4.5H6.278A1.777,1.777,0,0,0,4.5,6.278V18.722A1.777,1.777,0,0,0,6.278,20.5H18.722A1.777,1.777,0,0,0,20.5,18.722V6.278A1.777,1.777,0,0,0,18.722,4.5Z${classCheck} "
		                                                            transform="translate(-4.5 -4.5)" fill="${classFill }" />
		                                                    </svg>
		                                                </div>
		                                                <div href="" class="tooltip">
		                                                    <p  <c:if test="${classFill != '#e7e7e7' }">onclick="bookingClick('${sList.S_ID}','${sList.CLASS_TYPE}');"  </c:if>>${sList.FN_CLASS_LEVEL} - ${sList.FN_TEACHER_NAME}</p> <span class="tooltiptext ">
		                                                        <p class="Available">${scheduleState}</p> 
		                                                        <p class="time">${sList.START_TIME}~${sList.END_TIME}</p>
		                                                        <p class="className">Basic - ${sList.FN_TEACHER_NAME}</p>
		                                                    </span>
		                                                </div>
                                        			</div>
                                        		</c:if>
                                        	</c:forEach>
                                        </div>
                                     </div>
	                                <c:if test="${status.index % 7 == 6}">
				            			</div>
				            		</c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
	
        <article class="mo_version">
            <div>
                <div class="mo_schedule_All">
                    <div class="mo_schedule">
                        <p>SCHEDULE</p>
                        <div class="mo_schedul_Box">
                            <a class="tttt">
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="17.986"
                                    viewBox="0 0 18 17.986">
                                    <path id="패스_70" data-name="패스 70"
                                        d="M19.726,18.449l-3.337-3.31a8.1,8.1,0,1,0-1.25,1.25l3.31,3.31a.894.894,0,1,0,1.277-1.25Zm-9.633-2.06a6.3,6.3,0,1,1,6.3-6.3,6.3,6.3,0,0,1-6.3,6.3Z"
                                        transform="translate(-1.979 -1.979)" />
                                </svg>
                            </a>
                        </div>


                    </div>
                    <div class="ttttt">
                        <div class="mo_All_Instructors_Box">
                            <select name="sMTId" id="sMTId" onchange="scheduleList();">
                                <option value="">All Instructors</option>
								<c:forEach var="list" items="${teacherList}">
									<option value="${list.T_ID}" <c:if test="${param.sMTId == list.T_ID}">selected="selected" </c:if>>${list.TEACHER_NAME}</option>
								</c:forEach>
                            </select>
                        </div>
                        <div class="mo_All_Instructors_Box">
                            <select name="sMClassLevel" id="sMClassLevel" onchange="scheduleList();">
                                <option value="">All Class Types</option>
								<c:forEach var="list" items="${levelList}">
									<option value="${list.CODE_ID}" <c:if test="${param.sMClassLevel == list.CODE_ID}">selected="selected" </c:if>>${list.CODE_NAME}</option>
								</c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="All_calendar_Box">
                    <div class="calendar_Box">
                        <div class="month_Box">
                            <div>
                                <a href="javascript:goMonth(-1);">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24.775" height="22.824"
                                        viewBox="0 0 24.775 22.824">
                                        <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right"
                                            transform="translate(1.497 1.412)">
                                            <path id="패스_5" data-name="패스 5" d="M22.278,0H0" transform="translate(0 10)"
                                                fill="none" stroke="#191919" stroke-linecap="round"
                                                stroke-linejoin="round" stroke-width="2" />
                                            <path id="패스_6" data-name="패스 6" d="M11.139,0,0,10,11.139,20" fill="none"
                                                stroke="#191919" stroke-linecap="round" stroke-width="2" />
                                        </g>
                                    </svg>
                                </a>
                            </div>
                            <div>
                                <p class="month">${calendarInfo.year} . ${calendarInfo.month}</p>
                            </div>
                            <div>
                                <a href="javascript:goMonth(1);">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24.775" height="22.824"
                                        viewBox="0 0 24.775 22.824">
                                        <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right"
                                            transform="translate(23.278 21.412) rotate(180)">
                                            <path id="패스_5" data-name="패스 5" d="M22.278,0H0" transform="translate(0 10)"
                                                fill="none" stroke="#191919" stroke-linecap="round"
                                                stroke-linejoin="round" stroke-width="2" />
                                            <path id="패스_6" data-name="패스 6" d="M11.139,20,0,10,11.139,0" fill="none"
                                                stroke="#191919" stroke-linecap="round" stroke-width="2" />
                                        </g>
                                    </svg>
                                </a>
                            </div>
                        </div>

                        <div class="calendar_day">
                            <div>
                                <p class="calendar_day_S">S</p>
                            </div>
                            <div>
                                <p>M</p>
                            </div>
                            <div>
                                <p>T</p>
                            </div>
                            <div>
                                <p>W</p>
                            </div>
                            <div>
                                <p>T</p>
                            </div>
                            <div>
                                <p>F</p>
                            </div>
                            <div>
                                <p>S</p>
                            </div>
                        </div>
                        <c:forEach var="list" items="${calendarInfo.dayList}" varStatus="status">
                        	<c:if test="${status.index % 7 == 0}">
		            			<div class="calendar_oneday">
		            		</c:if>
	                        	<div onclick="shwoDetail(${list})">
	                        		<c:if test="${calendarInfo.year == calendarInfo.nowYear && calendarInfo.month == calendarInfo.nowMonth && calendarInfo.nowDay eq list }"><div class="mo_circle"></div></c:if>
	                                <p>${list}</p>
	                            </div>
                            <c:if test="${status.index % 7 == 6}">
		            			</div>
		            		</c:if>
                        </c:forEach>
                    </div>
                </div>
                
                <c:forEach var="sList" items="${scheduleList}" >
                	<c:set var="scheduleState">${sList.SCHEDULE_STATE}</c:set>
					<c:choose>
						<c:when test="${calendarInfo.year+calendarInfo.month< calendarInfo.nowYear+calendarInfo.nowMonth || (calendarInfo.year+calendarInfo.month == calendarInfo.nowYear+calendarInfo.nowMonth  && list< calendarInfo.nowDay)}">
							<c:set var="scheduleState">Sold out</c:set>			
						</c:when>
						<c:when test="${calendarInfo.year == calendarInfo.nowYear && calendarInfo.month == calendarInfo.nowMonth && calendarInfo.nowDay eq list && sList.START_TIME_COMP < nowTime}">
							<c:set var="scheduleState">Sold out</c:set>		
						</c:when>
					</c:choose>
                
                	<div class="mo_class_All_Box" name="mSchedule${sList.DAY}" style="display: none;">
	                    <div class="mo_class_sub_Box">
	                        <div class="Mo_Df_JC">
	                            <div class="mr5">
	                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
	                                    <path id="Icon_material-check-box" data-name="Icon material-check-box"
	                                        d="M18.722,4.5H6.278A1.777,1.777,0,0,0,4.5,6.278V18.722A1.777,1.777,0,0,0,6.278,20.5H18.722A1.777,1.777,0,0,0,20.5,18.722V6.278A1.777,1.777,0,0,0,18.722,4.5Z"
	                                        transform="translate(-4.5 -4.5)" fill="#E22786" />
	                                </svg>
	                            </div>
	                            <p>${sList.START_TIME}~${sList.END_TIME}</p>
	                        </div>
	                        <div>
	                            <p>${scheduleState}</p>
	                        </div>
	                    </div>
	
	                    <div class="mo_class_name" onclick="bookingClick('${sList.S_ID}');">
	                        <p>${sList.FN_CLASS_LEVEL} - ${sList.FN_TEACHER_NAME}</p>
	                    </div>
	                </div>
                </c:forEach>
        </article>
</form>

