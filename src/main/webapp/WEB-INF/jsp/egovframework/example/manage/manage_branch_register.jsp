<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   

<script>
 <c:if test="${sessionScope.role_id eq '1001'}">
	getOption('#high_store_id', 'high_store_id', 'N', '');
 </c:if>
</script>
<script src="/js/manage_branch_register.js"></script>
<!-- container -->

			<div class="inner clearfix">
				<div class="col">
					<strong class="sub_ttl">대리점정보</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="passwd" id="passwd" value="1111" />
					<input type="hidden" name="role_id" id="role_id" value="1003" />
					<input type="hidden" name="period" id="period" value="30" />
						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="store_id" placeholder="" id="store_id"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">상호명</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="business_nm" placeholder="" id="business_nm"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo" placeholder="" id="ceo"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자등록번호</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="corp_regist_num" placeholder="000-00-00000" id="corp_regist_num" maxlength="12"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자생년월일</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo_birth" id="ceo_birth" placeholder="yyyy-mm-dd" maxlength="10"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자구분</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_ss" name="corp_type" placeholder="" id="corp_type">
											<option value="A">개인</option>
											<option value="B">법인</option>
											<option value="C">비영리 법인</option>
									</select>									
									<input class="width_s" type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">업태</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="business_cond" placeholder="" id="business_cond"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">업종</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="industry_type" placeholder="" id="industry_type"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">전화번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="tel" name="tel" id="tel" maxlength="20"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">FAX</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="tel" name="fax" id="fax" maxlength="20"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">휴대폰번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="phone_num" id="phone_num" maxlength="13"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산계좌번호</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_s" name="bank_code" placeholder="" id="bank_code">
									</select>									
									<input class="width_s" type="text" name="account_num" placeholder="" id="account_num">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
									<label class="" for="">Email 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="email" name="email" id="email" maxlength="50"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">계약담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" placeholder="이름" name="person_nm1" id="person_nm1"> 
									<input class="width_s" type="tel" placeholder="연락처" name="person_phone1" id="person_phone1" maxlength="13"> 
									<input class="width_s" type="text" placeholder="이메일" name="person_email1" id="person_email1" maxlength="50">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">홈페이지 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_380" type="text" name="hompage" placeholder="" id="hompage" maxlength="100" value="http://"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" placeholder="이름" name="person_nm2" id="person_nm2"> 
									<input class="width_s" type="tel" placeholder="연락처" name="person_phone2" id="person_phone2" maxlength="13"> 
									<input class="width_s" type="text" placeholder="이메일" name="person_email2" id="person_email2" maxlength="50"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">계약일자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="contract_date" placeholder="yyyy-mm-dd" id="contract_date" maxlength="10">
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">기술담당자</label>
									</td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" placeholder="이름" name="person_nm3" id="person_nm3"> 
									<input class="width_s" type="tel" placeholder="연락처" name="person_phone3" id="person_phone3" maxlength="13"> 
									<input class="width_s" type="text" placeholder="이메일" name="person_email3" id="person_email3" maxlength="50"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_80" type="text" name="zip_code" placeholder="" id="zip_code" readonly="readonly">
										<button class="btn_search" type="button" onclick="jsDaumPostcode();" style="margin: 0 7px;">
											<img src="../img/btn/btn_search.png"  alt="찾기">
										</button> 
										<input class="width_240" type="text" name="address" placeholder="" id="address" >
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 세부주소</label>
									</td>
									<td class="input_desc" colspan="4">
									<input class="width_380" type="text" name="detail_address" placeholder="" id="detail_address"></td>
								</tr>
								<tr class="input_box input_box_border">
									<!-- <td class="input_ttl" colspan="1"><label class="" for="">터미널ID</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="terminal_id" placeholder="" id="terminal_id" >
									</td> -->
									<td class="input_ttl" colspan="1"><label class="" for="">${sessionScope.role_id eq '1001'?'영업대행':''}</label></td>
									<td class="input_desc" colspan="2">
									<c:choose>
									 <c:when test="${sessionScope.role_id eq '1001'}">
										<select class="width_s" name="high_store_id" placeholder="" id="high_store_id">
										</select>									
									 </c:when>
									 <c:otherwise>
										  <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.login_id}" />
									 </c:otherwise>
									</c:choose>									
									</td>									
                                    <td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
                                    <td class="input_desc" colspan="4">
                                        <input class="width_s" type="number" name="commission" id="commission">%
                                    </td>
								</tr>
                                <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">지급상태</label></td>
									<td class="input_desc" colspan="2">
                                        <select class="width_s" name="tax" id="tax">
											<option value="Y">세금계산서</option>
											<option value="N">원천징수</option>
									    </select>
									</td>									
                                    <td class="input_ttl" colspan="1"><label class="" for="">상태구분</label></td>
                                    <td class="input_desc" colspan="4">
                                    <select class="width_ss" name="state" placeholder="" id="state">
                                            <option value="Y">사용</option>
                                            <option value="N">중지</option>
                                    </select>
                                    </td>
								</tr>
								<tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1"><label for="">정산방식</label></td>
                                    <td class="input_desc" colspan="7">
                                        <select name="settlement_type" id="settlement_type" class="width_s">
                                            <option value="G">일반정산</option>
                                            <option value="D">직접정산</option>
                                        </select>
                                    </td>
								</tr>								
							</tbody>
						</table>

						<div class="btn_box">
							<a href="/manage/manage_branch.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
							<a href="javascript:fnSubmit();" id="frmAdd" class="a_btn a_btn_blue">등록하기</a> <a href="/manage/manage_branch.do" class="a_btn a_btn_default" >목록</a>
						</div>
					</form>
				</div>
			</div>


	<!-- //wrap -->


