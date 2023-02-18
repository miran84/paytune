<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<script src="/js/calender2.js"></script>
    
<!-- container -->
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
	<c:set var="sysMm"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
			<div class="inner clearfix">
				<div class="col">
				 <strong class="sub_ttl">정산승인달력</strong>
					<form class="form_layout" name="" id="" method="post" action="" target="">
					<input type="hidden" name="role_id" id="role_id" value="<c:out value='${sessionScope.role_id}' />">
						<table>
							<tbody>
							  <c:choose>
								    <c:when test="${sessionScope.role_id ne '1004'}">
										<tr class="input_box input_box_border">
											<td class="input_ttl" colspan="1">
												<label class="" for="">상점 ID</label>
											</td>
											<td class="input_desc" colspan="7">
												<span class="txt" id="storeIdNm"></span> 
		                                        <!-- button type="button" class="btn_check">정산주기 확인</button-->
		                                        <input type="text" class="width_s" name="store_id" id="store_id">
		                                        <button class="btn_search cal_search" type="button" onclick="jsStoreId();">
													<img src="../img/btn/btn_search.png" alt="찾기">
												</button>                                        
											</td>
										</tr>
								    </c:when>
								    <c:otherwise>
									    <input type="hidden" name="store_id" id="store_id" value="<c:out value='${sessionScope.login_id}' />">
								    </c:otherwise>
							    </c:choose>							
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">지급월</label>
									</td>
									<td class="input_desc" colspan="7">
										<select class="width_ss" name="yyyy" placeholder="" id="yyyy">
                                            <c:forEach var="i" begin="2021" end="${sysYear}">
												<option value="<c:out value="${i}" />" <c:out value="${i eq sysYear ?'selected':''}" />><c:out value="${i}" /></option>
											</c:forEach>											
										</select>
										<select class="width_s" name="mm" placeholder="" id="mm">
                                            <c:forEach var="i" begin="0" end="12">
												<c:choose>
													<c:when test="${i < 10 && i > 0}">
														<option value="0<c:out value="${i}" />" <c:out value="${i eq sysMm ?'selected':''}" />>0<c:out value="${i}" /></option>
													</c:when>
													<c:when test="${i > 10}">
														<option value="<c:out value="${i}" />" <c:out value="${i eq sysMm ?'selected':''}" />><c:out value="${i}" /></option>
													</c:when>
												</c:choose>
											</c:forEach>											
										</select>										
									</td>								
								</tr>
							</tbody>
						</table>

						<div class="btn_box">
							<a href="javascript:calendar_data('1');" class="a_btn a_btn_blue">내역조회</a>
						</div>
					</form>
				</div>

				 <div class="col calender_wrap" id="calendar_data">

				</div>
			</div>


	<!-- //container -->


	  
<!-- //wrap -->




