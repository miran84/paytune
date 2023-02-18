<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   

    <script src="/js/settlement_store.js"></script>
    <script src="/js/table.js"></script>


        <div class="inner clearfix">
            <div class="col">
                <div class="ttl_box">
                    <strong class="sub_ttl">통합매출관리</strong>
                    <a href="#!" class="manage_register">등록</a>
                </div>
                <form class="form_layout" name="" id="" method="get" action="" target="">
                    <input type="hidden" name="roleStore" id="roleStore" value="${sessionScope.role_id eq '1004'? sessionScope.login_id:''}">
                    <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">					
                    <input type="hidden" name="day_type" id="day_type" value=""> 		
                    <input type="hidden" name="order_id" id="order_id" value="">				
                    <input type="hidden" name="order_no" id="order_no" value="1">
                    <table>
                        <tbody>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">PG사</label>
                                </td>
                                <td class="input_desc" colspan="7">
                                    <select class="width_150" name="" id="">
                                        <option value="">페이조아</option>
                                    </select>
                                </td>								
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">조회기간</label></td>
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
                                <td class="input_ttl" colspan="1"><label class="" for="">조회구분</label>
                                </td>
                                <td class="input_desc" colspan="7">
                                    <span class="checkbox">
                                        <input type="radio" name="inquiry_type" value="" class="input_checkbox" id="inquiry_day"> <label for="inquiry_day">일별</label>
                                    </span>
                                    <span class="checkbox">
                                        <input type="radio" name="inquiry_type" value="" class="input_checkbox" id="inquiry_month"> <label for="inquiry_month">월별</label>
                                    </span>
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
            <div class="col">
                <strong class="sub_cont_ttle">페이조아</strong>
                <div class="view_box fr">
                    <button class="btn_excel" onclick="">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                </div>					
                
                <div id="">
                    <form action="" class="table_layout">
                        <table>
                            <thead>
                                <tr>
                                    <th>PG사</th>
                                    <th><button type="button">마감일(일)</button></th>
                                    <th><button type="button">신용카드</button></th>
                                    <th><button type="button">신용카드K</button></th>
                                    <th><button type="button">휴대폰</button></th>
                                    <th><button type="button">휴대폰원천사선</button></th>
                                    <th><button type="button">ARS700</button></th>
                                    <th><button type="button">폰빌</button></th>
                                    <th><button type="button">계좌이체</button></th>
                                    <th><button type="button">가상계좌</button></th>
                                    <th><button type="button">CMS</button></th>
                                    <th><button type="button">문화상품권</button></th>
                                    <th><button type="button">스마트문상</button></th>
                                    <th><button type="button">도서문화상품권</button></th>
                                    <th><button type="button">해피머니상품권</button></th>
                                    <th><button type="button">에그머니</button></th>
                                    <th><button type="button">틴캐시</button></th>
                                    <th><button type="button">티머니</button></th>
                                    <th><button type="button">모바일팝</button></th>
                                    <th><button type="button">알리페이</button></th>
                                    <th><button type="button">카카오페이</button></th>
                                    <th><button type="button">위챗페이</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span>수수료</span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                </tr>
                                <tr>
                                    <td><span>정산주기</span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                </tr>
                                <tr style="background-color:yellow">
                                    <td><span>합계금액</span></td>
                                    <td><span></span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                    <td><span>0</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- pager -->
                    <div class="paging">
                        <ul class="pager_btn">
                            <li class="first"><a href="javascript:fn_link_page(1)"></a></li>
                            <li class="prev"><a href="javascript:fn_link_page(1)" title="Go to prev page"></a></li>
                            <li class="on"><a href="javascript:1">1</a></li>
                            <li><a href="javascript:fn_link_page(2)" title="Go to page 2">2</a></li>
                            <li><a href="javascript:fn_link_page(3)" title="Go to page 2">3</a></li>
                            <li><a href="javascript:fn_link_page(4)" title="Go to page 2">4</a></li>
                            <li class="next"><a href="javascript:fn_link_page(11)" title="Go to next page"></a></li>
                            <li class="last"><a href="javascript:fn_link_page(12)" title="Go to last page"></a></li>
                        </ul>
                    </div>
                    <!-- //pager -->
                </div>
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
