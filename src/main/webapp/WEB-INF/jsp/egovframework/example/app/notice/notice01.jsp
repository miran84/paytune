<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>

<div id="nav">
    <div class="inner">
        <nav>
            <select onchange="window.open(value,'_self');" name="" id="">
            <c:forEach var="result" items="${sessionScope.SUBMENU2}" varStatus="status">
				<c:if test="${result.high_menu_id eq '6000'}">
					<c:choose>
						<c:when test="${result.menu_id eq '6001' and sessionScope.role_id eq '1001'}">
			                <option  value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" />(${sessionScope.CANCEL_NUM})</option>
						</c:when>
						<c:when test="${result.menu_id eq '6001' and sessionScope.role_id ne '1001'}">
			                <option  value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
						</c:when>
						
						<c:when test="${result.menu_id eq '6002'}">
			                <option selected value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
						</c:when>
						<c:when test="${result.menu_id eq '6003'}">
			                <option value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
						</c:when>
						<c:when test="${result.menu_id eq '6004'}">
			                <option value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
						</c:when>
						<c:when test="${result.menu_id eq '6005' and sessionScope.role_id eq '1001' || sessionScope.role_id eq '1004'}">
			                <option value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
						</c:when>
						<c:when test="${result.menu_id eq '6006' and sessionScope.role_id eq '1001' || sessionScope.role_id eq '1003'}">
			                <option value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
						</c:when>
						<c:when test="${result.menu_id eq '6007' and sessionScope.role_id eq '1001' || sessionScope.role_id eq '1002'}">
			                <option value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
						</c:when>
					</c:choose>
				</c:if>            
            </c:forEach>  
            </select>
        </nav>
    </div>
</div>

<script src="/app/js/notice01.js"></script>

<section class="notion_basic">
    <div class="inner">
        <div class="ttl">
            <h2 class="ttl_left">????????????</h2>
            <button onclick="location.href='javascript:void(0)'" class="ttl_right search_open_btn" type="button"><span>????????????</span></button>
        </div>
        
        <div class="notion_list_wrap">
            <div class="list_info">
                <span class="list_total">??? <strong><c:out value="${cnt}" /></strong>???</span>
                <span class="excel_down">??? ?????? ??????????????? PC????????? ???????????????.</span>
            </div>
            
	        <form name="frm2" id="frm2" action="" method="post">
            <c:forEach var="result" items="${resultList2}" varStatus="status">	
            <div class="notion_list">
                <ul>
                    <li class="notion_ttl" onclick="frmView('<c:out value="${result.no}" />')">
                        <span>[??????]</span>
                        <c:out value="${result.title}" />
                    </li>
                    <li class="notion_info">
                        <span>?????????</span>
                        <span><c:out value="${result.created_datetime}" /></span>
                    </li>
                </ul>
                <c:if test="${sessionScope.role_id eq '1001'}">
                <div class="notion_list_btn">
                    <button onclick="frmInfo('<c:out value="${result.no}" />')" class="more" type="button"><span>??????</span></button>
                    <button class="delete" onclick="frmDel('<c:out value="${result.no}" />')" type="button"><span>??????</span></button>
                </div>
   	            </c:if>
            </div>
            </c:forEach>
            <c:forEach var="result" items="${resultList}" varStatus="status">	
            <div class="notion_list">
                <ul>
                    <li class="notion_ttl" onclick="frmView('<c:out value="${result.no}" />')">
                        <c:out value="${result.title}" />
                    </li>
                    <li class="notion_info">
                        <span>?????????</span>
                        <span><c:out value="${result.created_datetime}" /></span>
                    </li>
                </ul>
                <c:if test="${sessionScope.role_id eq '1001'}">
                <div class="notion_list_btn">
                    <button onclick="frmInfo('<c:out value="${result.no}" />')" class="more" type="button"><span>??????</span></button>
                    <button class="delete" onclick="frmDel('<c:out value="${result.no}" />')" type="button"><span>??????</span></button>
                </div>
                </c:if>
            </div>
			</c:forEach>
			<input type="hidden" name="no" id="no" value="">
			<input type="hidden" name="view_type" id="view_type" value="">
			<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
			<input type="hidden" name="file_type" id="file_type" value="no1"/>
			<input type="hidden" name="file_check" id="file_check" value="F"/>
	        </form>
            
        </div>
        
        <c:if test="${sessionScope.role_id eq '1001'}">
        <div class="register_btn">
            <button onclick="frmAdd();" type="button">??? ??????</button>
        </div>
        </c:if>
        
    </div>
</section>

<section class="popup notion_search_popup">
    <div class="header">
        <div class="inner">
            <p>????????????</p>
            <button onclick="void(0);" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="notion_table_cont">
        <div class="inner">
            <form name="frm1" id="frm1" method="post" action=""	target="">
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>????????????</th>
                                <td>
                                    <div class="radio_box">
                                        <ul>
                                            <li>
                                                <input type="radio" id="total" name="check" value="total" checked>
                                                <label for="total">??????</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="title" name="check" value="title">
                                                <label for="title">??????</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="content" name="check" value="content">
                                                <label for="content">??????</label>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>?????????</th>
                                <td>
                                    <input type="text" name="searchKeyword" placeholder="" id="searchKeyword" value="<c:out value="${VO.searchKeyword}" />">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="search_btn">
                        <button onclick="notice01_data();" class="btn-active" type="button">??????</button>
                    </div>
                </fieldset>
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

<script>
    $(function(){
        // ???????????? ?????? ??????
        $('.search_open_btn').on('click',function(){
            $('.notion_search_popup').show();
        });
        // ?????? ??????
        $('.popup .close_btn').on('click',function(){
            $(this).parents('.popup').hide();
        });
        
        <c:if test="${!empty VO.check}">
        $('input:radio[name=check]:input[value="<c:out value='${VO.check}' />"]').attr("checked", true);
		</c:if>
    });
</script>

