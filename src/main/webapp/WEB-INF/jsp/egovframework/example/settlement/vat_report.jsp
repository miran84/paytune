<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   

    <script src="/js/settlement_store.js"></script>
    <script src="/js/table.js"></script>


        <div class="inner clearfix">
            <div class="col">
                <strong class="sub_ttl">부가세신고자료</strong>
                <form class="form_layout" name="" id="" method="get" action="" target="">
                    <input type="hidden" name="roleStore" id="roleStore" value="${sessionScope.role_id eq '1004'? sessionScope.login_id:''}">
                    <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">					
                    <input type="hidden" name="day_type" id="day_type" value=""> 		
                    <input type="hidden" name="order_id" id="order_id" value="">				
                    <input type="hidden" name="order_no" id="order_no" value="1">
                    <table>
                        <tbody>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">사업자번호</label>
                                </td>
                                <td class="input_desc" colspan="7">
                                    <input class="width_240" type="text" id="search_nm" name="search_nm">
                                </td>								
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">거래형태</label>
                                </td>
                                <td class="input_desc" colspan="7">
                                    <span class="checkbox">
                                        <input type="radio" name="transaction" value="" class="input_checkbox" id="sales"> <label for="sales">매출</label>
                                    </span>
                                    <span class="checkbox">
                                        <input type="radio" name="transaction" value="" class="input_checkbox" id="purchase"> <label for="purchase">매입</label>
                                    </span>
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
                        </tbody>
                    </table>
                    <div class="btn_box">
                        <a href="javascript:settlement_store_data();" class="a_btn a_btn_blue">내역조회</a> 
                        <a href="javascript:settlement_store_init();" class="a_btn a_btn_default">초기화</a>
                    </div>
                </form>
            </div>
            
            <div class="form_info">
                <ul>
                    <li>* 제공하는 부가세 신고자료는 지엠지페이먼트 결제시스템 이용내역 기준으로 작성 된 자료이며, 참고자료로 이용 부탁드립니다.</li>
                    <li>* 국세청 홈택스(www.hometax.go.kr) 사이트에서 별도로 추가 확인하여, 세무서 신고 시 매입/매출 내역이 누락되지 않도록 주의하시기 바랍니다.</li>
                    <li>* 집계기준
                        <ul>
                            <li>- 신용카드, 계좌이체, 상품권, 휴대폰, 폰빌결제 : 승인일(거래일)기준</li>
                            <li>- 가상계좌 : 입금일 기준</li>
                            <li>- 현금영수증 : 발행일 기준</li>
                        </ul>
                    </li>
                    <li>* 모든 내역은 [승인-취소] 기준으로 제공되며, 부분취소의 경우 금액만 마이너스 계산 됩니다.</li>
                </ul>
            </div>
            
            <strong class="sub_cont_ttl">* 부가세 신고 명세서</strong>
            <div class="form_layout detail_layout">
                <table>
                    <tbody>
                        <tr class="input_box input_box_border">
                            <td class="input_ttl">
                                <label for="">CPID</label>
                            </td>
                            <td class="input_desc">4568410</td>                                    
                            <td class="input_ttl">
                                <label for="">사업자명</label>
                            </td>
                            <td class="input_desc">김길동</td>                                    
                        </tr>
                        <tr class="input_box input_box_border">
                            <td class="input_ttl">
                                <label for="">사업자번호</label>
                            </td>
                            <td class="input_desc">5128801567</td>                                    
                            <td class="input_ttl">
                                <label for="">매출기간</label>
                            </td>
                            <td class="input_desc">2021.07.01~2021.07.31</td>                                    
                        </tr>
                    </tbody>
                </table>
            </div>
    
            <div class="col">
                <strong class="sub_cont_ttl">* 신용카드 매출 <span>(세금계산서발행)</span></strong>
                <div class="view_box fr">
                    <button class="btn_excel" onclick="">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                </div>					
                
                <div id="">
                    <form action="" class="table_layout table_scroll">
                        <table>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th><button type="button">업체명</button></th>
                                    <th><button type="button">사업자번호(주민등록번호)</button></th>
                                    <th><button type="button">승인건수</button></th>
                                    <th><button type="button">승인금액기간별(2021.07.07~2021.07.31)</button></th>
                                    <th><button type="button">취소건수</button></th>
                                    <th><button type="button">취소금액기간별(2021.07.01~2021.07.31)</button></th>
                                    <th><button type="button">합계금액</button></th>
                                    <th><button type="button">수수료율</button></th>
                                    <th><button type="button">수수료</button></th>
                                    <th><button type="button">부가세</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span>1</span></td>
                                    <td><span>장인가마솥</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>2</span></td>
                                    <td><span>머리하는날</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>3</span></td>
                                    <td><span>랜드마크건설</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>4</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>5</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>6</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>7</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>8</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>9</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>10</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr style="background-color:yellow">
                                    <td><span></span></td>
                                    <td><span>합계</span></td>
                                    <td><span></span></td>
                                    <td><span>340</span></td>
                                    <td><span>61,643,110</span></td>
                                    <td><span>340</span></td>
                                    <td><span>61,640,000</span></td>
                                    <td><span></span></td>
                                    <td><span>340</span></td>
                                    <td><span></span></td>
                                    <td><span>61,643,110</span></td>
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

            <div class="col">
                <strong class="sub_cont_ttl">* 신용카드 매출 <span>(매입세금계산서)</span></strong>
                <div class="view_box fr">
                    <button class="btn_excel" onclick="">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                </div>
                <div id="">
                    <form action="" class="table_layout table_scroll">
                        <table>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th><button type="button">업체명</button></th>
                                    <th><button type="button">사업자번호(주민등록번호)</button></th>
                                    <th><button type="button">승인건수</button></th>
                                    <th><button type="button">승인금액기간별(2021.07.07~2021.07.31)</button></th>
                                    <th><button type="button">취소건수</button></th>
                                    <th><button type="button">취소금액기간별(2021.07.01~2021.07.31)</button></th>
                                    <th><button type="button">합계금액</button></th>
                                    <th><button type="button">수수료율</button></th>
                                    <th><button type="button">수수료</button></th>
                                    <th><button type="button">부가세</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span>1</span></td>
                                    <td><span>장인가마솥</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>2</span></td>
                                    <td><span>머리하는날</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>3</span></td>
                                    <td><span>랜드마크건설</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>4</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>5</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>6</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>7</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>8</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>9</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>10</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr style="background-color:yellow">
                                    <td><span></span></td>
                                    <td><span>합계</span></td>
                                    <td><span></span></td>
                                    <td><span>340</span></td>
                                    <td><span>61,643,110</span></td>
                                    <td><span>340</span></td>
                                    <td><span>61,640,000</span></td>
                                    <td><span></span></td>
                                    <td><span>340</span></td>
                                    <td><span></span></td>
                                    <td><span>61,643,110</span></td>
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

            <div class="col">
                <strong class="sub_cont_ttl">* 신용카드 매출 <span>(원천징수) 사업자 없는 영업대행/대리점</span></strong>
                <div class="view_box fr">
                    <button class="btn_excel" onclick="">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                </div>
                
                <div id="">
                    <form action="" class="table_layout table_scroll">
                        <table>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th><button type="button">업체명</button></th>
                                    <th><button type="button">사업자번호(주민등록번호)</button></th>
                                    <th><button type="button">승인건수</button></th>
                                    <th><button type="button">승인금액기간별(2021.07.07~2021.07.31)</button></th>
                                    <th><button type="button">취소건수</button></th>
                                    <th><button type="button">취소금액기간별(2021.07.01~2021.07.31)</button></th>
                                    <th><button type="button">합계금액</button></th>
                                    <th><button type="button">수수료율</button></th>
                                    <th><button type="button">수수료</button></th>
                                    <th><button type="button">부가세</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span>1</span></td>
                                    <td><span>장인가마솥</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>2</span></td>
                                    <td><span>머리하는날</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>3</span></td>
                                    <td><span>랜드마크건설</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>4</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>5</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>6</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>7</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>8</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>9</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td><span>10</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr style="background-color:yellow">
                                    <td><span></span></td>
                                    <td><span>합계</span></td>
                                    <td><span></span></td>
                                    <td><span>340</span></td>
                                    <td><span>61,643,110</span></td>
                                    <td><span>340</span></td>
                                    <td><span>61,640,000</span></td>
                                    <td><span></span></td>
                                    <td><span>340</span></td>
                                    <td><span></span></td>
                                    <td><span>61,643,110</span></td>
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
