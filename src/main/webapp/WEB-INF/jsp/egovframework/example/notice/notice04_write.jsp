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
	<script src="/js/summernote-0.8.18-dist/summernote-lite.js"></script>
	<script src="/js/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>

	<link rel="stylesheet" href="/js/summernote-0.8.18-dist/summernote-lite.css">	
	<style>
	.note-editor .note-editable {
	    line-height: 150%;  //개행 간격을 알맞게 설정
	}	
	</style>		
	<script src="/js/notice04_write.js"></script>
	
				<div class="inner clearfix">
					<div class="col">
						<strong class="sub_ttl">1:1문의(가맹점)</strong>
						<form class="form_layout" name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
						<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
						<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
						<input type="hidden" name="store_id" id="store_id" value="${sessionScope.login_id}" />
						<input type="hidden" name="role_id" id="role_id" value="${sessionScope.role_id}" />
						<input type="hidden" name="no" id="no" value=${noticeVO.no } />
						<input type="hidden" name="file_type" id="file_type" value="no4" />
						<input type="hidden" name="arrChk" id="arrChk"/>
	
							<table>
								<tbody>
									<c:choose>
									    <c:when test="${sessionScope.role_id eq '1001'}">
											<tr class="input_box input_box_border">
												<td class="input_ttl" colspan="1">
													<label class="" for="">작성자</label>
												</td>
												<td class="input_desc" colspan="7">
													${noticeVO.ceo }(<c:out value="${noticeVO.store_id}" />)
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
											<tr class="input_box input_box_border">
												<td class="input_ttl" colspan="1"><label class="" for="">전화번호</label>
												</td>
												<td class="input_desc" colspan="7">${noticeVO.tel }</td>
											</tr>
											<tr class="input_box input_box_border">
												<td class="input_ttl" colspan="1"><label class="" for="">이메일</label>
												</td>
												<td class="input_desc" colspan="7">${noticeVO.email }</td>
											</tr>												
											<tr class="input_box input_box_border editor">
												<td class="input_ttl" colspan="1"><label class="" for="">내용</label>
												</td>
												<td class="input_desc" colspan="7">${noticeVO.content }</td>
											</tr>
											<tr class="input_box input_box_border comment">
												<td class="input_ttl" colspan="1"><label class="" for="">답변</label>
												</td>
												<td class="input_desc" colspan="7">
												<textarea class="width_all" name="reply" id="reply" cols="202" rows="7">${noticeVO.reply }</textarea>
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
									    </c:when>
									    <c:otherwise>
											<c:if test="${view_type eq 'I'}">
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
											</c:if>							
			                                <tr class="input_box input_box_border">
												<td class="input_ttl" colspan="1">
													<label class="" for="">제목</label>
												</td>
												<td class="input_desc" colspan="7">
													<input class="width_all" type="text" id="title" name="title" value="${noticeVO.title }">
												</td>													
											</tr>
			                                <tr class="input_box input_box_border">
												<td class="input_ttl" colspan="1">
													<label class="" for="">전화번호</label>
												</td>
												<td class="input_desc" colspan="7">
													<input class="width_all" type="text" id="tel" name="tel" value="${noticeVO.tel }">
												</td>													
											</tr>
			                                <tr class="input_box input_box_border">
												<td class="input_ttl" colspan="1">
													<label class="" for="">이메일</label>
												</td>
												<td class="input_desc" colspan="7">
													<input class="width_all" type="text" id="email" name="email" value="${noticeVO.email }">
												</td>													
											</tr>												
			                                <tr class="input_box input_box_border editor">
												<td class="input_ttl" colspan="1">
													<label class="" for="">내용</label>
												</td>
												<td class="input_desc" colspan="7">
													<textarea id="content" name="content" cols="202" rows="7">${noticeVO.content }</textarea>
												</td>								
											</tr>
			                                <tr class="input_box input_box_border file_add">
												<td class="input_ttl" colspan="1">
													<label class="" for="">첨부파일</label>
												</td>
												<td class="input_desc" colspan="7">
													<div class="file_add_btn">
			                                            <input type="text" class="width_180" name="file_nm" id="file_nm" value="" placeholder="" readonly>
			                                            <input type="file" id="file_add" name="file" >
			                                            <label for="file_add">
			                                                <span class="file_btn"></span>
			                                            </label>
			                                        </div>
			                                        <c:if test="${view_type eq 'I'}">
				                                        <div class="file_delete">
				                                            <button type="button">파일삭제</button>
					                                        <c:forEach var="result" items="${resultList}" varStatus="status">	
				    	                                        <input id="delete_check_${result.file_num }" class="check_new" type="checkbox" name="chk" key="${result.file_num }">
				       		                                    <label for="delete_check_${result.file_num }">${result.file_nm }</label>
					                                        </c:forEach>
				                                        </div>
			                                        </c:if>	
												</td>								
											</tr>
									    </c:otherwise>
								    </c:choose>		
								</tbody>
							</table>
	                        <div class="btn_box">
	                        	<a href="/notice/notice04.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
							    <c:choose>
								    <c:when test="${sessionScope.role_id eq '1001'}">
									   <a href="javascript:frmMod();" class="a_btn a_btn_blue_line">수정</a>
								    </c:when>
								    <c:otherwise>
		                      		  	<c:if test="${view_type eq 'I'}">
			                         	   <a href="javascript:frmMod();" class="a_btn a_btn_blue_line">수정</a>
			                            </c:if>	
			                        	<c:if test="${view_type eq 'N'}">
			                     	       <a href="javascript:frmAdd();" class="a_btn a_btn_blue">등록</a>
			                            </c:if>	
								    </c:otherwise>
							    </c:choose>	 
	                            <a href="/notice/notice04.do" class="a_btn a_btn_default">목록</a>
	                        </div>
						</form>
					</div>
				</div>
	
	
		<script>
	    function goBack() {
	      window.history.back();
	    }
	    </script>


