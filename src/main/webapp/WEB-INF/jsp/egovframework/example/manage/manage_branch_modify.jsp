<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<script src="/js/manage_branch_modify.js"></script>
    <script>
	    getOption('#bank_code', 'bank', 'N', '${manageVo.bank_code }');
	    getOption('#high_store_id', 'high_store_id', 'N', '${manageVo.high_store_id }');
    </script>

			<div class="inner clearfix">
				<div class="col">
					<strong class="sub_ttl">대리점정보</strong>
					<form class="form_layout" name="frm" id="frm" method="POST" action="" target="" enctype="multipart/form-data">
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="store_id" id="store_id" value="${manageVo.store_id }" />			
					<input type="hidden" name="role_id" id="role_id" value="1003" />	
					<input type="hidden" name="period" id="period" value="30" />	
						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="" placeholder="uwal" id="" value="${manageVo.store_id }" disabled></td>
									<td class="input_ttl" colspan="1"><label class="" for="">상호명</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="business_nm" placeholder="유월커뮤니케이션" id="business_nm" value="${manageVo.business_nm }" disabled></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo" placeholder="김평진" id="ceo" value="${manageVo.ceo }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자등록번호</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="corp_regist_num" placeholder="107-87-86839" id="corp_regist_num" value="${manageVo.corp_regist_num }" disabled maxlength="12"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자생년월일</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo_birth" placeholder="1981.12.09" id="ceo_birth" value="${manageVo.ceo_birth }" maxlength="10"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자구분</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_ss" name="corp_type" placeholder="" id="corp_type" disabled>
											<option value="A" ${manageVo.corp_type eq 'A' ?'selected':''}>개인</option>
											<option value="B" ${manageVo.corp_type eq 'B' ?'selected':''}>법인</option>
											<option value="C" ${manageVo.corp_type eq 'C' ?'selected':''}>비영리 법인</option>
									</select>				
									<c:if test="${!empty manageVo.corp_regist_num2}">
									<input class="width_s" type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2" value="${manageVo.corp_regist_num2 }" disabled>
									</c:if>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">업태</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="business_cond" placeholder="서비스" id="business_cond" value="${manageVo.business_cond }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">업종</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="industry_type" placeholder="온라인정보제공업" id="industry_type" value="${manageVo.industry_type }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">전화번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="tel" name="tel" placeholder="02-0000-0000" id="tel" value="${manageVo.tel }" maxlength="20"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">FAX</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="tel" name="fax" placeholder="02-0000-0000" id="fax" value="${manageVo.fax }" maxlength="20"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">휴대폰번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="phone_num" placeholder="010-0000-0000" id="phone_num" value="${manageVo.phone_num }" maxlength="13"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산계좌번호</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_s" name="bank_code" placeholder="" id="bank_code" ${sessionScope.role_id eq '1001'?'':'disabled' }>
									</select>									
									<input class="width_s" type="text" name="account_num" placeholder="000-000-000000" id="account_num" value="${manageVo.account_num }" ${sessionScope.role_id eq '1001'?'':'disabled' }>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
									<label class="" for="">Email 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="email" name="email" placeholder="text@test.com" id="email" value="${manageVo.email }" maxlength="50"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">계약담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" name="person_nm1" placeholder="홍길동" id="person_nm1" value="${manageVo.person_nm1 }"> 
									<input class="width_s" type="tel" name="person_phone1" placeholder="010-0000-0000" id="person_phone1" value="${manageVo.person_phone1 }" maxlength="13"> 
									<input class="width_s" type="text" name="person_email1" placeholder="test@test.com" id="person_email1" value="${manageVo.person_email1 }" maxlength="50">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">홈페이지 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_380" type="text" name="hompage" placeholder="" id="hompage" value="${manageVo.hompage }" maxlength="100"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" name="person_nm2" placeholder="홍길동" id="person_nm2" value="${manageVo.person_nm2 }"> 
									<input class="width_s" type="tel" name="person_phone2" placeholder="010-0000-0000" id="person_phone2" value="${manageVo.person_phone2 }" maxlength="13"> 
									<input class="width_s" type="text" name="person_email2" placeholder="test@test.com" id="person_email2" value="${manageVo.person_email2 }" maxlength="50"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">계약일자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="contract_date" placeholder="2020.10.05" id="contract_date" value="${manageVo.contract_date }" disabled maxlength="10">
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">기술담당자</label>
									</td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" name="person_nm3" placeholder="홍길동" id="person_nm3" value="${manageVo.person_nm3 }"> 
									<input class="width_s" type="tel" name="person_phone3" placeholder="010-0000-0000" id="person_phone3" value="${manageVo.person_phone3 }" maxlength="13"> 
									<input class="width_s" type="text" name="person_email3" placeholder="test@test.com" id="person_email3" value="${manageVo.person_email3 }" maxlength="50"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_80" type="text" name="zip_code" placeholder="" id="zip_code" value="${manageVo.zip_code }" readonly="readonly">
										<button class="btn_search" type="button" onclick="jsDaumPostcode();" style="margin: 0 7px;">
											<img src="../img/btn/btn_search.png"  alt="찾기">
										</button> 
										<input class="width_240" type="text" name="address" placeholder="" id="address" value="${manageVo.address }" >
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 세부주소</label>
									</td>
									<td class="input_desc" colspan="4">
									<input class="width_380" type="text" name="detail_address" placeholder="" id="detail_address" value="${manageVo.detail_address }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<!-- <td class="input_ttl" colspan="1"><label class="" for="">터미널ID</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="terminal_id" placeholder="" id="terminal_id" value="${manageVo.terminal_id }">
									</td> -->
									<td class="input_ttl" colspan="1"><label class="" for="">영업대행</label></td>
									<td class="input_desc" colspan="2">
									<select class="width_s" name="high_store_id" placeholder="" id="high_store_id" disabled>
									</select>									
									</td>										
                                    <td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
                                    <td class="input_desc" colspan="4">
                                        <input class="width_s" type="number" name="commission"  id="commission" value="${manageVo.commission }" ${sessionScope.role_id eq '1001'?'':'disabled' }>%
                                    </td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">지급상태</label></td>
									<td class="input_desc" colspan="2">
                                        <select class="width_s" name="tax"  id="tax" ${sessionScope.role_id eq '1001'?'':'disabled' }>
											<option value="Y" ${manageVo.tax eq 'Y'?'selected':''}>세금계산서</option>
											<option value="N" ${manageVo.tax eq 'N'?'selected':''}>원천징수</option>
									    </select>
									</td>									
                                    <td class="input_ttl" colspan="1"><label class="" for="">상태구분</label></td>
                                    <td class="input_desc" colspan="4">
                                    <select class="width_ss" name="state" placeholder="" id="state" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                            <option value="Y" ${manageVo.state eq 'Y'?'selected':''}>사용</option>
                                            <option value="N" ${manageVo.state eq 'N'?'selected':''}>중지</option>
                                    </select>									
                                    </td>
								</tr>
								<tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1"><label for="">정산방식</label></td>
                                    <td class="input_desc" colspan="7">
                                        <select name="settlement_type" id="settlement_type" class="width_s">
                                            <option value="G" ${manageVo.settlement_type eq 'G'?'selected':''}>일반정산</option>
                                            <option value="D" ${manageVo.settlement_type eq 'D'?'selected':''}>직접정산</option>
                                        </select>
                                    </td>
								</tr>	
								<tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1"><label for="">패스워드 수정</label></td>
                                    <td class="input_desc" colspan="7">
                                     	<span>패스워드</span>
                                        <input class="width_s" type="password" name="passwd" placeholder="" id="passwd" value="">
                                        <span>/</span>
                                        <span>패스워드</span>
                                        <input class="width_s" type="password" name="repasswd" placeholder="" id="repasswd" value="">
                                    </td>								
								</tr>ad
							</tbody>
						</table>

						<div class="btn_box">
							<a href="/manage/manage_branch.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
							<a href="javascript:fnSubmit();" id="frmMod" class="a_btn a_btn_blue">수정하기</a> <a href="/manage/manage_branch.do"
								class="a_btn a_btn_default" >목록</a>
						</div>
					</form>
				</div>
			</div>


	<!-- //wrap -->




