<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <script src="/js/jquery.number.js"></script>
    <script src="/js/history_all.js"></script>
    <script src="/js/table.js"></script>


	<!-- container -->

        <div class="inner clearfix">
            <div class="col">
                <strong class="sub_ttl">차감내역조회</strong>
                <form class="form_layout" name="" id="" method="get" action="" target="">
                <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1002'? sessionScope.login_id:''}">
                <input type="hidden" name="high_store_id2" id="high_store_id2" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">
                <input type="hidden" name="day_type" id="day_type" value="" /> 
                <input type="hidden" name="order_id" id=order_id value=""/>				
                <input type="hidden" name="order_no" id=order_no value="1"/>						
                    <table>
                        <tbody>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">거래일자</label>
                                </td>
                                <td class="input_desc period_search_wrap" colspan="7">
                                    <button class="btn_first btn_default ${searchHistoryVO.day_type eq 'day' ?'active':(searchHistoryVO.day_type eq ''?'active':'')}" type="button" id="day" onclick="today('day');">오늘</button>
                                    <button class="btn_default ${searchHistoryVO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
                                    <button class="btn_default ${searchHistoryVO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                    <button class="btn_default ${searchHistoryVO.day_type eq 'month3' ?'active':''}" type="button" id="month3" onclick="prevMonth('3','month3');">3개월</button>
                                    <button class="btn_default ${searchHistoryVO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
                                    <button class="btn_default ${searchHistoryVO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button> 
                                    <input type="text" id="start_datetime" name="start_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchHistoryVO.start_datetime}">
                                    <button type="button" class=""></button> <span class="hypen">~</span>
                                    <input type="text" id="end_datetime" name="end_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchHistoryVO.end_datetime}">
                                    <button type="button" class=""></button>
                                </td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">거래금액</label>
                                </td>
                                <td class="input_desc" colspan="7">
                                    <input class="width_s" type="text" name="amount1" placeholder="" id="amount1" value="${searchHistoryVO.amount1}">
                                    <span class="hypen">~</span>
                                    <input class="width_s" type="text" name="amount2" placeholder="" id="amount2" value="${searchHistoryVO.amount2}">
                                </td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">카드종류</label>
                                </td>
                                <td class="input_desc" colspan="2">
                                    <select class="width_ss" name="cardcode" placeholder="" id="cardcode">
                                        <option value="">전체</option>
                                    </select>
                                </td>
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">카드번호</label>
                                </td>
                                <td class="input_desc" colspan="4">
                                    <input class="width_s" type="text" name="cardno" placeholder="" id="cardno" value="${searchHistoryVO.cardno}">
                                </td>								
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">구매자명</label>
                                </td>
                                <td class="input_desc" colspan="2">
                                    <input class="width_s" type="text" name="username" placeholder="" id="username" value="${searchHistoryVO.username}">
                                </td>
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">할부구분</label>
                                </td>
                                <td class="input_desc" colspan="4">
                                    <select class="width_s" name="quota" placeholder="" id="quota">
                                        <option value="">전체</option>
                                        <c:forEach var="i" begin="0" end="12">
                                            <c:choose>
                                                <c:when test="${i == 0}">
                                                    <option value="00">일시불</option>
                                                </c:when>
                                                <c:when test="${i < 10 && i > 1}">
                                                    <option value="0<c:out value="${i}" />" ${searchHistoryVO.quota eq i ?'selected':''}>0<c:out value="${i}" /></option>
                                                </c:when>
                                                <c:when test="${i >= 10}">
                                                    <option value="<c:out value="${i}" />" ${searchHistoryVO.quota eq i ?'selected':''}><c:out value="${i}" /></option>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>											
                                    </select>
                                </td>								
                            </tr>
                            <tr class="input_box input_box_border">
                            <c:choose>
                                <c:when test="${sessionScope.role_id eq '1001'}">
                                    <td class="input_ttl" colspan="1"><label class="" for="">영업대행/대리점</label>
                                    </td>
                                    <td class="input_desc" colspan="2">
                                        <select class="width_ss" name="roleStore" placeholder="" id="roleStore">
                                            <option value="">전체</option>
                                        </select> 
                                        <select class="width_ss" name="roleStore2" placeholder="" id="roleStore2">
                                            <option>선택</option>
                                        </select> 
                                    </td>
                                </c:when>
                                <c:when test="${sessionScope.role_id eq '1002'}">
                                    <td class="input_ttl" colspan="1"><label class="" for="">대리점</label>
                                    </td>
                                    <td class="input_desc" colspan="2">
                                        <select class="width_ss" name="roleStore2" placeholder="" id="roleStore2">
                                            <option>선택</option>
                                        </select> 
                                    </td>
                                </c:when>
                                <c:when test="${sessionScope.role_id eq '1003'}">
                                    <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label>
                                    </td>
                                    <td class="input_desc" colspan="2">
                                        <select class="width_ss" name="roleStore3" placeholder="" id="roleStore3">
                                            <option>선택</option>
                                        </select> 
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <input type="hidden" name="roleStore3" id="roleStore3" value="<c:out value="${sessionScope.login_id}" />">
                                </c:otherwise>
                            </c:choose>										
                                
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">상점주문번호</label>
                                </td>
                                <td class="input_desc" colspan="4">
                                    <input class="width_s" type="text" name="orderno" placeholder="" id="orderno" value="${searchHistoryVO.orderno}">
                                </td>								
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"> 
                                    <label class="" for="">ID검색/상점명</label>
                                </td>
                                <td class="input_desc" colspan="2">
                                    <select class="width_ss" name="search_id" placeholder="" id="search_id">
                                        <option value="">선택</option>
                                        <option value="store_id" ${searchHistoryVO.search_id eq 'store_id' ?'selected':''}>상점ID</option>
                                        <option value="business_nm" ${searchHistoryVO.search_id eq 'business_nm' ?'selected':''}>상점명</option>
                                        <option value="cpid" ${searchHistoryVO.search_id eq 'cpid' ?'selected':''}>CPID</option>
                                        <option value="terminal_id" ${searchHistoryVO.search_id eq 'terminal_id' ?'selected':''}>터미널ID</option>
                                        <option value="imei" ${searchHistoryVO.search_id eq 'imei' ?'selected':''}>단말기번호</option>
                                    </select>
                                    <input class="width_s" type="tel" name="search_nm" placeholder="" id="search_nm" value="${searchHistoryVO.search_nm}">                                
                                </td>
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">상태</label>
                                </td>
                                <td class="input_desc" colspan="4">
                                    <select class="width_s" name="state" placeholder="" id="state">
                                        <option value="">선택</option>
                                        <option value="Y" ${searchHistoryVO.state eq 'Y' ?'selected':''}>사용</option>
                                        <option value="N" ${searchHistoryVO.state eq 'N' ?'selected':''}>중지</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">거래상태</label>
                                </td>
                                <td class="input_desc" colspan="2">
                                    <select class="width_s" placeholder="" name="dealing_yn" id="dealing_yn">
                                        <option value="">선택</option>
                                        <option value="Y" ${searchHistoryVO.dealing_yn eq 'Y' ?'selected':''}>결제취소</option>
                                        <option value="N" ${searchHistoryVO.dealing_yn eq 'N' ?'selected':''}>결제완료</option>
                                    </select>
                                </td>
                                <td class="input_ttl" colspan="1">
                                    <label class="" for="">결제종류</label>
                                </td>
                                <td class="input_desc" colspan="4">
                                    <select class="width_s" name="cp_type" placeholder="" id="cp_type">
                                        <option value="1" ${searchHistoryVO.cp_type eq '1' ?'selected':''}>페이조아</option>
                                        <option value="2" ${searchHistoryVO.cp_type eq '2' ?'selected':''}>케이에스넷</option>
                                    </select>
                                </td>									
                            </tr>
                        </tbody>
                    </table>

                    <div class="btn_box">
                        <a href="javascript:history_all_data();" class="a_btn a_btn_blue">내역조회</a>
                        <a href="javascript:history_all_init();" class="a_btn a_btn_default">초기화</a>
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
                                     <label for="">기간별취소건</label>
                                 </td>
                                 <td class="input_desc"><span id="total_cancel_cnt"/></td>
                                 <td class="input_ttl">
                                     <label for="">기간별취소금액</label>
                                 </td>
                                 <td class="input_desc"><span id="total_cancel_sum"/></td>
                                 <td class="input_ttl">
                                     <label for="">총합계금액</label>
                                 </td>
                                 <td class="input_desc"><span id="total_sum"/></td>
                             </tr>
                         </tbody>
                     </table>
                 </div>                
                
            <div class="col" >
                <div class="view_box_wrap clearfix">
                    <strong class="num_ttl"><span id="dataCnt"></span></strong>
                    <div class="view_box fr">
                        <!-- button type="button" class="all_cancel_btn">전체취소</button>
                        <button type="button" class="part_cancel_btn">부분취소</button-->
                        <button class="btn_excel" onclick="doExcelDownload();">
                            <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                        </button>
                        <select class="width_s" name="pageUnit" id="pageUnit">
                            <option value="200" ${searchHistoryVO.pageUnit eq '200' ?'selected':''}>200개씩보기</option>
                            <option value="100" ${searchHistoryVO.pageUnit eq '100' ?'selected':''}>100개씩보기</option>
                            <option value="50"  ${searchHistoryVO.pageUnit eq '50' ?'selected':''}>50개씩보기</option>
                            <option value="20"  ${searchHistoryVO.pageUnit eq '20' ?'selected':''}>20개씩보기</option>
                            <option value="10"  ${searchHistoryVO.pageUnit eq '10' ?'selected':''}>10개씩보기</option>
                        </select>
                    </div>				 
                </div>
                
                <div id="">
                    <form action="" class="table_layout">
                        <table>
                            <thead>
                                <tr>
                                    <th rowspan="2">No</th>
                                    <th rowspan="2"><button type="button">PG</button></th>
                                    <th rowspan="2"><button type="button">정산예정(정산일정)</button></th>
                                    <th rowspan="2"><button type="button">상점아이디</button></th>
                                    <th rowspan="2"><button type="button">터미널ID</button></th>
                                    <th rowspan="2"><button type="button">CPID</button></th>
                                    <th rowspan="2"><button type="button">취소일자(현거래일자)</button></th>
                                    <th rowspan="2"><button type="button">결제경로</button></th>
                                    <th rowspan="2"><button type="button">카드계열</button></th>
                                    <th rowspan="2"><button type="button">승인번호</button></th>
                                    <th rowspan="2"><button type="button">할부개월수</button></th>
                                    <th rowspan="2"><button type="button">취소금액</button></th>
                                    <th rowspan="2"><button type="button">수수료</button></th>
                                    <th rowspan="2"><button type="button">차감할금액</button></th>
                                    <th colspan="3"><button type="button">차감완료금액(A)</button></th>
                                    <th rowspan="2"><button type="button">미차감금액</button></th>
                                    <th rowspan="2"><button type="button">입금처리/내역</button></th>
                                    <th rowspan="2"><button type="button">영업대행</button></th>
                                    <th rowspan="2"><button type="button">대리점</button></th>
                                    <th rowspan="2"><button type="button">가맹점</button></th>
                                </tr>
                                <tr>
                                    <th><button type="button">수기입금ⓐ</button></th>
                                    <th><button type="button">정산차감ⓑ</button></th>
                                    <th><button type="button">A=ⓐ+ⓑ</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span>1</span></td>
                                    <td><span>페이조아</span></td>
                                    <td><span></span></td>
                                    <td><span>GP11583066</span></td>
                                    <td><span>GP11583066</span></td>
                                    <td><span>8700108</span></td>
                                    <td><span>2021.07.01 20:20:00</span></td>
                                    <td><span>단말기승인</span></td>
                                    <td><span>롯데</span></td>
                                    <td><span>3158741</span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span>1,000,000</span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>이안케어</span></td>
                                    <td><span>장안가마솥</span></td>
                                </tr>
                                <tr>
                                    <td><span>2</span></td>
                                    <td><span>페이조아</span></td>
                                    <td><span></span></td>
                                    <td><span>GP11583066</span></td>
                                    <td><span>GP11583066</span></td>
                                    <td><span>8700108</span></td>
                                    <td><span>2021.07.01 20:20:00</span></td>
                                    <td><span>키인</span></td>
                                    <td><span>롯데</span></td>
                                    <td><span>3158741</span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span>1,000,000</span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span></span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>이안케어</span></td>
                                    <td><span>장안가마솥</span></td>
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
			//scrollbar
			$(".scrollbar").mCustomScrollbar({
				theme:"dark"
            });

        </script>



