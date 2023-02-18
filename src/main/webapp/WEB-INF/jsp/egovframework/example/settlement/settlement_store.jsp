<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   

    <script src="/js/settlement_store.js"></script>
    <script src="/js/table.js"></script>


			    <div class="inner clearfix">
			        <div class="col">
			            <strong class="sub_ttl">가맹점별정산조회</strong>
			            <form class="form_layout" name="" id="" method="get" action="" target="">
		                <input type="hidden" name="roleStore" id="roleStore" value="${sessionScope.role_id eq '1004'? sessionScope.login_id:''}">
		                <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">					
			            <input type="hidden" name="day_type" id="day_type" value=""> 		
			            <input type="hidden" name="order_id" id="order_id" value="">				
			            <input type="hidden" name="order_no" id="order_no" value="1">
			                <table>
			                    <tbody>
			                        <tr class="input_box input_box_border">
			                            <td class="input_ttl" colspan="1"><label class="" for="">거래일자</label></td>
			                            <td class="input_desc period_search_wrap" colspan="7">
			                                <button class="btn_first btn_default ${searchSettlementVO.day_type eq 'day' ?'active':(searchSettlementVO.day_type eq ''?'active':'')}" type="button" id="day" onclick="today('day');">오늘</button>
			                                <button class="btn_default ${searchSettlementVO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
			                                <button class="btn_default ${searchSettlementVO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                            <button class="btn_default ${searchSettlementVO.day_type eq 'month3' ?'active':''}" type="button" id="month3" onclick="prevMonth('3','month1');">3개월</button>
			                                <button class="btn_default ${searchSettlementVO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
			                                <button class="btn_default ${searchSettlementVO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button> 
			                                <input type="text" id="start_datetime" name="start_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchSettlementVO.start_datetime}">
			                                <button type="button" class=""></button> <span class="hypen">~</span>
			                                <input type="text" id="end_datetime" name="end_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchSettlementVO.end_datetime}">
			                                <button type="button" class=""></button>
			                            </td>
			                        </tr>
			                        <tr class="input_box input_box_border">
			                            <td class="input_ttl" colspan="1"><label class="" for="">ID검색/상점명</label>
			                            </td>
			                            <td class="input_desc" colspan="7">
			                                <select class="width_ss" name="search_id" placeholder="" id="search_id">
			                                    <option value="store_id">상점아이디</option>
			                                    <option value="business_nm">상점명</option>
			                                    <option value="cpid">CPID</option>
			                                    <option value="terminal_id">터미널ID</option>
			                                </select> 
			                                <input class="width_240" type="text" id="search_nm" name="search_nm">
			                            </td>									
			                        </tr>
                                    <tr class="input_box input_box_border">
                                        <td class="input_ttl" colspan="1"><label for="">정산방식</label></td>
                                        <td class="input_desc" colspan="2">
                                            <select class="width_s" name="" id="">
                                                <option value="">선택</option>
                                                <option value="">일반정산</option>
                                                <option value="">직접정산</option>
                                            </select>
                                        </td>
                                        <td class="input_ttl" colspan="1"><label for="">정산주기</label></td>
                                        <td class="input_desc" colspan="4">
                                            <select class="width_s"	name="" placeholder="" id="">
                                                <option value="">선택</option>
                                                <option value="">D+0</option>
                                                <option value="">D+1</option>
                                                <option value="">D+2</option>
                                                <option value="">D+3</option>
                                                <option value="">D+4</option>
                                                <option value="">D+5</option>
                                                <option value="">D+6</option>
                                                <option value="">D+7</option>
                                                <option value="">D+8</option>
                                                <option value="">D+9</option>
                                                <option value="">D+10</option>
                                                <option value="">D+11</option>
                                                <option value="">D+12</option>
                                                <option value="">D+13</option>
                                                <option value="">D+14</option>
                                                <option value="">D+15</option>
                                                <option value="">D+16</option>
                                                <option value="">D+17</option>
                                                <option value="">D+18</option>
                                                <option value="">D+19</option>
                                                <option value="">D+20</option>
                                                <option value="">D+21</option>
                                                <option value="">D+22</option>
                                                <option value="">D+23</option>
                                                <option value="">D+24</option>
                                                <option value="">D+25</option>
                                                <option value="">D+26</option>
                                                <option value="">D+27</option>
                                                <option value="">D+28</option>
                                                <option value="">D+29</option>
                                            </select>
                                        </td>
                                    </tr>
			                    </tbody>
			                </table>
			                <div class="btn_box">
			                    <a href="javascript:settlement_store_data();" class="a_btn a_btn_blue">내역조회</a> 
			                    <a href="javascript:settlement_store_init();" class="a_btn a_btn_default">초기화</a>
			                </div>
			            </form>
                    </div>
                    
                    <div class="form_layout detail_layout">
                        <table>
                            <tbody>
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl">
                                        <label for="">기간별 거래처</label>
                                    </td>
                                    <td class="input_desc"><span id="total_cnt"/></td>
                                    <td class="input_ttl">
                                        <label for="">기간별 승인건수</label>
                                    </td>
                                    <td class="input_desc"><span id="total_approval_cnt"/></td>                                    
                                    <td class="input_ttl">
                                        <label for="">기간별 승인액</label>
                                    </td>
                                    <td class="input_desc"><span id="total_approval"/></td>

                                </tr>
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl">
                                        <label for="">부가세</label>
                                    </td>
                                    <td class="input_desc"><span id="total_vat"/></td>
                                    <td class="input_ttl">
                                        <label for="">정산금액</label>
                                    </td>
                                    <td class="input_desc"><span id="total_settlement"/></td>
                                    <td class="input_ttl">
                                        <label for="">총 정산금액</label>
                                    </td>
                                    <td class="input_desc"><span id="total_amount"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
			
			        <div class="col">
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
			            
			            <div id="settlement_store_data"></div>
			        </div>
			    </div>
                                        
                <div id="dim"></div>


                <script>
                    $("#check_all").on('click',function(){
                        //만약 전체 선택 체크박스가 체크된상태일경우
                        if($("#check_all").prop("checked")) {
                            $("input[type=checkbox]").prop("checked",true);
                        } else {
                            $("input[type=checkbox]").prop("checked",false);
                        }
                    });
                    $('td.num input').on('change',function(){
                        var checkCount = $('td.num input:checked').length;
                        var checkTotal = $('td.num input').length;
                        if (checkCount >= 0) {
                            $('#check_all').prop('checked',false);
                        } 
                        if (checkCount == checkTotal) {
                            $('#check_all').prop('checked',true);
                        }
                    });

                    // 테이블 정렬 js
                    $('.contents_wrap .table_layout th button').on('click',function(){
                        if($(this).hasClass('up')){
                            $(this).removeClass('up');
                            $(this).addClass('down');
                        } else if ($(this).hasClass('down')){
                            $(this).removeClass('down');
                            $(this).addClass('up');
                        } else {
                            $('.contents_wrap .table_layout th button').removeClass('up down');
                            $(this).addClass('up');
                        }
                    });
                </script>	
