/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.setup.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : SampleDefaultVO.java
 * @Description : SampleDefaultVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class SetupDefaultVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;

	private String searchKeyword;
	private String view_type;
	private int no;
	private String check;
	private String check_no;
	private String auth_no;
	private String type;
	private String auth_type;
	private String store_id;
	private String passwd;
	private String ceo;
	private String phone_num;
	private String email;
	private String state;
	private String role_id;
	private String menu_id;
	private String created_id;
	private String updated_id;
	private String arr_check_id;
	private String ip;
	private String memo;
	private String use_yn;
	private String bank_code;
	private String bank_nm;

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;
	 
	
	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	public String getView_type() {
		return view_type;
	}


	public void setView_type(String view_type) {
		this.view_type = view_type;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getCheck() {
		return check;
	}


	public void setCheck(String check) {
		this.check = check;
	}


	public String getCheck_no() {
		return check_no;
	}


	public void setCheck_no(String check_no) {
		this.check_no = check_no;
	}


	public String getAuth_no() {
		return auth_no;
	}


	public void setAuth_no(String auth_no) {
		this.auth_no = auth_no;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getAuth_type() {
		return auth_type;
	}


	public void setAuth_type(String auth_type) {
		this.auth_type = auth_type;
	}


	public String getStore_id() {
		return store_id;
	}


	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getCeo() {
		return ceo;
	}


	public void setCeo(String ceo) {
		this.ceo = ceo;
	}


	public String getPhone_num() {
		return phone_num;
	}


	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getRole_id() {
		return role_id;
	}


	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}


	public String getMenu_id() {
		return menu_id;
	}


	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}


	public String getCreated_id() {
		return created_id;
	}


	public void setCreated_id(String created_id) {
		this.created_id = created_id;
	}


	public String getUpdated_id() {
		return updated_id;
	}


	public void setUpdated_id(String updated_id) {
		this.updated_id = updated_id;
	}


	public int getPageIndex() {
		return pageIndex;
	}


	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}


	public int getPageUnit() {
		return pageUnit;
	}


	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getFirstIndex() {
		return firstIndex;
	}


	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}


	public int getLastIndex() {
		return lastIndex;
	}


	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}


	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}


	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}


	public String getArr_check_id() {
		return arr_check_id;
	}


	public void setArr_check_id(String arr_check_id) {
		this.arr_check_id = arr_check_id;
	}

	public String getIp() {
		return ip;
	}


	public void setIp(String ip) {
		this.ip = ip;
	}


	public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	public String getUse_yn() {
		return use_yn;
	}


	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getBank_code() {
		return bank_code;
	}


	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}


	public String getBank_nm() {
		return bank_nm;
	}


	public void setBank_nm(String bank_nm) {
		this.bank_nm = bank_nm;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
