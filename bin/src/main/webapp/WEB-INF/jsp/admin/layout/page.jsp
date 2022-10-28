<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<input type="hidden" id="pageNo" name="pageNo">

<c:if test="${ page.startPageNo > 0}">


<div>
    <div class="mt-4">
        <div aria-label="..." class="Df Jc_C" style="align-items: center;">
            <ul class="pagination">
                <li class="page-item disabled">
                  <a class="page-link" href="javascript:goPage(${page.firstPageNo})" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                </li>
                <li class="page-item disabled">
                    <a class="page-link" href="javascript:goPage(${page.prevPageNo})" aria-label="Previous"><span aria-hidden="true">	&lt; </span></a>
                  </li>
                <c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}" step="1">
					<c:choose>
						<c:when test="${i eq page.pageNo}">
							   <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
						</c:when>
						<c:otherwise>
							 <li class="page-item "><a class="page-link" href="javascript:goPage(${i});">${i} <span class="sr-only">(current)</span></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
                
                
                <li class="page-item">
                  <a class="page-link" href="javascript:goPage(${page.nextPageNo})" aria-label="Next"><span aria-hidden="true">	&gt;</span></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript:goPage(${page.finalPageNo})" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
                  </li>
            </ul>
        </div>
    </div>
</div>

</c:if>

</html>

