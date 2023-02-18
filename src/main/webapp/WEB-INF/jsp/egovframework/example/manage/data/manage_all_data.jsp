<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>

<script>

$(function() {
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
	
//	$("#pageUnit").val("${pageUnit}").prop("selected", true);
	$("#myGnb").height($('#wrap').height() - 55);
	
	$("#dataCnt").text('총 <c:out value="${cnt}" />개');
	
});

</script>	

			<form class="table_layout" name="frm2" id="frm2" action="" method="post" enctype="multipart/form-data">
				<input type="hidden" name="role_id" id="role_id" value="1002" />
				<input type="hidden" name="arr_check_id" id="arr_check_id" value="" />
				<input type="hidden" name="store_id" id="store_id" value="">
				<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>				
				<table>
                    <caption>영업대행관리</caption>
                    <thead>
						<tr>
							<th class="num">
                                <div class="check_box">
                                    <input type="checkbox" id="check_all">
                                    <label for="check_all">No</label>
                                </div>
                            </th>
							<th class="id"><button type="button" id="btn_store_id" onclick="frmOrder('store_id');" 
								<c:if test="${searchManageVO.order_id eq 'store_id' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'store_id' and searchManageVO.order_no eq '2'}">class="down"</c:if>
							>상점아이디</button></th>
							<th class="title"><button type="button"	id="btn_business_nm" onclick="frmOrder('business_nm');" 
								<c:if test="${searchManageVO.order_id eq 'business_nm' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'business_nm' and searchManageVO.order_no eq '2'}">class="down"</c:if>							
							>회사명</button></th>
							<th class="date"><button type="button" id="btn_created_datetime" onclick="frmOrder('created_datetime');" 
								<c:if test="${searchManageVO.order_id eq 'created_datetime' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'created_datetime' and searchManageVO.order_no eq '2'}">class="down"</c:if>							
							>가입일자</button></th>
							<th class="code01"><button type="button" id="btn_corp_regist_num" onclick="frmOrder('corp_regist_num');" 
								<c:if test="${searchManageVO.order_id eq 'corp_regist_num' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'corp_regist_num' and searchManageVO.order_no eq '2'}">class="down"</c:if>							
							>사업자번호</button></th>
							<th class="terminal_id"><button type="button" id="btn_terminal_id" onclick="frmOrder('terminal_id');" 
								<c:if test="${searchManageVO.order_id eq 'terminal_id' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'terminal_id' and searchManageVO.order_no eq '2'}">class="down"</c:if>							
							>터미널ID</button></th>
							<th class="buy"><button type="button">매입구분</button></th>
							<th class="code02"><button type="button" id="btn_tel" onclick="frmOrder('tel');" 
								<c:if test="${searchManageVO.order_id eq 'tel' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'tel' and searchManageVO.order_no eq '2'}">class="down"</c:if>								
							>회사번호</button></th>
							<th class="manager"><button type="button" id="btn_person_nm1" onclick="frmOrder('person_nm1');" 
								<c:if test="${searchManageVO.order_id eq 'person_nm1' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'person_nm1' and searchManageVO.order_no eq '2'}">class="down"</c:if>								
							>담당자</button></th>
							<th class="email"><button type="button" id="btn_person_email1" onclick="frmOrder('person_email1');" 
								<c:if test="${searchManageVO.order_id eq 'person_email1' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'person_email1' and searchManageVO.order_no eq '2'}">class="down"</c:if>								
							>이메일</button></th>
							<th class="mob"><button type="button" id="btn_person_phone1" onclick="frmOrder('person_phone1');" 
								<c:if test="${searchManageVO.order_id eq 'person_phone1' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'person_phone1' and searchManageVO.order_no eq '2'}">class="down"</c:if>								
                            >휴대폰</button></th>
                            <!-- th><button type="button">직접정산</button></th-->
							<th class="status"><button type="button" id="btn_state" onclick="frmOrder('state');" 
								<c:if test="${searchManageVO.order_id eq 'state' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'state' and searchManageVO.order_no eq '2'}">class="down"</c:if>								
							>상태</button></th>
							<th class="pay_state"><button type="button" id="btn_tax" onclick="frmOrder('tax');" 
								<c:if test="${searchManageVO.order_id eq 'tax' and searchManageVO.order_no eq '1'}">class="up"</c:if>
								<c:if test="${searchManageVO.order_id eq 'tax' and searchManageVO.order_no eq '2'}">class="down"</c:if>								
							>지급상태</button></th>
							<th class="management"><button type="button" >관리</button></th>
						</tr>
					</thead>
					<tbody class="scrollbar">
					<c:choose>
						<c:when test="${!empty resultList}">						
							<c:forEach var="result" items="${resultList}" varStatus="status">	
							<tr>
								<td class="num">
									<div class="check_box">
										<input type="checkbox" id="check_id_${status.count}" name="check_id" key="<c:out value="${result.store_id}" />">
										<label for="check_id_${status.count}" class="sub_txt02"></label> <span><c:out value="${result.rownum}" /></span>
									</div>
								</td>
								<td class="id" onclick="frmView('<c:out value="${result.store_id}" />')"><c:out value="${result.store_id}" /></td>
								<td class="title"><c:out value="${result.business_nm}" /></td>
								<td class="date"><c:out value="${result.created_datetime}" /></td>
								<td class="code01"><c:out value="${result.corp_regist_num}" /></td>
								<td class="terminal_id"><c:out value="${result.terminal_id}" /></td>
								<td class="buy">매입</td>
								<td class="code02"><c:out value="${result.tel}" /></td>
								<td class="manager"><c:out value="${result.person_nm1}" /></td>
								<td class="email"><c:out value="${result.person_email1}" /></td>
								<td class="mob"><c:out value="${result.person_phone1}" /></td>
                                <!-- td>
                                    <img src="/img/ico/ico_directpay.png" alt="직접정산">
                                </td-->
								<td class="status"><c:out value="${result.state eq 'Y'?'사용':'중지'}" /></td>
								<td class="pay_state"><c:out value="${result.tax eq 'Y'?'세금계산서':'원천징수'}" /></td>
								<td class="management">
									<button onclick="frmInfo('<c:out value="${result.store_id}" />')"
										class="img_set" type="button"></button>
									<button onclick="frmDel('<c:out value="${result.store_id}" />')" class="img_del" type="button"></button>
								</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="16">조회 내역이 없습니다</td>
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
			

        
    