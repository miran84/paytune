<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>

$(function() {
	$("#check_all").click(function(){
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
	
//	$("#pageUnit").val("${pageUnit}").prop("selected", true);
	$("#myGnb").height($('#wrap').height() - 55);
	
	$("#dataCnt").text('총 <c:out value="${historyVO.total_cnt}" />개 / 결과 금액 합계 :<c:out value="${historyVO.total_approval}" />원');
	
	$("#total_cnt").text('<c:out value="${historyVO.total_cnt}" />건');
	$("#total_approval_cnt").text('<c:out value="${historyVO.total_approval_cnt}" />건');
	$("#total_approval").text('<c:out value="${historyVO.total_approval}" />원');
	$("#total_sum").text('<c:out value="${historyVO.total_sum}" />원');
	$("#total_cancel_sum").text('<c:out value="${historyVO.total_cancel_sum}" />원');
	$("#total_approval_cnt").text('<c:out value="${historyVO.total_approval_cnt}" />건');
	$("#total_cancel_cnt").text('<c:out value="${historyVO.total_cancel_cnt}" />건');
});

</script>	

				 
		<form class="table_layout" name="frm2" id="frm2" action="" method="post">
			<input type="hidden" name="arr_check_id" id="arr_check_id" value="" />
			<input type="hidden" name="no" id="no" value="">
			<input type="hidden" name="cpid" id="cpid" value="">
			<input type="hidden" name="daoutrx" id="daoutrx" value="">
			<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>	
			<table>
                <caption>통합승인내역조회</caption>
                <thead>
                    <tr>
                        <th class="num">
                            <div class="check_box">
                                <input type="checkbox" id="check_all">
                                <label for="check_all">No</label>
                            </div>
                        </th>
                        <th class="cp_type">결제</th>
                        <th class="id"><button type="button" id="btn_userid" onclick="frmOrder('userid');"
							<c:if test="${searchHistoryVO.order_id eq 'userid' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'userid' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>
                        >상점아이디</button></th>
                        <th class="cp_id"><button type="button" id="btn_cpid" onclick="frmOrder('cpid');"
							<c:if test="${searchHistoryVO.order_id eq 'cpid' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'cpid' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >CPID</button></th>         
                        <th><button type="button" id="btn_imei" onclick="frmOrder('imei');"
							<c:if test="${searchHistoryVO.order_id eq 'imei' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'imei' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                                
                        >단말기번호</button></th>               
                        <th class="terminal_id"><button type="button" id="btn_terminalid" onclick="frmOrder('terminalid');"
							<c:if test="${searchHistoryVO.order_id eq 'terminalid' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'terminalid' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >터미널ID</button></th>
                        <th class="buy"><button type="button">매입구분</button></th>
						<th class="price"><button type="button" id="btn_amount" onclick="frmOrder('period');"
							<c:if test="${searchHistoryVO.order_id eq 'period' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'period' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >지급일</button></th> 
                        <th class="price"><button type="button" id="btn_amount" onclick="frmOrder('amount');"
							<c:if test="${searchHistoryVO.order_id eq 'amount' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'amount' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >요청금액</button></th>
                        <th class="okay_date"><button type="button" id="btn_authdate" onclick="frmOrder('authdate');"
							<c:if test="${searchHistoryVO.order_id eq 'authdate' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'authdate' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >승인일자</button></th>
                        <th class="cancel_date"><button type="button" id="btn_canceldate" onclick="frmOrder('canceldate');"
							<c:if test="${searchHistoryVO.order_id eq 'canceldate' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'canceldate' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >취소일자</button></th>
                        <th class="buyer"><button type="button" id="btn_username" onclick="frmOrder('username');"
							<c:if test="${searchHistoryVO.order_id eq 'username' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'username' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >구매자</button></th>
                        <th class="pay"><button type="button" id="btn_amount_pay" onclick="frmOrder('amount_pay');"
							<c:if test="${searchHistoryVO.order_id eq 'amount_pay' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'amount_pay' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >신용카드 금액(원)</button></th>
                        <th class="card_brand"><button type="button" id="btn_cardname" onclick="frmOrder('cardname');"
							<c:if test="${searchHistoryVO.order_id eq 'cardname' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'cardname' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >카드계열</button></th>
                        <th class="app_num"><button type="button" id="btn_authno" onclick="frmOrder('authno');"
							<c:if test="${searchHistoryVO.order_id eq 'authno' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'authno' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >승인번호</button></th>
                        <th class="int_plan"><button type="button" id="btn_quota" onclick="frmOrder('quota');"
							<c:if test="${searchHistoryVO.order_id eq 'quota' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'quota' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >할부개월수</button></th>
                        <th class="pay_path"><button type="button" id="btn_paymenttype" onclick="frmOrder('paymenttype');"
							<c:if test="${searchHistoryVO.order_id eq 'paymenttype' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'paymenttype' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >결제경로</button></th>
                        <th class="order_num"><button type="button" id="btn_orderno" onclick="frmOrder('orderno');"
							<c:if test="${searchHistoryVO.order_id eq 'orderno' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'orderno' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >주문번호</button></th>
                        <th class="order_state"><button type="button" id="btn_authdate_type" onclick="frmOrder('authdate_type');"
							<c:if test="${searchHistoryVO.order_id eq 'authdate_type' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'authdate_type' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >거래상태</button></th>
                        <th class="order_receipt"><button type="button" id="btn_receipt">영수증</button></th>                        
                        <th><button type="button" class="warning">중복결제</button></th>
                        <th><button type="button" class="warning">고액건</button></th>
                        <th class="order_cancel"><button type="button" id="btn_canceldate_type" onclick="frmOrder('canceldate_type');"
							<c:if test="${searchHistoryVO.order_id eq 'canceldate_type' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'canceldate_type' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >거래취소</button></th>
                        <th class="sales_state"><button type="button" id="btn_tax" onclick="frmOrder('tax');"
							<c:if test="${searchHistoryVO.order_id eq 'tax' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
							<c:if test="${searchHistoryVO.order_id eq 'tax' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                        
                        >매출전표</button></th>
                        <th><button type="button">정산정보</button></th>
					    <c:choose>
						    <c:when test="${sessionScope.role_id eq '1001'}">
	                        <th class="branch01"><button type="button" id="btn_business_nm3" onclick="frmOrder('business_nm3');"
								<c:if test="${searchHistoryVO.order_id eq 'business_nm3' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchHistoryVO.order_id eq 'business_nm3' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
	                        >영업대행</button></th>
	                        <th class="branch02"><button type="button" id="btn_business_nm2" onclick="frmOrder('business_nm2');"
								<c:if test="${searchHistoryVO.order_id eq 'business_nm2' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchHistoryVO.order_id eq 'business_nm2' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
	                        >대리점</button></th>
	                        <th class="branch03"><button type="button" id="btn_business_nm" onclick="frmOrder('business_nm');"
								<c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
	                        >가맹점</button></th>
						    </c:when>
						    <c:when test="${sessionScope.role_id eq '1002'}">
	                        <th class="branch02"><button type="button" id="btn_business_nm2" onclick="frmOrder('business_nm2');"
								<c:if test="${searchHistoryVO.order_id eq 'business_nm2' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchHistoryVO.order_id eq 'business_nm2' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
	                        >대리점</button></th>
	                        <th class="branch03"><button type="button" id="btn_business_nm" onclick="frmOrder('business_nm');"
								<c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
	                        >가맹점</button></th>
						    </c:when>
						    <c:when test="${sessionScope.role_id eq '1003'}">
                    	    <th class="branch03"><button type="button" id="btn_business_nm" onclick="frmOrder('business_nm');"
    							<c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
    							<c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                    	    
                    	    >가맹점</button></th>
						    </c:when>
                        </c:choose>
                            <th><button type="button">직접정산</button></th>
                        <!-- th class="management">관리</th-->
                    </tr>                      
                </thead>
				<tbody>
					<c:choose>
						<c:when test="${!empty resultList}">
							<c:forEach var="result" items="${resultList}" varStatus="status">	
							<tr>
								<td class="num">
									<div class="check_box">
										<input type="checkbox" id="check_id_${status.count}" name="check_id" key="<c:out value="${result.no_cpid}" />">
										<label for="check_id_${status.count}" class="sub_txt02"></label> <span><c:out value="${result.rownum}" /></span>
									</div>
								</td>
								<td class="cp_type"><span><c:out value="${result.cp_type eq '2'?'케이에스넷':'페이조아'}" /></span></td>
								<td class="id" onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"><span><c:out value="${result.userid}" /></span></td>
								<td class="cpid" ><span><c:out value="${result.cpid}" /></span></td>
								<td><span><c:out value="${result.imei}" /></span></td>
								<td class="terminal_id"><span><c:out value="${result.terminalid}" /></span></td>
								<td class="buy"><span>매입</span></td>
								<td class="buy"><span>D+<c:out value="${result.period}" /></span></td>
								<td class="price"><span><c:out value="${result.amount}" />원</span></td>
								<td class="okay_date"><span><c:out value="${result.authdate}" /></span></td>
								<td class="cancel_date"><span><c:out value="${result.canceldate}" /></span></td>
								<td class="buyer"><span><c:out value="${result.username}" /></span></td>
								<td class="pay"><span><c:out value="${result.amount}" />원</span></td>
								<td class="card_brand"><span><c:out value="${result.cardname}" /></span></td>
								<td class="app_num"><span><c:out value="${result.authno}" /></span></td>
								<td class="int_plan"><span><c:out value="${result.quota eq '00'?'일시불':(result.quota eq '0'?'일시불':result.quota)}" /></span></td>
								<td class="pay_path"><span><c:out value="${result.paymenttype eq '1'?'키인승인':(result.paymenttype eq '2'?'sms승인':'단말기승인')}" /></span></td>
								<td class="order_num"><span><c:out value="${result.orderno}" /></span></td>
								<td class="order_state"><span>
								<c:choose>
									<c:when test="${!empty result.canceldate}">
										<span class="order_state_cancel">결제취소</span>
									</c:when>
									<c:when test="${!empty result.authdate}">
										<span class="order_state_finish">결제완료</span>
									</c:when>
								</c:choose>		
								</span></td>
								<td class="id" onclick="frmReceipt('<c:out value="${result.daoutrx}" />','<c:out value="${result.canceltype}" />','<c:out value="${result.cp_type}" />')" ><span>확인</span></td>
                                <td><span class="warning">중복</span></td>
                                <td><span class="<c:out value="${fn:replace(result.amount, ',', '') >= 3000000 ? 'warning':''}" />"><c:out value="${fn:replace(result.amount, ',', '') >= 3000000 ? '고액':'일반'}" /></span></td>
                                <td class="order_cancel"><span><c:out value="${!empty result.canceldate?'Y':'N'}" /></span></td>
                                <td class="sales_state"><span><c:out value="${result.tax}" /></span></td>
                                <td><button type="button" class="detail_btn pop_detail_btn" onclick="detail('<c:out value="${result.authdate}" />','<c:out value="${result.cpid}" />');">상세보기</button></td>
							    <c:choose>
								    <c:when test="${sessionScope.role_id eq '1001'}">
									<td class="branch01"><span><c:out value="${result.business_nm3}" /></span></td>
									<td class="branch02"><span><c:out value="${result.business_nm2}" /></span></td>
									<td class="branch03"><span><c:out value="${result.business_nm}" /></span></td>
								    </c:when>
								    <c:when test="${sessionScope.role_id eq '1002'}">
									<td class="branch02"><span><c:out value="${result.business_nm2}" /></span></td>
									<td class="branch03"><span><c:out value="${result.business_nm}" /></span></td>
								    </c:when>
								    <c:when test="${sessionScope.role_id eq '1003'}">
		                    	    <td class="branch03"><span><c:out value="${result.business_nm}" /></span></td>
								    </c:when>
							    </c:choose>		
                                <td>
                                    <img src="/img/ico/ico_directpay.png" alt="직접정산">
                                </td>
		                        <!-- td class="management">
									<button type="button" class="img_set" onclick="location.href='history_all_view.do';"></button>
									<button type="button" class="img_del"></button>
								</td-->
							</tr>		
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
							    <c:choose>
								    <c:when test="${sessionScope.role_id eq '1001'}">
									<td colspan="17">조회 내역이 없습니다</td>
								    </c:when>
								    <c:when test="${sessionScope.role_id eq '1002'}">
									<td colspan="16">조회 내역이 없습니다</td>
								    </c:when>
								    <c:when test="${sessionScope.role_id eq '1003'}">
		                    	    <td colspan="15">조회 내역이 없습니다</td>
								    </c:when>
								    <c:otherwise>
										<td colspan="14">조회 내역이 없습니다</td>
								    </c:otherwise>								    
							    </c:choose>		
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			</form>
			
	     <!-- pager -->
           <div class="paging">
               <ul class="pager_btn">
               
                   <ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page"  />
                   
               </ul>
           </div>
        <!-- //pager -->	

