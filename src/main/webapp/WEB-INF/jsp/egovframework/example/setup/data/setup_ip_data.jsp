<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>

		
					<form class="table_layout notice_layout setup_layout" action="" name="frm2" id="frm2" method="post">

						<table>
                            <caption>접속 IP</caption>
                            <colgroup>
                                <col width="5%">
                                <col width="20%">
                                <col width="auto">
                                <col width="15%">
                                <col width="15%">
                                <col width="10%">
                            </colgroup>
							<thead>
								<tr>
                                    <th class="num">번호</th>
                                    <th>아이피</th>
									<th class="memo">메모</th>
									<th class="role">구분</th>
                                    <th class="state">등록일</th>
                                    <th class="management">관리</th>
								</tr>                      
							</thead>
							<tbody>
								<c:if test="${!empty resultList}">
								<c:forEach var="result" items="${resultList}" varStatus="status">	
								<tr>
                                    <td><c:out value="${result.rownum}" /></td>
                                    <td><c:out value="${result.ip}" /></td>
                                    <td><c:out value="${result.memo}" /></td>
                                    <td><c:out value="${result.role_id eq '1001'? '본사':(result.role_id eq '1002'?'영업대행':(result.role_id eq '1003'? '대리점':'가맹점'))}" /></td>
                                    <td><c:out value="${result.created_datetime}" /></td>
                                    <td class="management">
                                        <button onclick="frmDel('${result.no}');" class="img_del" type="button"></button>
                                    </td>
								</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty resultList}">
									<tr>
										<td colspan="6">조회 내역이 없습니다</td>
									</tr>
								</c:if>									
							</tbody>
						</table>
						<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
						<input type="hidden" name="no" id="no" value=""/>
							
	                    <div class="paging">
	                        <ul class="pager_btn">
                           		<ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page"  />
	                        </ul>
	                    </div>	
					
					</form>

