<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <script>
    
    var view_type_s = '<c:out value="${view_type}" />';
    
    $(function() {
    <c:choose>
	    <c:when test="${sessionScope.role_id eq '1001'}">
		    getOption('#roleStore', 'high_store_id2', '', '${searchManageVO.roleStore }');
	    </c:when>
	    <c:otherwise>
		    getOption2('#roleStore', 'high_store_id2','${sessionScope.login_id}', '', '${searchManageVO.roleStore }');
	    </c:otherwise>
    </c:choose>
    });
    </script>
	<script src="/js/jquery.number.js"></script>
	<script src="/js/manage_branch.js"></script>
	<script src="/js/table.js"></script>
	
	<script>

	</script>
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
                    <div class="ttl_box">
                        <strong class="sub_ttl">대리점관리</strong>
                        <c:if test="${sessionScope.role_id eq '1001'}">
                        <a href="/manage/manage_branch_register.do" class="manage_register">대리점등록</a>
                        </c:if>
                    </div>
					<form class="form_layout" name="frm1" id="frm1" method="get" action="" target="">
					<input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1002'? sessionScope.login_id:''}">
						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">가입일자</label>
									</td>
									<td class="input_desc period_search_wrap" colspan="7">
										<button class="btn_first btn_default ${searchManageVO.day_type eq 'day' ?'active':''}" type="button" id="day" onclick="today('day');">오늘</button>
										<button class="btn_default ${searchManageVO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
										<button class="btn_default ${searchManageVO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                        <button class="btn_default ${searchManageVO.day_type eq 'month3' ?'active':''}" type="button" id="month3" onclick="prevMonth('3','month3');">3개월</button>
										<button class="btn_default ${searchManageVO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
										<button class="btn_default ${searchManageVO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button> 
										<input type="text" id="start_datetime" name="start_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchManageVO.start_datetime }"><button type="button" class=""></button>
										<span class="hypen">~</span>
										<input type="text" id="end_datetime" name="end_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchManageVO.end_datetime }"><button type="button" class=""></button>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">상점명</label>
									</td>
									<td class="input_desc" colspan="2">
										 <input class="width_s" type="text" name="business_nm" placeholder="" id="business_nm" value="${searchManageVO.business_nm }">
									</td>
									<td class="input_ttl" colspan="1">
										<label class="" for="">이메일</label>
									</td>
									<td class="input_desc" colspan="4">
                                        <select class="width_ss" name="searchKeyword1" placeholder="" id="searchKeyword1">
											<option value="total" ${searchManageVO.searchKeyword1 eq 'total' ?'selected':''}>전체</option>
											<option value="email" ${searchManageVO.searchKeyword1 eq 'email' ?'selected':''}>대표</option>
											<option value="person_email1" ${searchManageVO.searchKeyword1 eq 'person_email1' ?'selected':''}>계약담당자</option>
											<option value="person_email2" ${searchManageVO.searchKeyword1 eq 'person_email2' ?'selected':''}>정산담당자</option>
											<option value="person_email3" ${searchManageVO.searchKeyword1 eq 'person_email3' ?'selected':''}>기술담당자</option>
										</select>										
										<input class="width_s" type="email" name="email" placeholder="" id="email" value="${searchManageVO.email }">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">연락처</label>
									</td>
									<td class="input_desc" colspan="2">
										 <input class="width_s" type="tel" name="tel" placeholder="" id="tel" value="${searchManageVO.tel }">
									</td>
									<td class="input_ttl" colspan="1">
										<label class="" for="">휴대폰</label>
									</td>
									<td class="input_desc" colspan="4">
										<select class="width_ss" name="searchKeyword2" placeholder="" id="searchKeyword2">
											<option value="total" ${searchManageVO.searchKeyword2 eq 'total' ?'selected':''}>전체</option>
											<option value="phone_num" ${searchManageVO.searchKeyword2 eq 'phone_num' ?'selected':''}>대표</option>
											<option value="person_phone1" ${searchManageVO.searchKeyword2 eq 'person_phone1' ?'selected':''}>계약담당자</option>
											<option value="person_phone2" ${searchManageVO.searchKeyword2 eq 'person_phone2' ?'selected':''}>정산담당자</option>
											<option value="person_phone3" ${searchManageVO.searchKeyword2 eq 'person_phone3' ?'selected':''}>기술담당자</option>
										</select>								
										<input class="width_s" type="tel" name="phone_num" placeholder="" id="phone_num" value="${searchManageVO.phone_num }">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">영업대행</label>
									</td>
									<td class="input_desc" colspan="2">
										<select class="width_s" name="roleStore" placeholder="" id="roleStore">
											<option value="">전체</option>
										</select>
									</td>
									<td class="input_ttl" colspan="1">
										<label class="" for="">이름</label>
									</td>
									<td class="input_desc" colspan="4">
										<select class="width_ss" name="searchKeyword" placeholder="" id="searchKeyword">
											<option value="">선택</option>
											<option value="ceo" ${searchManageVO.searchKeyword eq 'ceo' ?'selected':''}>대표</option>
											<option value="person_nm" ${searchManageVO.searchKeyword eq 'person_nm' ?'selected':''}>담당자</option>
										</select>
										<input class="width_s" type="tel" name="person_nm" placeholder="" id="person_nm" value="${searchManageVO.person_nm }">
									</td>
                                </tr>
                                <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">상점ID</label>
									</td>
									<td class="input_desc" colspan="2">
                                        <input class="width_s" type="tel" name="store_id" placeholder="" id="store_id" value="${searchManageVO.store_id }">
									</td>
									<td class="input_ttl" colspan="1">
										<label class="" for="">상태</label>
									</td>
									<td class="input_desc" colspan="4">
										<select class="width_s" name="state" placeholder="" id="state">
											<option value="">선택</option>
											<option value="Y" ${searchManageVO.state eq 'Y' ?'selected':''}>사용</option>
											<option value="N" ${searchManageVO.state eq 'N' ?'selected':''}>중지</option>
										</select>
									</td>
								</tr>
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
                                    <td class="input_desc" colspan="7"><input class="width_s" type="tel" name="commission" placeholder="" id="commission" value="${searchManageVO.commission }">%</td>
                                </tr>								
							</tbody>
						</table>

						<div class="btn_box">
							<a href="javascript:manage_branch_data();" class="a_btn a_btn_blue">내역조회</a> 
							<a href="javascript:manage_branch_init();" class="a_btn a_btn_default">초기화</a>
						</div>
						<input type="hidden" name="role_id" id="role_id" value="1003" /> 
						<input type="hidden" name="day_type" id="day_type" value="" /> 
						<input type="hidden" name="order_id" id=order_id value=""/>				
						<input type="hidden" name="order_no" id=order_no value="1"/>							
					</form>
				</div>
				 
				<div class="col" >
					<strong class="num_ttl"><span id="dataCnt"></span></strong>
					<div class="view_box fr">
						<button class="btn_excel" onclick="doExcelDownload();"><img src="../img/ico/ico_excel.png" alt="">엑셀다운로드</button>
						<select class="width_s" name="pageUnit" id="pageUnit">
							<option value="200" ${searchManageVO.pageUnit eq '200' ?'selected':''}>200개씩보기</option>
							<option value="100" ${searchManageVO.pageUnit eq '100' ?'selected':''}>100개씩보기</option>
							<option value="50"  ${searchManageVO.pageUnit eq '50' ?'selected':''}>50개씩보기</option>
							<option value="20"  ${searchManageVO.pageUnit eq '20' ?'selected':''}>20개씩보기</option>
							<option value="10"  ${searchManageVO.pageUnit eq '10' ?'selected':''}>10개씩보기</option>
						</select>
					</div>
					
					<div id="manage_branch_data"></div>			
				</div>
			</div>


	<!-- //wrap -->


