<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
	 <script>
	 	var view_type_s = '<c:out value="${view_type}" />';
	 </script>    
    <script src="/js/jquery.number.js"></script>
    <script src="/js/settlement_his.js"></script>
    <script src="/js/table.js"></script>
	
		<!-- container -->
	
				<div class="inner clearfix">
					<div class="col">
						<strong class="sub_ttl">지급보류/해제/별도가감</strong>
						<form class="form_layout" name="" id="" method="get" action=""	target="">
						<input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1002'? sessionScope.login_id:''}">
						<input type="hidden" name="high_store_id2" id="high_store_id2" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">
						<input type="hidden" name="order_id" id=order_id value=""/>				
						<input type="hidden" name="order_no" id=order_no value="1"/>		
							<table>
								<tbody>
									<tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">상점</label>
										</td>
										<td class="input_desc" colspan="7"><input class="width_s" type="text" name="userid" placeholder="" id="userid" value="${searchSettlementVO.userid}"></td>
									</tr>
									<tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">조회기간</label>
										</td>
										<td class="input_desc" colspan="7"><input type="text" id="start_datetime" name="start_datetime"	class="width_150 date_form ui-datepicker-trigger"placeholder="" value="${searchSettlementVO.start_datetime}">
										<button type="button" class=""></button> <span class="hypen">~</span>
										<input type="text" id="end_datetime" name="end_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchSettlementVO.end_datetime}">
										<button type="button" class=""></button></td>
										<!-- td class="input_ttl" colspan="1"><label class="" for="">지불수단</label>
										</td>
										<td class="input_desc" colspan="4"><span class="txt"></span>
										</td-->
									</tr>
									<tr class="input_box input_box_border">
		                                <td class="input_ttl" colspan="1"><label class="" for="">ID검색</label></td>
		                                <td class="input_desc" colspan="2">
		                                    <select class="width_ss" name="search_id" placeholder="" id="search_id">
		                                        <option value="">선택</option>
		                                        <option value="store_id" ${searchSettlementVO.search_id eq 'store_id' ?'selected':''}>상점ID</option>
		                                        <option value="cpid" ${searchSettlementVO.search_id eq 'cpid' ?'selected':''}>CPID</option>
		                                        <option value="terminal_id" ${searchSettlementVO.search_id eq 'terminal_id' ?'selected':''}>터미널ID</option>
		                                    </select>
		                                    <input class="width_s" type="tel" name="search_nm" placeholder="" id="search_nm" value="${searchSettlementVO.search_nm}">
		                                </td>										
										<td class="input_ttl" colspan="1"><label class="" for="">상태</label>
										</td>
										<td class="input_desc" colspan="4">
										<select class="width_s" name="state" placeholder="" id="state">
												<option value="">선택</option>
												<option value="Y" ${searchSettlementVO.state eq 'Y' ?'selected':''}>사용</option>
												<option value="N" ${searchSettlementVO.state eq 'N' ?'selected':''}>중지</option>
										</select></td>
                                    </tr>
                                    <tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">수수료</label>
										</td>
										<td class="input_desc" colspan="2"><input class="width_s" type="text" name="commission" placeholder="" id="commission" value="${searchSettlementVO.commission}">%</td>
										<td class="input_ttl" colspan="1"><label class="" for="">부가세</label>
										</td>
										<td class="input_desc" colspan="4">
                                            <select class="width_s tax_select" name="tax_state" placeholder="" id="tax_state">
												<option value="">선택</option>
												<option value="Y" ${searchSettlementVO.tax_state eq 'Y' ?'selected':''}>발행</option>
												<option value="N" ${searchSettlementVO.tax_state eq 'N' ?'selected':''}>미발행</option>
                                            </select>
                                            <select class="width_s tax_ok" name="tax_state2" placeholder="" id="tax_state2" style="display:none;">
												<option value="0" ${searchSettlementVO.tax_state2 eq '0' ?'selected':''}>발행대기</option>
												<option value="1" ${searchSettlementVO.tax_state2 eq '1' ?'selected':''}>발행완료</option>
                                            </select>
                                        </td>
									</tr>
                                    <tr class="input_box input_box_border">
										<td class="input_ttl" colspan="1"><label class="" for="">결제종류</label>
										</td>
										<td class="input_desc" colspan="7">
											<select class="width_s" name="cp_type" placeholder="" id="cp_type">
												<option value="1" ${searchSettlementVO.cp_type eq '1' ?'selected':''}>페이조아</option>
												<option value="2" ${searchSettlementVO.cp_type eq '2' ?'selected':''}>케이에스넷</option>
											</select>
										</td>
									</tr>									
								</tbody>
							</table>
	
							<div class="btn_box">
								<a href="javascript:settlement_his_data();" class="a_btn a_btn_blue">내역조회</a> 
								<a href="javascript:settlement_his_init();" class="a_btn a_btn_default">초기화</a>
							</div>
						</form>
					</div>
	
					<div class="col" >
						<strong class="num_ttl"><span id="dataCnt"></span></strong>
						<div class="view_box fr">
							<button class="btn_excel" onclick="doExcelDownload();">
								<img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
							</button>
							<select class="width_s" name="pageUnit" id="pageUnit">
								<option value="200" ${searchSettlementVO.pageUnit eq '200' ?'selected':''}>200개씩보기</option>
								<option value="100" ${searchSettlementVO.pageUnit eq '100' ?'selected':''}>100개씩보기</option>
								<option value="50"  ${searchSettlementVO.pageUnit eq '50' ?'selected':''}>50개씩보기</option>
								<option value="20"  ${searchSettlementVO.pageUnit eq '20' ?'selected':''}>20개씩보기</option>
								<option value="10"  ${searchSettlementVO.pageUnit eq '10' ?'selected':''}>10개씩보기</option>
							</select>
						</div>	
						
						<div id="settlement_his_data"></div>				
					</div>
				</div>
	
	
	
		<script>
			//scrollbar
			$(".scrollbar").mCustomScrollbar({
				theme:"dark"
            });
            
            // 부가세 발행 유무
            $('.tax_select').on('change',function(){
                if(this.value == 'Y') {
                    $('.tax_ok').show();
                } else {
                    $('.tax_ok').hide();
                }
            });
            
            <c:if test="${searchSettlementVO.tax_state eq 'Y'}">
        	  $('.tax_ok').show();
          	</c:if>
          
		</script>
	


