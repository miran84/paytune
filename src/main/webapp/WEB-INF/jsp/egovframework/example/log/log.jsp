<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <style>
            .table_layout table th:nth-child(1),
            .table_layout table td:nth-child(1) {
                    width:5% !important;
            }
            .table_layout table th:nth-child(2),
            .table_layout table td:nth-child(2) {
                     width:10% !important;
                     text-align:center;
            }
            .table_layout table th:nth-child(3),
            .table_layout table td:nth-child(3) {
                    width:10% !important;
                    text-align:center;
            }
            .table_layout table th:nth-child(4),
            .table_layout table td:nth-child(4) {
                      width:15% !important;
                      text-align:center;
            }
            .table_layout table th:nth-child(5),
            .table_layout table td:nth-child(5) {
                      width:60% !important;
                      text-align:center;
            }
            .table_layout table th:nth-child(6),
            .table_layout table td:nth-child(6) {
                      width:15% !important;
                      text-align:center;
            }
            .table_layout table th:nth-child(7),
            .table_layout table td:nth-child(7) {
                      width:15% !important;
                      text-align:center;
            }
    </style>
	
    <script src="/js/log.js"></script>
    
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
					<strong class="sub_ttl">로그관리</strong>
					<form class="form_layout" name="frm1" id="frm1" method="post" action=""	target="" onsubmit="return false;" >

						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">검색일자</label>
									</td>
									<td class="input_desc period_search_wrap" colspan="7">
										<button class="btn_first btn_default" type="button" id="day" onclick="today();">오늘</button>
										<button class="btn_default" type="button" id="week" onclick="prevDay('7');">1주일</button>
										<button class="btn_default" type="button" id="month1" onclick="prevMonth('1');">1개월</button>
										<button class="btn_default" type="button" id="month3" onclick="prevMonth('3');">3개월</button>
										<button class="btn_default" type="button" id="month6" onclick="prevMonth('6');">6개월</button>
										<button class="btn_default" type="button" id="year" onclick="prevMonth('12');">1년</button> 
										<input type="text" id="start_datetime" name="start_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value=""><button type="button" class=""></button> <span class="hypen">~</span>
										<input type="text" id="end_datetime" name="end_datetime" class="width_150 date_form ui-datepicker-trigger"	placeholder="" value=""><button type="button" class=""></button>
									</td>
								</tr>							
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">검색조건</label>
									</td>
									<td class="input_desc" colspan="7">
									<span class="checkbox">
									<input type="radio" name="check" value="login_id" class="input_checkbox" id="login_id"  checked> <label for="login_id">상점ID</label>
									</span> 
									<span class="checkbox"> <input type="radio" name="check" value="ip" class="input_checkbox" id="ip">
									<label for="ip">IP</label>
									</span> 
									<span class="checkbox"> <input type="radio" name="check" value="action" class="input_checkbox" id="action">
									<label for="action">기능</label>
									</span> 
									<span class="checkbox"> <input type="radio" name="check" value="url" class="input_checkbox" id="url">
									<label for="url">URL</label>
									</span>
									<span class="checkbox"> <input type="radio" name="check" value="login" class="input_checkbox" id="login">
									<label for="login">로그인</label>
									</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">검색어</label>
									</td>
									<td class="input_desc" colspan="7"><input
										class="width_370" type="text" name="searchKeyword" placeholder="" id="searchKeyword" onkeyup="enterkey()">
									</td>
								</tr>
							</tbody>
						</table>

						<div class="btn_box">
							<a href="javascript:log_data();" class="a_btn a_btn_blue">검색</a>
						</div>
					</form>
				</div>

				<div class="col" id="log_data"></div>
				
			</div>




