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
	$("#myGnb").height($('#wrap').height() - 55);
});
</script>	

					<strong class="num_ttl">총 <c:out value="${cnt}" />개</strong>
					<div class="view_box fr">
						<button onclick="frmDel();" class="register_btn">삭제</button>
					</div>
					<form class="table_layout notice_layout" name="frm2" id="frm2" action="" method="post">
					
						<table>
							<caption>로그관리</caption>
							<thead>
								<tr>
									<th class="num">
		                                <div class="check_box">
		                                    <input type="checkbox" id="check_all">
		                                    <label for="check_all">No</label>
		                                </div>
		                            </th>
									<th class="store_id">상점ID</th>
									<th class="ip">IP</th>
									<th class="action">기능</th>
									<th class="url">URL</th>
									<th class="login">로그인</th>
									<th class="date">등록일자</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty resultList}">											
									<c:forEach var="result" items="${resultList}" varStatus="status">	
									<tr>
										<td class="num">
											<div class="check_box">
												<input type="checkbox" id="check_id_${status.count}" name="check_id" key="<c:out value="${result.no}" />">
												<label for="check_id_${status.count}" class="sub_txt02"></label> <span><c:out value="${result.rownum}" /></span>
											</div>
										</td>
				                        <td class="store_id" ><c:out value="${result.login_id}" /></td>
				                        <td class="ip" ><c:out value="${result.ip}" /></td>
				                        <td class="action" ><c:out value="${result.action}" /></td>
				                        <td class="url" ><c:out value="${result.url}" /></td>
				                        <td class="login" ><c:out value="${result.login}" /></td>
				                        <td class="date" ><c:out value="${result.created_datetime}" /></td>
									</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty resultList}">
									<tr>
										<td colspan="5">조회 내역이 없습니다</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<input type="hidden" name="no" id="no" value="">
						<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
                    </form>
                    <!-- pager -->
                    <div class="paging">
                        <ul class="pager_btn">
                        
                            <ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page"  />
                            
                        </ul>
                    </div>
					<!-- //pager -->




