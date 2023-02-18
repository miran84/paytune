<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
	
<script>
$(function() {
	$("#myGnb").height($('#wrap').height() - 55);
});
</script>				 
			<strong class="num_ttl">총<c:out value="${cnt}" />개</strong>
			
		    <c:if test="${sessionScope.role_id ne '1001'}">
				<div class="view_box fr">
					<button onclick="frmAdd();"	class="register_btn">글 등록</button>
				</div>
		    </c:if>
			<form class="table_layout notice_layout" name="frm2" id="frm2" action="" method="post">
				<table>
                    <caption>결제취소신청</caption>
                    <colgroup>
                        <col width="5%">
                        <col width="45%">
                        <col width="12%">
                        <col width="10%">
                        <col width="10%">
                        <col width="8%">
                        <col width="5%">
                        <col width="5%">
                    </colgroup>
					<thead>
						<tr>
							<th class="num">No</th>
							<th class="title">제목</th>
                            <th class="date">작성자</th>
                            <th class="tel">전화번호</th>
                            <th class="email">이메일</th>
							<th class="date">가입일자</th>
							<th class="view">조회</th>
							<th class="management">관리</th>
						</tr>                      
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${!empty resultList}">							
							<c:forEach var="result" items="${resultList}" varStatus="status">	
							<tr <c:out value="${result.role_check eq 'N'?'class=not_read':''}" />>
								<td class="num" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.rownum}" /></td>
								<td class="title" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.title}" /></td>
	                            <td class="writer" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.ceo}" />(<c:out value="${result.store_id}" />)</td>
	                            <td class="tel" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.tel}" /></td>
	                            <td class="email" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.email}" /></td>		
								<td class="date" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.created_datetime}" /></td>
								<td class="view" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.cnt}" /></td>
								<td class="management">
									<button onclick="frmInfo('<c:out value="${result.no}" />')" class="img_set" type="button"></button>
									<button onclick="frmDel('<c:out value="${result.no}" />')" class="img_del" type="button"></button>											
								</td>							
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8">조회 내역이 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>							
					</tbody>
				</table>
				<input type="hidden" name="no" id="no" value="">
				<input type="hidden" name="role_id" id="role_id" value="<c:out value="${sessionScope.role_id}" />">
				<input type="hidden" name="view_type" id="view_type" value="">
				<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
				<input type="hidden" name="file_type" id="file_type" value="no7"/>
				<input type="hidden" name="file_check" id="file_check" value="F"/>						
			</form>

			<!-- pager -->
			<div class="paging">
				<ul class="pager_btn">
					<ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page"  />
				</ul>
			</div>

