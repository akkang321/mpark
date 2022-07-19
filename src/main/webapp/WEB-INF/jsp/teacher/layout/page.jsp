<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<input type="hidden" id="pageNo" name="pageNo">

<c:if test="${ page.startPageNo > 0}">
<div class="pageNumberWrap pageNumberWrap2">
	<button type="button" class="prev" onclick="goPage(${page.firstPageNo})"><i class="fa fa-angle-double-left" aria-hidden="true"></i></button>
	<button type="button" class="prev" onclick="goPage(${page.prevPageNo});"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
	<div class="numberBox">
		<c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq page.pageNo}">
					 <a href="#" class="active">${i}</a>
				</c:when>
				<c:otherwise>
					 <a href="javascript:goPage(${i});">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
     </div><!--e:numberBox-->
	<button type="button" class="next" onclick="goPage(${page.nextPageNo})"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
	<button type="button" class="next" onclick="goPage(${page.finalPageNo})"><i class="fa fa-angle-double-right" aria-hidden="true"></i></button>
</div>
</c:if>

</html>
