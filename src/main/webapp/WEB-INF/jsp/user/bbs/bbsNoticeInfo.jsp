<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>
	function goBbsNoticeList(){ 
		$("#frm").attr("action", "/bbsNoticeList"); 
		$("#frm").submit(); 
	} 
</script>


<form id="frm" name="frm" method="post">
        <section class="temporary">
            <div class="wrap">
                <div class="padding_bottom106">
                    <div class="FAQ_Box">
                        <p>NOTICE</p>
                    </div>
                    
                    <div class="NOTICE_subpage_in_box">
                        <div class="NOTICE_subpage_in_box_back" >
                            <div>
                                <p class="NOTICE_subpage_header" >${ bbsNoticeInfo.TITLE }</p> 
                                <p>${ bbsNoticeInfo.CONTENTS }</p><br><br><br>
                                <p class="NOTICE_subpage_day" >${ bbsNoticeInfo.CREATE_DATE }</p>
                            </div>
                        </div>
                    </div>
                    <div class="NOTICE_subpage_mt">
                        <p ></p>
                    </div>
                    <div class="NOTICE_subpage_border"></div>
                    <div class="NOTICE_subpage_btn" >
                        <div style=" ">
                            <a href="javascript:goBbsNoticeList()" class="NOTICE_subpage_back_btn"><p>목록보기</p></a> 
                        </div>
                    </div>
                </div>
            </div>
        </section>
</form>


