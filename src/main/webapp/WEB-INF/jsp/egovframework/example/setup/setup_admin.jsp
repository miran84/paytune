<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	 <script>
	 	var view_type_s = '<c:out value="${view_type}" />';
	 </script>
	<script src="/js/setup_admin.js"></script>
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
				 <strong class="sub_ttl">운영자 계정관리</strong>
					<form class="form_layout" name="frm1" id="frm1" method="post" action=""	target="" onsubmit="return false;" >
						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">운영자 이름</label>
									</td>
									<td class="input_desc" colspan="7">
										 <input class="width_370" type="text" name="ceo" placeholder="" id="ceo" value="${searchSetupVO.ceo }" onkeyup="enterkey()">
									</td>
								</tr>
							</tbody>
						</table>

						<div class="btn_box">
							<a href="javascript:setup_admin_data();" class="a_btn a_btn_blue">검색</a>
						</div>
					</form>
				</div>
				 
				 <div class="col" id="setup_admin_data">
				</div>
			</div>
	
