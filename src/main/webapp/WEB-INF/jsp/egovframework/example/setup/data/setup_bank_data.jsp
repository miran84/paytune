<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		

						<table>
                            <caption>은행 관리</caption>
                            <colgroup>
                                <col width="40%">
                                <col width="50%">
                                <col width="10%">
                            </colgroup>
							<thead>
								<tr>
									<th class="num">코드명</th>
									<th class="state">은행명</th>
                                    <th class="management">관리</th>
								</tr>                      
							</thead>
							<tbody>
								<c:if test="${!empty resultList}">
								<c:forEach var="result" items="${resultList}" varStatus="status">	
								<tr>
                                    <td><c:out value="${result.bank_code}" /></td>
                                    <td><c:out value="${result.bank_nm}" /></td>
                                    <td class="management">
                                        <button onclick="frmDel('${result.bank_code}');" class="img_del" type="button"></button>
                                    </td>
								</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty resultList}">
									<tr>
										<td colspan="3">등록 내역이 없습니다</td>
									</tr>
								</c:if>								
							</tbody>
						</table>

	  



