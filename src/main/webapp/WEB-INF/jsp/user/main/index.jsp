<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="temporary">
			<div class="mainVideo">
				<div class="ml61">
					<!-- <video controls src="myImg/MAIN/uspec1.mp4"></video> -->
				</div>
			</div>
			<div class="section_All_Box">
				<div class="mt217">
					<div class="Df_Je">
						<p class="main_Text">Yo<b>u</b> are <b>spe</b>cial, </br> we will make you more spe<b>c</b>ial
						</p>
					</div>
					<div class="mt44">
						<div class="Df_Je">
							<p class=" main-font14">‘유스펙’은 댄서 & 뮤지션의 아지트로, 그들이 만들어낸 특별한
								K-POP
								문화를 전 세계에 알리는 역할을 할 것이며 <br>한 층 더 경쾌한 공간 구성으로 새로운 ‘문화 공간’으로 진화되어 갈 것입니다.</p>
						</div>
					</div>
				</div>

				<div class="All_teacher">
					<div>
						<div class="Df D_D">
							<div class="mr15">
								<div class="Sub_teacher_Box">
									<!-- <img src="myImg/MAIN/main.jpg" alt=""> -->
								</div>
								<div class="mt25">
									<p>
										<a href=""> 이주선 원장 <svg xmlns="http://www.w3.org/2000/svg" width="21.09"
												height="17.689" viewBox="0 0 21.09 17.689">
												<g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right"
													transform="translate(3.152 0.345)">
													<path id="패스_5" data-name="패스 5" d="M7.5,18H27.9"
														transform="translate(-10.652 -9.5)" fill="none" stroke="#191919"
														stroke-linejoin="round" stroke-width="1" />
													<path id="패스_6" data-name="패스 6" d="M18,7.5,26.091,16,18,24.5"
														transform="translate(-8.842 -7.5)" fill="none" stroke="#191919"
														stroke-width="1" />
												</g>
											</svg>
										</a>
									</p>
								</div>
							</div>
							<div class="ml25">
								<div class="Sub_teacher_Box">
									<img src="./img/DOYUN(김도윤)_0_M.jpg" alt="">
								</div>
								<div class="mt25">
									<p><a href=""> 강사이름 <svg xmlns="http://www.w3.org/2000/svg" width="21.09"
												height="17.689" viewBox="0 0 21.09 17.689">
												<g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right"
													transform="translate(3.152 0.345)">
													<path id="패스_5" data-name="패스 5" d="M7.5,18H27.9"
														transform="translate(-10.652 -9.5)" fill="none" stroke="#191919"
														stroke-linejoin="round" stroke-width="1" />
													<path id="패스_6" data-name="패스 6" d="M18,7.5,26.091,16,18,24.5"
														transform="translate(-8.842 -7.5)" fill="none" stroke="#191919"
														stroke-width="1" />
												</g>
											</svg></a></p>
								</div>
							</div>
							<div class="Member">
								<p><a href="">Member of <b class="color">USPEC</b></a></p>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="Text_3D_Box">
						<p>33 DANCER / 15 CREW</p>
					</div>
				</div>
				
				<div class="Upcoming_All_Box">
					<div class="font-Size50">
						<p class="bolder">Upcoming<br>Class</p>
						<div class="show_All">
							<a href="/scheduleList">
								<p>show all</p>
							</a>
						</div>
					</div>

					<div>
					<c:forEach var="list" items="${ teacherScheduleList }">
						<div class="maine_Book_now_Box">
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
										<p>${ list.CODE_NAME } - ${ list.CLASS_NAME }</p>
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

					</div>
				</div>

				<div class="our_Class_Video">
					<div class="Our_Class">
						<p>Our Video</p>
					</div>
					<div class="Df_JC Db">
						<div class="our">
							<div>
								<div class="Vidoe_Box">
									<!-- <video controls src="myImg/MAIN/uspec2.MOV"></video> -->
								</div>

							</div>
							<div class="classBtn">
								<div>
									<p class="font-Size30">
										Class
									</p>
								</div>
								<div class="show_All_1">
									<a href="">
										<p>more</p>
									</a></div>
							</div>
						</div>

						<div class="crew">
							<div>
								<div class="Vidoe_Box">
									<!-- <video controls src="myImg/MAIN/uspec2.MOV"></video> -->
								</div>

							</div>
							<div class="classBtn">
								<div>
									<p class="font-Size30">
										Crew
									</p>
								</div>
								<div class="show_All_1">
									<a href="">
										<p>more</p>
									</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>




	
