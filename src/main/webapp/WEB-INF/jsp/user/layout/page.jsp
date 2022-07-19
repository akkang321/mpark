<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<input type="hidden" id="pageNo" name="pageNo">
<c:if test="${ page.startPageNo > 0}">
<div class="page_orientation" style="width: 100%;">
	<div class="page_orientation_Box">

	    <a href="javascript:goPage(${page.prevPageNo})">
		    <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17.414" viewBox="0 0 17 17.414">
		        <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right"
		            transform="translate(0.5 0.707)">
		            <path id="패스_5" data-name="패스 5" d="M16,0H0" transform="translate(0 8)" fill="none"
		                stroke="#191919" stroke-linecap="round" stroke-linejoin="round"
		                stroke-width="1" />
		            <path id="패스_6" data-name="패스 6" d="M8,0,0,8l8,8" fill="none" stroke="#191919"
		                stroke-linecap="round" stroke-linejoin="round" stroke-width="1" />
		        </g>
		    </svg>
		</a>

		<div class="paging">
			<c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}" step="1">
				<c:choose>
					<c:when test="${i eq page.pageNo}">
						<p class="paging_DWH padgin_back"><a href="#">${i}</a></p>
					</c:when>
					<c:otherwise>
						<p class="paging_DWH"><a href="javascript:goPage(${i})">${i}</a></p>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>

		<a href="javascript:goPage(${page.nextPageNo})">
            <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17.414" viewBox="0 0 17 17.414">
                <g id="Icon_feather-arrow-right" data-name="Icon feather-arrow-right"
                    transform="translate(16.5 16.707) rotate(180)">
                    <path id="패스_5" data-name="패스 5" d="M16,0H0" transform="translate(0 8)" fill="none"
                        stroke="#191919" stroke-linecap="round" stroke-linejoin="round"
                        stroke-width="1" />
                    <path id="패스_6" data-name="패스 6" d="M8,16,0,8,8,0" fill="none" stroke="#191919"
                        stroke-linecap="round" stroke-linejoin="round" stroke-width="1" />
                </g>
            </svg>
        </a>

    </div>
</div>
</c:if>



