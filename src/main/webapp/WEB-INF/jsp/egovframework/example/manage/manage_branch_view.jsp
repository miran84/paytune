<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<script src="/js/manage_branch_view.js"></script>

			<div class="inner clearfix">
				<div class="col">
					<strong class="sub_ttl">대리점정보</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="" target="">
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="store_id" id="store_id" value="${manageVo.store_id }" />			
					<input type="hidden" name="role_id" id="role_id" value="1003" />		
						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
									<td class="input_desc" colspan="2">${manageVo.store_id }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">상호명</label></td>
									<td class="input_desc" colspan="4">${manageVo.business_nm }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자</label></td>
									<td class="input_desc" colspan="2">${manageVo.ceo }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자등록번호</label></td>
									<td class="input_desc" colspan="4">${manageVo.corp_regist_num }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자생년월일</label></td>
									<td class="input_desc" colspan="2">${manageVo.ceo_birth }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자구분</label></td>
									<td class="input_desc" colspan="4">
									${manageVo.corp_type eq 'A'?'개인':(manageVo.corp_type eq 'B'?'법인':'비영리 법인') }									
									${manageVo.corp_regist_num2 }
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">업태</label></td>
									<td class="input_desc" colspan="2">${manageVo.business_cond }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">업종</label></td>
									<td class="input_desc" colspan="4">${manageVo.industry_type }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">전화번호</label></td>
									<td class="input_desc" colspan="2">${manageVo.tel }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">FAX</label></td>
									<td class="input_desc" colspan="4">${manageVo.tel }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">휴대폰번호</label></td>
									<td class="input_desc" colspan="2">${manageVo.phone_num }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산계좌번호</label></td>
									<td class="input_desc" colspan="4">
									${manageVo.bank_nm }								
									${manageVo.account_num }
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
									<label class="" for="">Email 주소</label></td>
									<td class="input_desc" colspan="2">${manageVo.email }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">계약담당자</label></td>
									<td class="input_desc" colspan="4">
									${manageVo.person_nm1 }
									${manageVo.person_phone1 }
									${manageVo.person_email1 }
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">홈페이지 주소</label></td>
									<td class="input_desc" colspan="2">${manageVo.hompage }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산담당자</label></td>
									<td class="input_desc" colspan="4">
									${manageVo.person_nm2 }
									${manageVo.person_phone2 }
									${manageVo.person_email2 }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">계약일자</label></td>
									<td class="input_desc" colspan="2">${manageVo.contract_date }
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">기술담당자</label>
									</td>
									<td class="input_desc" colspan="4">
									${manageVo.person_nm3 }
									${manageVo.person_phone3 } 
									${manageVo.person_email3 }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 주소</label></td>
									<td class="input_desc" colspan="2">${manageVo.zip_code }
										${manageVo.address }
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 세부주소</label>
									</td>
									<td class="input_desc" colspan="4">
									${manageVo.detail_address }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">영업대행</label></td>
									<td class="input_desc" colspan="2">
									${manageVo.high_business_nm }								
									</td>										
									<td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
									<td class="input_desc" colspan="4">${manageVo.commission }%
									</td>
								</tr>
                                <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">지급상태</label></td>
									<td class="input_desc" colspan="2">${manageVo.tax eq 'Y'?'세금계산서':'원천징수'}
									</td>									
									<td class="input_ttl" colspan="1"><label class="" for="">상태구분</label></td>
									<td class="input_desc" colspan="4">${manageVo.state eq 'Y'?'사용':'중지'}
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">정산방식</label></td>
									<td class="input_desc" colspan="7">${manageVo.settlement_type eq 'G'?'일반정산':'직접정산'}
									</td>										
                                </tr>
							</tbody>
						</table>

						<div class="btn_box">
							<a href="/manage/manage_branch.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
							<a href="/manage/manage_branch.do" class="a_btn a_btn_default" >목록</a>
						</div>
					</form>
				</div>
			</div>


	<!-- //wrap -->




