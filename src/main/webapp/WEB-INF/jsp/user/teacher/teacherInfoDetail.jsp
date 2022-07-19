<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="serverName" value="${pageContext.request.serverName}" />

<link rel="stylesheet" href="/css/user/scrollBar.css.css">
<script>

$(function() {
	 var $upcommingWrap = $('.upcommingWrap');
     var $videoWrap = $('.videoWrap');

     $upcommingWrap.hide();
     $videoWrap.hide();

     $('.upcommingBtn').click(function() { 
         $videoWrap.hide();
         $upcommingWrap.stop().fadeToggle();
         return false;
     })

     $('.videoBtn').click(function() { 
         $upcommingWrap.hide();
         $videoWrap.stop().fadeToggle();
         return false;
     })
})

        var videoChk = 1;

        $('.videoPlay').click(function() {
            if(videoChk == 1) {
                $(this).prev().find('video')[0].play()
                $('.video1').addClass('video-active')
                $('.videoPlay').stop().fadeOut()
                videoChk = 2
            } else {
                $(this).prev().find('video')[0].pause()
                $('.video1').removeClass('video-active')
                $('.videoPlay').stop().fadeIn()
                videoChk = 1
            }

        })

        $('video').click(function() {
            if(videoChk == 1) {
                $('.video1').addClass('video-active')
                $('.videoPlay').stop().fadeOut()
                videoChk = 2
            } else {
                $('.video1').removeClass('video-active') 
                $('.videoPlay').stop().fadeIn() 
                videoChk = 1 
            }

        })

        var videoCount = 4
        var videoNum1 = 1
        var videoNum2 = 2
        var videoNum3 = 3

        $('.videoWrap .arrowBox .next').click(function() {

            videoChk = 1;
            $('.videoPlay').stop().fadeIn()
            $('.video1').removeClass('video-active')

            if(videoNum1 >= videoCount) {
                videoNum1 = 1
            } else {
                videoNum1 ++
            }

            if(videoNum2 >= videoCount) {
                videoNum2 = 1
            } else {
                videoNum2 ++
            }

            if(videoNum3 >= videoCount) {
                videoNum3 = 1
            } else {
                videoNum3 ++
            }

            $('.video1').find('video').attr('src', `assets/video/video${videoNum1}.mp4`)
            $('.video2').find('video').attr('src', `assets/video/video${videoNum2}.mp4`)
            $('.video3').find('video').attr('src', `assets/video/video${videoNum3}.mp4`)

        })

        $('.videoWrap .arrowBox .prev').click(function() {

            videoChk = 1;
            $('.videoPlay').stop().fadeIn()
            $('.video1').removeClass('video-active')

            if(videoNum1 <= 1) {
                videoNum1 = videoCount
            } else {
                videoNum1 --
            }

            if(videoNum2 <= 1) {
                videoNum2 = videoCount
            } else {
                videoNum2 --
            }

            if(videoNum3 <= 1) {
                videoNum3 = videoCount
            } else {
                videoNum3 --
            }
            
            $('.video1').find('video').attr('src', `assets/video/video${videoNum1}.mp4`)
            $('.video2').find('video').attr('src', `assets/video/video${videoNum2}.mp4`)
            $('.video3').find('video').attr('src', `assets/video/video${videoNum3}.mp4`)

        })

</script>

<body>

<form id="frm" method="post">

    <div class="nav2">

        <div class="leftBox">

			<jsp:include page="/WEB-INF/jsp/user/layout/logo.jsp" />

        </div><!--e:leftBox-->

        <div id="rightTop" style="position: relative; top: 0; right: 0;">
            <a href="instructors-info.html">
                INSTRUCTORS
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22">
                    <g id="타원_10" data-name="타원 10" transform="translate(0 22) rotate(-90)" fill="none" stroke="#fff" stroke-width="1.5">
                      <circle cx="11" cy="11" r="11" stroke="none"/>
                      <circle cx="11" cy="11" r="10.25" fill="none"/>
                    </g>
                </svg>
            </a>
        </div><!-- e:rightTop -->

    </div><!--e:nav2-->

    <section class="in-s1">

        <div class="leftBox">

            <div class="imgflexBox">

                <div class="topBox">
                    <span>*</span>
                    <h2>${ teacherInfoDetail.TEACHER_NAME }</h2>
                    <!--<p>${ teacherInfoDetail.TEACHER_NAME }</p>-->
                </div><!--e:topBox-->

			<c:set var="myImg" />
				<c:if test="${ teacherInfoDetail.PHOTO_PATH != null }">
				<c:set var="myImg">myImg${ teacherInfoDetail.PHOTO_PATH }</c:set>
			</c:if>
			
			<div class="rightBox">
                <div class="background" style="background: url('${myImg}') no-repeat center / cover;"></div>
            	<img src="${myImg}" alt="">
            </div><!--e:rightBox-->


            </div><!--e:imgflexBox-->


            <div class="btmBox">

                <a href="#" class="linkBox">
                    <div class="instaText">
                        <p>INSTAGRAM</p>
                        <svg xmlns="http://www.w3.org/2000/svg" width="15.667" height="15.667" viewBox="0 0 15.667 15.667">
                            <path id="Icon_simple-instagram" data-name="Icon simple-instagram" d="M7.833,0C5.705,0,5.44.01,4.6.047A5.776,5.776,0,0,0,2.7.411a3.836,3.836,0,0,0-1.388.9A3.822,3.822,0,0,0,.411,2.7,5.759,5.759,0,0,0,.047,4.6C.008,5.44,0,5.705,0,7.833s.01,2.394.047,3.229a5.78,5.78,0,0,0,.364,1.9,3.842,3.842,0,0,0,.9,1.388,3.831,3.831,0,0,0,1.388.9,5.783,5.783,0,0,0,1.9.364c.836.039,1.1.047,3.229.047s2.394-.01,3.229-.047a5.8,5.8,0,0,0,1.9-.364,4,4,0,0,0,2.291-2.291,5.78,5.78,0,0,0,.364-1.9c.039-.836.047-1.1.047-3.229S15.657,5.44,15.62,4.6a5.793,5.793,0,0,0-.364-1.9,3.845,3.845,0,0,0-.9-1.388,3.817,3.817,0,0,0-1.388-.9,5.763,5.763,0,0,0-1.9-.364C10.227.008,9.962,0,7.833,0Zm0,1.41c2.091,0,2.34.01,3.166.046a4.316,4.316,0,0,1,1.454.271A2.578,2.578,0,0,1,13.94,3.214a4.325,4.325,0,0,1,.27,1.454c.037.826.046,1.074.046,3.166s-.01,2.34-.048,3.166a4.408,4.408,0,0,1-.275,1.454,2.487,2.487,0,0,1-.587.9,2.444,2.444,0,0,1-.9.585,4.357,4.357,0,0,1-1.459.27c-.832.037-1.076.046-3.172.046s-2.341-.01-3.172-.048a4.442,4.442,0,0,1-1.46-.275,2.426,2.426,0,0,1-.9-.587,2.379,2.379,0,0,1-.588-.9,4.446,4.446,0,0,1-.274-1.459c-.029-.823-.04-1.076-.04-3.162s.01-2.341.04-3.173a4.441,4.441,0,0,1,.274-1.458,2.322,2.322,0,0,1,.588-.9,2.317,2.317,0,0,1,.9-.586,4.336,4.336,0,0,1,1.45-.275C5.465,1.4,5.709,1.39,7.8,1.39l.029.02Zm0,2.4a4.023,4.023,0,1,0,4.023,4.023A4.022,4.022,0,0,0,7.833,3.811Zm0,6.634a2.611,2.611,0,1,1,2.611-2.611A2.61,2.61,0,0,1,7.833,10.445Zm5.122-6.792a.94.94,0,1,1-.94-.939A.941.941,0,0,1,12.955,3.652Z" fill="#fff"/>
                        </svg>
                    </div><!-- e:instaText -->
                    <img src="/img/user/teacher/img/imginsta-arrow.png" alt="">
                </a><!--e:linkBox-->

                <div class="txtBox">
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Dolores neque provident consequatur quas fugit! Nesciunt voluptatibus illum tempora aspernatur labore expedita dicta eligendi quae. Modi quos soluta officiis? Beatae non, harum sunt distinctio magnam nemo nam ipsam maiores saepe blanditiis? Quas recusandae tempore modi. Sed maiores sunt est repellat molestiae.
                </div><!--e:txtBox-->

            </div><!--e:btmBox-->

        </div><!--e:leftBox-->



<!-- 프로필 이미지 -->
	<div class="rightBox">
	<c:set var="myImg" />
		<c:if test="${ teacherInfoDetail.PHOTO_PATH != null }">
	    	<c:set var="myImg">http://${serverName}\myImg${ teacherInfoDetail.PHOTO_PATH }</c:set> 
	        <c:set var="myImg">${fn:replace(myImg, '\\', '/')}</c:set>
	    </c:if> 
	    
          <div class="horizontal-scroll__block">
          	<div class="background" style="background: url(${myImg}) no-repeat center / cover;"></div>
          </div>
	</div>



    </section><!--e:in-s1-->

    <div class="tabBox">
        <button class="upcommingBtn">
            UPCOMING CLASSES
            <svg xmlns="http://www.w3.org/2000/svg" width="25.991" height="25.991" viewBox="0 0 25.991 25.991">
                <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(-7.5 -6.793)">
                  <path id="패스_5" data-name="패스 5" d="M7.5,18H32.077" transform="translate(0 1.789)" fill="none" stroke="#fff" stroke-linejoin="round" stroke-width="2" />
                  <path id="패스_6" data-name="패스 6" d="M18,7.5,30.288,19.789,18,32.077" transform="translate(1.789 0)" fill="none" stroke="#fff" stroke-width="2" />
                </g>
            </svg>
        </button>
        <span>

        </span>
        <button class="videoBtn">
            VIDEO
            <svg xmlns="http://www.w3.org/2000/svg" width="25.991" height="25.991" viewBox="0 0 25.991 25.991">
                <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(-7.5 -6.793)">
                  <path id="패스_5" data-name="패스 5" d="M7.5,18H32.077" transform="translate(0 1.789)" fill="none" stroke="#fff" stroke-linejoin="round" stroke-width="2" />
                  <path id="패스_6" data-name="패스 6" d="M18,7.5,30.288,19.789,18,32.077" transform="translate(1.789 0)" fill="none" stroke="#fff" stroke-width="2"/>
                </g>
            </svg>
        </button>
    </div>

    <section class="in-s2 upcommingWrap">

        <div class="table">

		<c:forEach var="list" items="${ teacherScheduleList }">
            <div class="t-row t-row1">
                <div class="in-s2-inner">
                    <div class="upcomming-left">
                        <p class="day">${ list.SCHEDULE_DATE }</p>
                        <p class="time">${ list.START_TIME } ~ ${ list.END_TIME }</p>
                        <p>${ list.TEACHER_NAME } - ${ list.CODE_NAME }</p>
                    </div>
                    <span></span>
                    <div class="upcomming-right">
                        <p>15 / 30</p>
                        <p><a href="BuyPass.html">BOOK NOW</a></p>
                    </div>
                </div><!--e:in-s2-inner-->

            </div><!--e:t-row-->
		</c:forEach>

        </div><!--e:table-->

        <div class="in-s2-inner in-s2-btm">

            <div class="scrollXBox">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36.831 19.936">
                    <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(0 0.407)">
                      <path id="패스_1" data-name="패스 1" d="M7.5,18H43.832" transform="translate(-7.5 -8.439)" fill="none" stroke="#e7e7e7" stroke-linejoin="round" stroke-width="1"/>
                      <path id="패스_2" data-name="패스 2" d="M18,7.5l13.385,9.561L18,26.622" transform="translate(4.946 -7.5)" fill="none" stroke="#e7e7e7" stroke-linejoin="round" stroke-width="1"/>
                    </g>
                </svg>
            </div><!--e:scrollXBox-->

            <a href="#">
                MORE
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36.831 19.936">
                    <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(0 0.407)">
                      <path id="패스_1" data-name="패스 1" d="M7.5,18H43.832" transform="translate(-7.5 -8.439)" fill="none" stroke="#e7e7e7" stroke-linejoin="round" stroke-width="1"/>
                      <path id="패스_2" data-name="패스 2" d="M18,7.5l13.385,9.561L18,26.622" transform="translate(4.946 -7.5)" fill="none" stroke="#e7e7e7" stroke-linejoin="round" stroke-width="1"/>
                    </g>
                </svg>
            </a>
        </div><!--e:in-s2-inner-->

    </section><!--e:in-s2-->

    <section class="in-s2 in-s3 videoWrap">

        <div class="videoWrap">
                
            <div class="leftBox">
                <div class="videoBox video1">
                    <video controls playsinline autoplay="true" loop="true" muted>
						<!--<source src="/img/user/teacher/video/seq5.mp4" type="">-->
					</video>
                </div><!--e:video1-->
                <button type="button" class="videoPlay">
                    <svg xmlns="http://www.w3.org/2000/svg" width="72.517" height="72.517" viewBox="0 0 72.517 72.517">
                        <path id="패스_3" data-name="패스 3" d="M72.517,37.758A34.758,34.758,0,1,1,37.758,3,34.758,34.758,0,0,1,72.517,37.758Z" transform="translate(-1.5 -1.5)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                        <path id="패스_4" data-name="패스 4" d="M15,12,35.855,25.9,15,39.807Z" transform="translate(14.307 10.355)" fill="#fff"/>
                    </svg>
                </button>
            </div><!--e:leftBox-->

            <div class="rightBox">

                <div class="topBox">
                    <div class="videoBox video2">
                        <video controls playsinline autoplay="true" loop="true" muted>
                            <!--<source src="/img/user/teacher/video/seq1.mp4" type="">-->
                        </video>
                        <div class="videoCover"></div>
                    </div><!--e:video2-->
                    <div class="videoBox video3" autoplay="true" loop="true" muted>
                        <video controls playsinline>
                            <!--<source src="/img/user/teacher/video/seq5.mp4" type="">-->
                        </video>
                        <div class="videoCover"></div>
                    </div><!--e:video3-->
        
                    <a class="linkY" href="https://www.youtube.com/" target="_blank">
                        <svg xmlns="http://www.w3.org/2000/svg" width="36.331" height="36.331" viewBox="0 0 36.331 36.331">
                            <path id="Icon_metro-youtube" data-name="Icon metro-youtube" d="M12.973,1.928,10.518,6.8,8.063,1.928H4.932l4.425,7.71.026-.015v5.929h2.271V9.623l.026.015L16.1,1.928ZM19.6,6.469A1.151,1.151,0,0,1,20.736,7.6v4.541a1.135,1.135,0,0,1-2.271,0V7.6A1.151,1.151,0,0,1,19.6,6.469Zm0-2.271A3.416,3.416,0,0,0,16.195,7.6v4.541a3.406,3.406,0,1,0,6.812,0V7.6A3.416,3.416,0,0,0,19.6,4.2Zm10.218,0v8.94c-.991.826-2.271,1.325-2.271-1.619V4.2H25.278V11.98h0c.035,1.877.431,5.257,4.538,2.509v1.063H32.09V4.2H29.819Zm3.406,22.707a1.137,1.137,0,0,0-1.135,1.135v1.135H34.36V28.041A1.137,1.137,0,0,0,33.225,26.906ZM23.007,28.041V34c.769.769,2.271.852,2.271-.284V28.4C25.278,27.26,24.142,26.906,23.007,28.041Zm15.709-5.48a4.721,4.721,0,0,0-4.642-4.553c-2.476-.123-8.141-.185-13.117-.185s-11.045.062-13.52.185a4.721,4.721,0,0,0-4.642,4.553c-.149,2.665-.223,3.631-.223,4.964s.074,3.331.223,6a4.721,4.721,0,0,0,4.642,4.553c2.476.123,8.544.185,13.52.185S31.6,38.2,34.074,38.074a4.721,4.721,0,0,0,4.642-4.553q.186-3.331.186-6c0-1.777-.062-2.743-.186-4.964ZM9.383,35.988H7.112V24.635H4.841V22.364h6.812v2.271H9.383Zm9.083,0H16.195V34.925c-4.317,2.423-4.5.078-4.538-1.8h0v-6.22h2.271v6.256c0,1.372,1.28,1.239,2.271.413V26.906h2.271Zm9.083-2.3c0,2.373-2.43,3.066-4.541,1.22v1.083H20.736V22.364h2.271v3.69c2.271-2.271,4.541-1.419,4.541.852Zm9.083-4.509v1.135H32.09v2.271a1.135,1.135,0,1,0,2.271,0V31.447h2.271v1.135a3.406,3.406,0,1,1-6.812,0V28.041a3.406,3.406,0,0,1,6.812,0v1.135Z" transform="translate(-2.571 -1.928)" fill="#fff"/>
                        </svg>
                    </a>
                </div><!--e:topBox-->

            </div><!--e:rightBox-->

            <div class="btmBox">
        
                <div class="arrowBox">
        
                    <button type="button" class="prev">
                        <svg xmlns="http://www.w3.org/2000/svg" width="109" height="110.243" viewBox="0 0 109 110.243">
                            <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(115 115.621) rotate(180)">
                              <path id="패스_5" data-name="패스 5" d="M7.5,18h106" transform="translate(0 42.5)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                              <path id="패스_6" data-name="패스 6" d="M18,7.5l53,53-53,53" transform="translate(42.5 0)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                            </g>
                        </svg>
                    </button>
        
                    <button type="button" class="next">
                        <svg xmlns="http://www.w3.org/2000/svg" width="109" height="110.243" viewBox="0 0 109 110.243">
                            <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right" transform="translate(-6 -5.379)">
                              <path id="패스_5" data-name="패스 5" d="M7.5,18h106" transform="translate(0 42.5)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                              <path id="패스_6" data-name="패스 6" d="M18,7.5l53,53-53,53" transform="translate(42.5 0)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                            </g>
                        </svg>
                    </button>

                </div><!--e:arrowBox-->

            </div><!--e:btmBox-->

        </div><!--e:videoWrap-->

    </section><!--e:in-s3-->

    <footer style="height: 30vh; width: 100%; display: flex; justify-content: center; align-items: center;"> 
        <h1 style="color: #fff; font-size: 2rem; font-weight: 700;">FOOTER</h1>
    </footer>

</form>

</body>

