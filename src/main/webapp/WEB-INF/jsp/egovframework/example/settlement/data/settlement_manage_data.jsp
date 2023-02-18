<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>   
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
	
	$("#dataCnt").text('총 <c:out value="${cnt}" />개 / 결과 금액 합계 :<c:out value="${amount}" />원');
	
	$("#amount_sum").text('<c:out value="${amount}" />원');
	$("#total_cnt").text('<c:out value="${cnt}" />건');
	$("#total_approval").text('<c:out value="${settlementVO.total_approval}" />원');
	$("#total_cancel_sum").text('<c:out value="${settlementVO.total_cancel_sum}" />원');
	$("#total_approval_cnt").text('<c:out value="${settlementVO.total_approval_cnt}" />건');
	$("#total_cancel_cnt").text('<c:out value="${settlementVO.total_cancel_cnt}" />건');
	$("#total_settlement").text('<c:out value="${settlementVO.total_settlement}" />원');
	$("#total_settlement2").text('<c:out value="${settlementVO.total_settlement2}" />원');
	$("#total_settlement3").text('<c:out value="${settlementVO.total_settlement3}" />원');
	$("#total_vat").text('<c:out value="${settlementVO.total_vat}" />원');
	$("#total_vat2").text('<c:out value="${settlementVO.total_vat2}" />원');
	$("#total_vat3").text('<c:out value="${settlementVO.total_vat3}" />원');
	$("#total_amount").text('<c:out value="${settlementVO.total_amount}" />원');
	$("#total_amount2").text('<c:out value="${settlementVO.total_amount2}" />원');
	$("#total_amount3").text('<c:out value="${settlementVO.total_amount3}" />원');
});

</script>	

                <form class="table_layout" name="frm2" id="frm2" action="" method="post">
                    <input type="hidden" name="arr_check_id" id="arr_check_id" value="">
                    <input type="hidden" name="no" id="no" value="">
                    <input type="hidden" name="daoutrx" id="daoutrx" value="">
                    <input type="hidden" name="cpid" id="cpid" value="">
                    <input type="hidden" name="pageIndex" id="pageIndex" value="1">	
                    <table>
                        <caption>영업대행별정산조회</caption>
                        <thead>
                            <tr>
                                <th class="num">
                                    <div class="check_box">
                                        <input type="checkbox" id="check_all">
                                        <label for="check_all">No</label>
                                    </div>
                                </th>
                                <th><button type="button" id="btn_period_date2" onclick="frmOrder('period_date2');"
    							<c:if test="${searchSettlementVO.order_id eq 'period_date2' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
    							<c:if test="${searchSettlementVO.order_id eq 'period_date2' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                
                                >정산일</button></th>
                                <th><button type="button" id="btn_business_nm2" onclick="frmOrder('business_nm2');"
    							<c:if test="${searchSettlementVO.order_id eq 'business_nm2' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
    							<c:if test="${searchSettlementVO.order_id eq 'business_nm2' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                                >영업대행명</button></th>
                                <th><button type="button" id="btn_business_nm3" onclick="frmOrder('business_nm3');"
    							<c:if test="${searchSettlementVO.order_id eq 'business_nm3' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
    							<c:if test="${searchSettlementVO.order_id eq 'business_nm3' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                                >대리점명</button></th>
                                <th><button type="button" id="btn_business_nm" onclick="frmOrder('business_nm');"
    							<c:if test="${searchSettlementVO.order_id eq 'business_nm' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
    							<c:if test="${searchSettlementVO.order_id eq 'business_nm' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                                >가맹점명</button></th>
                                <th><button type="button" id="btn_amount" onclick="frmOrder('amount');"
    							<c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
    							<c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                                >결제금액</button></th>
                                <th><button type="button" id="btn_commission2" onclick="frmOrder('commission2');"
    							<c:if test="${searchSettlementVO.order_id eq 'commission2' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
    							<c:if test="${searchSettlementVO.order_id eq 'commission2' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                                >결제 수수료</button></th>
                                <th><button type="button" id="btn_vat2" onclick="frmOrder('vat2');"
    							<c:if test="${searchSettlementVO.order_id eq 'vat2' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
    							<c:if test="${searchSettlementVO.order_id eq 'vat2' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                                >부가세</button></th>
                                <th><button type="button" id="btn_settlement2" onclick="frmOrder('settlement2');"
    							<c:if test="${searchSettlementVO.order_id eq 'settlement2' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
    							<c:if test="${searchSettlementVO.order_id eq 'settlement2' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                                >정산금액</button></th>
                                <!--  th><button type="button">직접정산</button></th-->
                                <!-- th>상태</th-->
                                <th>상세내역</th>
                            </tr>
                        </thead>
                        <tbody class="">  
						<c:choose>
							<c:when test="${!empty resultList}">							
								<c:forEach var="result" items="${resultList}" varStatus="status">	                        
	                            <tr>
									<td class="num">
										<div class="check_box">
											<input type="checkbox" id="check_id_${status.count}" name="check_id" key="">
											<label for="check_id_${status.count}" class="sub_txt02"></label> <span><c:out value="${result.rownum}" /></span>
										</div>
									</td>
	                                <td><span><c:out value="${result.period_date}" /></span></td>
	                                <td><span><c:out value="${result.business_nm2}" /></span></td>
	                                <td><span><c:out value="${result.business_nm3}" /></span></td>
	                                <td><span><c:out value="${result.business_nm}" /></span></td>
	                                <td><span><c:out value="${result.amount}" />원</span></td>
	                                <td><span><c:out value="${result.commission2}" />원</span></td>
	                                <td><span><c:out value="${result.vat2}" />원</span></td>
	                                <td><span><c:out value="${result.settlement2}" />원</span></td>		
                                    <!-- td>
                                        <img src="/img/ico/ico_directpay.png" alt="직접정산">
                                    </td-->
	                                <!-- td><span>완료</span></td-->
	                                <td><button type="button" class="detail_btn pop_detail_btn" onclick="detail('<c:out value="${result.period_date}" />','<c:out value="${result.cpid}" />');">상세보기</button></td>
	                            </tr>             
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="10">조회 내역이 없습니다</td>
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
                
