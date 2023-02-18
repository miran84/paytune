<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="/js/setup_register.js"></script>
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
				 <strong class="sub_ttl">운영자 계정 추가</strong>
					<form class="form_layout setup_layout" name="frm" id="frm" method="post" action="" target="">
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />					
					<input type="hidden" name="arr_check_id" id="arr_check_id" value="" />					
					<input type="hidden" name="role_id" id="role_id" value="1001" />					
						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">아이디</label>
									</td>						   
									<td class="input_desc" colspan="2">
                                        <input class="width_s" type="text" name="store_id" id="store_id" >
                                        <!-- button type="button" class="overlap_check">중복확인</button-->
									</td>
									<td class="input_ttl" colspan="1">
										<label class="" for="">비밀번호</label>
									</td>
									<td class="input_desc" colspan="4">
										<input class="width_s" type="password" name="passwd" id="passwd" >
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">이름</label>
									</td>
									<td class="input_desc" colspan="2">
										 <input class="width_s" type="text" name="ceo" id="ceo">
									</td>
									<td class="input_ttl" colspan="1">
										<label class="" for="">휴대폰</label>
									</td>
									<td class="input_desc" colspan="4">
										<input class="width_s" type="text" name="phone_num" id="phone_num" >
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">현황</label>
									</td>
									<td class="input_desc" colspan="7">
										<select class="width_s" name="state" placeholder="" id="state">
											<option value="Y">이용중</option>
											<option value="N">정지중</option>
										</select>
									</td>								
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">권한</label>
									</td>
									<td class="input_desc multi_table_wrap" colspan="7">
										<table class="multi_table">
                                            <colgroup>
                                                <col style="width:10%;">
                                                <col style="width:auto;">
                                            </colgroup>
                                            <tbody>       
											<c:forEach var="result" items="${resultList}" varStatus="status">
											<c:choose>
												<c:when test="${!empty result.menu_url}">
		                                            <tr>
		                                                <th><c:out value="${result.menu_nm}" /></th>
		                                                <td>
		                                                    <div class="check_box">
		                                                        <input type="checkbox" id="M_<c:out value="${result.menu_id}" />" name="menu_id" key="<c:out value="${result.menu_id}" />">
		                                                        <label for="M_<c:out value="${result.menu_id}" />"><c:out value="${result.menu_nm}" /></label>
		                                                    </div>
		                                                </td>
		                                            </tr>
												</c:when>
												<c:otherwise>
		                                            <tr>
		                                                <th><c:out value="${result.menu_nm}" /></th>
		                                                <td>
		                                                	<c:forEach var="result2" items="${resultList2}" varStatus="status">
															<c:if test="${result.menu_id eq result2.high_menu_id}">
			                                                    <div class="check_box">
			                                                        <input type="checkbox" id="M_<c:out value="${result2.menu_id}" />" name="menu_id" key="<c:out value="${result2.menu_id}" />">
			                                                        <label for="M_<c:out value="${result2.menu_id}" />"><c:out value="${result2.menu_nm}" /></label>
			                                                    </div>
															</c:if>
		                                                    </c:forEach> 
		                                                </td>
		                                            </tr>			    
												</c:otherwise>
											</c:choose>		
											</c:forEach>  
                                            </tbody>
                                        </table>
									</td>
								</tr>
							</tbody>
						</table>

						<div class="btn_box">
							<a href="javascript:fnSubmit();" class="a_btn a_btn_blue">등록</a>
							<a href="/setup/setup_admin.do" class="a_btn a_btn_default" id="go_back">목록</a>
						</div>
					</form>
				</div>
			</div>
	
