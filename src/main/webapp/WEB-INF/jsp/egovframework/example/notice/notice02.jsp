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
	 
	 <script>
	 	var view_type_s = '<c:out value="${view_type}" />';
	 </script>
     <script src="/js/notice02.js"></script>
    	 
	<!-- container -->
	
				<div class="inner clearfix">
					<div class="col">
						<strong class="sub_ttl">자료실</strong>
						<form class="form_layout" name="frm1" id="frm1" method="post" action=""	target="" onsubmit="return false;" >
	
							<table>
								<tbody>
									<tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">검색조건</label>
										</td>
										<td class="input_desc" colspan="7"><span class="checkbox">
										<input type="radio" name="check" value="total" class="input_checkbox" id="total" ${searchNoticeVO.check eq 'total'?'checked':''}> <label for="total">전체</label>
										</span> <span class="checkbox"> 
										<input type="radio" name="check" value="title" class="input_checkbox" id="title" ${searchNoticeVO.check eq 'title'?'checked':''}>
												<label for="title">제목</label>
										</span> <span class="checkbox"> 
										<input type="radio" name="check" value="content" class="input_checkbox" id="content" ${searchNoticeVO.check eq 'content'?'checked':''}>
												<label for="content">내용</label>
										</span></td>
									</tr>
									<tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">검색어</label>
										</td>
										<td class="input_desc" colspan="7"><input
											class="width_370" type="text" name="searchKeyword" placeholder="" id="searchKeyword" value="${searchNoticeVO.searchKeyword }" onkeyup="enterkey()">
										</td>
									</tr>
								</tbody>
							</table>
	
							<div class="btn_box">
								<a href="javascript:notice02_data();" class="a_btn a_btn_blue">검색</a>
							</div>
						</form>
					</div>
	
					<div class="col" id="notice02_data"></div>
				</div>
	
	


