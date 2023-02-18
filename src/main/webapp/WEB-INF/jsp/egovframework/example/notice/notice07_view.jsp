<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <script src="/js/notice07_view.js"></script>
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
				 <strong class="sub_ttl">결제취소요청</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="" target="" >
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="no" id="no" value=${noticeVO.no } />
					<input type="hidden" name="view_type" id="view_type" value="I">
					<input type="hidden" name="file_type" id="file_type" value="no7"/>
					<input type="hidden" name="file_check" id="file_check" value="F"/>	
						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">작성자</label>
									</td>
									<td class="input_desc" colspan="7">
										<div class="view_box_inner">
											<p>${noticeVO.ceo }(<c:out value="${noticeVO.store_id}" />)</p>
										</div>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">등록일</label>
									</td>
									<td class="input_desc" colspan="7">
										<div class="view_box_inner">
											<p>${noticeVO.created_datetime }</p>
										</div>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">조회</label>
									</td>
									<td class="input_desc" colspan="7">
										<div class="view_box_inner">
											<p>${noticeVO.cnt }</p>
										</div>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">제목</label>
									</td>
									<td class="input_desc" colspan="7">
										<div class="view_box_inner">
											<p>${noticeVO.title }</p>
										</div>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">전화번호</label>
									</td>
									<td class="input_desc" colspan="7">
										<div class="view_box_inner">
											<p>${noticeVO.tel }</p>
										</div>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">이메일</label>
									</td>
									<td class="input_desc" colspan="7">
										<div class="view_box_inner">
											<p>${noticeVO.email }</p>
										</div>
									</td>
                                </tr>		
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1">
                                        <label class="" for="">결제날짜</label>
                                    </td>
                                    <td class="input_desc" colspan="7">
                                        <p>${noticeVO.authdate }</p>
                                    </td>													
                                </tr>											
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1">
                                        <label class="" for="">금액</label>
                                    </td>
                                    <td class="input_desc" colspan="7">
                                        <p>${noticeVO.amount }원</p>
                                    </td>													
                                </tr>											
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl order_num" colspan="1">
                                        <label class="" for="">주문번호(영수증번호)</label>
                                    </td>
                                    <td class="input_desc" colspan="7">
                                        <p>${noticeVO.orderno }</p>
                                    </td>													
                                </tr>											
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1">
                                        <label class="" for="">구매자명</label>
                                    </td>
                                    <td class="input_desc" colspan="7">
                                        <p>${noticeVO.username }</p>
                                    </td>													
                                </tr>											
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1">
                                        <label class="" for="">상점아이디</label>
                                    </td>
                                    <td class="input_desc" colspan="7">
                                        <p>${noticeVO.userid }</p>
                                    </td>													
                                </tr>							
								<tr class="input_box input_box_border editor">
									<td class="input_ttl" colspan="1"><label class="" for="">내용</label>
									</td>
									<td class="input_desc" colspan="7">
										${noticeVO.content }
									</td>
								</tr>
								<tr class="input_box input_box_border comment">
									<td class="input_ttl" colspan="1"><label class="" for="">답변</label>
									</td>
									<td class="input_desc" colspan="7">
										${noticeVO.reply }
									</td>
								</tr>
                                <tr class="input_box input_box_border file_add">
									<td class="input_ttl" colspan="1">
										<label class="" for="">첨부파일</label>
									</td>
									<td class="input_desc" colspan="7">
										<c:set var="comma" value=","/>
										<c:forEach var="result" items="${resultList}" varStatus="status">	
	                                        <a href="/fileDownload.do?no=${result.file_num }"><label for="delete_check_${result.file_nm }">${result.file_nm }</label></a>
											<c:if test="${!status.last}">${comma}</c:if>
										</c:forEach>
									</td>								
								</tr>
							</tbody>
						</table>
						<div class="btn_box">
							<a href="/notice/notice07.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
							<a href="javascript:frmMod();" class="a_btn a_btn_blue_line">수정</a> 
							<a href="/notice/notice07.do" class="a_btn a_btn_default">목록</a>
						</div>
                    </form>
					</div>
				</div>
	
	
