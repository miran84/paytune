<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	 <style>
		.table_layout table th:nth-child(1),
		.table_layout table td:nth-child(1) {
			width:5% !important;
		}
		.table_layout table th.title,
		.table_layout table td.title {
			 width:63% !important;
		}
		.table_layout table th:nth-child(3),
		.table_layout table td:nth-child(3) {
			width:10% !important;
			text-align:center;
		}
		.table_layout table th:nth-child(4),
		.table_layout table td:nth-child(4) {
			  width:10% !important;
			  text-align:center;
		}
		.table_layout table th:nth-child(5),
		.table_layout table td:nth-child(5) {
			  width:5% !important;
			  text-align:center;
		}
		.table_layout table th:nth-child(6),
		.table_layout table td:nth-child(6) {
			  width:7% !important;
			  text-align:center;
		}
	 </style>
	<script src="/js/notice02_view.js"></script>	
	<!-- container -->
	
				<div class="inner clearfix">
					<div class="col">
						<strong class="sub_ttl">자료실</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="no" id="no" value=${noticeVO.no } />
					<input type="hidden" name="view_type" id="view_type" value="I">
					<input type="hidden" name="file_type" id="file_type" value="no2"/>
					<input type="hidden" name="file_check" id="file_check" value="F"/>			
							<table>
								<tbody>
									<tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">작성자</label>
										</td>
										<td class="input_desc" colspan="7">관리자</td>
									</tr>
									<tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">구분</label>
										</td>
										<td class="input_desc" colspan="7">
										<label for="notice_type">${noticeVO.notice_type eq 'Y'? '공지':'' } </label>
										</td>
									</tr>
									<tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">등록일</label>
										</td>
										<td class="input_desc" colspan="7">${noticeVO.created_datetime }</td>
									</tr>
									<tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">조회</label>
										</td>
										<td class="input_desc" colspan="7">${noticeVO.cnt }</td>
									</tr>	
									<tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">제목</label>
										</td>
										<td class="input_desc" colspan="7">${noticeVO.title }</td>
									</tr>
									<tr class="input_box input_box_border editor">
										<td class="input_ttl" colspan="1"><label class="" for="">내용</label>
										</td>
										<td class="input_desc" colspan="7">${noticeVO.content }</td>
									</tr>
									<tr class="input_box input_box_border file_add">
										<td class="input_ttl" colspan="1"><label class="" for="">첨부파일</label>
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
	                            <a href="/notice/notice02.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
	                      		<c:if test="${sessionScope.role_id eq '1001'}">
	                            <a href="javascript:frmMod();" class="a_btn a_btn_blue_line">수정</a>
	                            </c:if>
	                            <a href="/notice/notice02.do" class="a_btn a_btn_default">목록</a>
	                        </div>
						</form>
					</div>
				</div>
	
	
	


