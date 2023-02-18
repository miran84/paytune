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
package egovframework.example.history.service;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
public class HistoryVO extends HistoryDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 아이디 */
	private String id;

	/** 이름 */
	private String name;

	/** 내용 */
	private String description;

	/** 사용여부 */
	private String useYn;

	/** 등록자 */
	private String regUser;

	private int rownum;
	private String no;
	private int tocnt;
	private String paymethod;
	private String cpid;
	private String cp_type;
	private String daoutrx;
	private String settdate;
	private String authno;
	private String amount;
	private String tip;
	private String tax;
	private String imei;
	private String terminalid;
	private String agentno;
	private String cardtype;
	private String allotmon;
	private String cardcode;
	private String cardname;
	private String buycode;
	private String cardno;
	private String canceldate;
	private String canceltype;
	private String amountMod;
	private String commission_total;
	private String commission;
	private String userid;
	private String authdate;
	private String username;
	private String userphone;
	private String email;
	private String quota;
	private String orderno;
	private String terminal_id;
	private String business_nm;
	private String business_nm2;
	private String business_nm3;
	private String errormessage;
	private String no_cpid;
	private String created_datetime;
	private String paymenttype;
	private String period;
	private String period2;
	private String period3;
	private String period4;
	
	private String d_amount;
	private String d_cancel_sum;
	private int d_total_cnt;
	private String d_approval_cnt;
	private String d_cancel_cnt;
	  
	private String cptype;
	private String period_date;
	private String period_date2;
	private String period_date3;
	private String cancel_amount;
	private String franchisee_commission;
	private String commission_cost;
	private String vat;
	private String vat2;
	private String vat3;
	private String settlement;
	private String settlement2;
	private String settlement3;
	private String store_id;
	private String bank_nm;
	private String productname;
	private String cancel_datetime;
	private String tax_state;
	
	private String total_cnt;
	private String total_approval_cnt;
	private String total_approval;
	private String total_cancel_cnt;
	private String total_cancel_sum;
	private String total_sum;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getRegUser() {
		return regUser;
	}

	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	public int getTocnt() {
		return tocnt;
	}

	public void setTocnt(int tocnt) {
		this.tocnt = tocnt;
	}

	public String getPaymethod() {
		return paymethod;
	}

	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}

	public String getCpid() {
		return cpid;
	}

	public void setCpid(String cpid) {
		this.cpid = cpid;
	}

	public String getCp_type() {
		return cp_type;
	}

	public void setCp_type(String cp_type) {
		this.cp_type = cp_type;
	}

	public String getDaoutrx() {
		return daoutrx;
	}

	public void setDaoutrx(String daoutrx) {
		this.daoutrx = daoutrx;
	}

	public String getSettdate() {
		return settdate;
	}

	public void setSettdate(String settdate) {
		this.settdate = settdate;
	}

	public String getAuthno() {
		return authno;
	}

	public void setAuthno(String authno) {
		this.authno = authno;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}

	public String getTerminalid() {
		return terminalid;
	}

	public void setTerminalid(String terminalid) {
		this.terminalid = terminalid;
	}

	public String getAgentno() {
		return agentno;
	}

	public void setAgentno(String agentno) {
		this.agentno = agentno;
	}

	public String getCardtype() {
		return cardtype;
	}

	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}

	public String getAllotmon() {
		return allotmon;
	}

	public void setAllotmon(String allotmon) {
		this.allotmon = allotmon;
	}

	public String getCardcode() {
		return cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getCardname() {
		return cardname;
	}

	public void setCardname(String cardname) {
		this.cardname = cardname;
	}

	public String getBuycode() {
		return buycode;
	}

	public void setBuycode(String buycode) {
		this.buycode = buycode;
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public String getCanceldate() {
		return canceldate;
	}

	public void setCanceldate(String canceldate) {
		this.canceldate = canceldate;
	}

	public String getCanceltype() {
		return canceltype;
	}

	public void setCanceltype(String canceltype) {
		this.canceltype = canceltype;
	}

	public String getAmountMod() {
		return amountMod;
	}

	public void setAmountMod(String amountMod) {
		this.amountMod = amountMod;
	}

	public String getCommission_total() {
		return commission_total;
	}

	public void setCommission_total(String commission_total) {
		this.commission_total = commission_total;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAuthdate() {
		return authdate;
	}

	public void setAuthdate(String authdate) {
		this.authdate = authdate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQuota() {
		return quota;
	}

	public void setQuota(String quota) {
		this.quota = quota;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getTerminal_id() {
		return terminal_id;
	}

	public void setTerminal_id(String terminal_id) {
		this.terminal_id = terminal_id;
	}

	public String getBusiness_nm() {
		return business_nm;
	}

	public void setBusiness_nm(String business_nm) {
		this.business_nm = business_nm;
	}

	public String getBusiness_nm2() {
		return business_nm2;
	}

	public void setBusiness_nm2(String business_nm2) {
		this.business_nm2 = business_nm2;
	}

	public String getBusiness_nm3() {
		return business_nm3;
	}

	public void setBusiness_nm3(String business_nm3) {
		this.business_nm3 = business_nm3;
	}

	public String getCommission() {
		return commission;
	}

	public void setCommission(String commission) {
		this.commission = commission;
	}

	public String getErrormessage() {
		return errormessage;
	}

	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}

	public String getNo_cpid() {
		return no_cpid;
	}

	public void setNo_cpid(String no_cpid) {
		this.no_cpid = no_cpid;
	}

	public String getCreated_datetime() {
		return created_datetime;
	}

	public void setCreated_datetime(String created_datetime) {
		this.created_datetime = created_datetime;
	}

	public String getPaymenttype() {
		return paymenttype;
	}

	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getPeriod2() {
		return period2;
	}

	public void setPeriod2(String period2) {
		this.period2 = period2;
	}

	public String getPeriod3() {
		return period3;
	}

	public void setPeriod3(String period3) {
		this.period3 = period3;
	}

	public String getPeriod4() {
		return period4;
	}

	public void setPeriod4(String period4) {
		this.period4 = period4;
	}

	public String getD_amount() {
		return d_amount;
	}

	public void setD_amount(String d_amount) {
		this.d_amount = d_amount;
	}

	public String getD_cancel_sum() {
		return d_cancel_sum;
	}

	public void setD_cancel_sum(String d_cancel_sum) {
		this.d_cancel_sum = d_cancel_sum;
	}

	public int getD_total_cnt() {
		return d_total_cnt;
	}

	public void setD_total_cnt(int d_total_cnt) {
		this.d_total_cnt = d_total_cnt;
	}

	public String getD_approval_cnt() {
		return d_approval_cnt;
	}

	public void setD_approval_cnt(String d_approval_cnt) {
		this.d_approval_cnt = d_approval_cnt;
	}

	public String getD_cancel_cnt() {
		return d_cancel_cnt;
	}

	public void setD_cancel_cnt(String d_cancel_cnt) {
		this.d_cancel_cnt = d_cancel_cnt;
	}

	public String getCptype() {
		return cptype;
	}

	public void setCptype(String cptype) {
		this.cptype = cptype;
	}

	public String getPeriod_date() {
		return period_date;
	}

	public void setPeriod_date(String period_date) {
		this.period_date = period_date;
	}

	public String getPeriod_date2() {
		return period_date2;
	}

	public void setPeriod_date2(String period_date2) {
		this.period_date2 = period_date2;
	}

	public String getPeriod_date3() {
		return period_date3;
	}

	public void setPeriod_date3(String period_date3) {
		this.period_date3 = period_date3;
	}

	public String getCancel_amount() {
		return cancel_amount;
	}

	public void setCancel_amount(String cancel_amount) {
		this.cancel_amount = cancel_amount;
	}

	public String getFranchisee_commission() {
		return franchisee_commission;
	}

	public void setFranchisee_commission(String franchisee_commission) {
		this.franchisee_commission = franchisee_commission;
	}

	public String getCommission_cost() {
		return commission_cost;
	}

	public void setCommission_cost(String commission_cost) {
		this.commission_cost = commission_cost;
	}

	public String getVat() {
		return vat;
	}

	public void setVat(String vat) {
		this.vat = vat;
	}

	public String getVat2() {
		return vat2;
	}

	public void setVat2(String vat2) {
		this.vat2 = vat2;
	}

	public String getVat3() {
		return vat3;
	}

	public void setVat3(String vat3) {
		this.vat3 = vat3;
	}

	public String getSettlement() {
		return settlement;
	}

	public void setSettlement(String settlement) {
		this.settlement = settlement;
	}

	public String getSettlement2() {
		return settlement2;
	}

	public void setSettlement2(String settlement2) {
		this.settlement2 = settlement2;
	}

	public String getSettlement3() {
		return settlement3;
	}

	public void setSettlement3(String settlement3) {
		this.settlement3 = settlement3;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getBank_nm() {
		return bank_nm;
	}

	public void setBank_nm(String bank_nm) {
		this.bank_nm = bank_nm;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getCancel_datetime() {
		return cancel_datetime;
	}

	public void setCancel_datetime(String cancel_datetime) {
		this.cancel_datetime = cancel_datetime;
	}

	public String getTax_state() {
		return tax_state;
	}

	public void setTax_state(String tax_state) {
		this.tax_state = tax_state;
	}

	public String getTotal_cnt() {
		return total_cnt;
	}

	public void setTotal_cnt(String total_cnt) {
		this.total_cnt = total_cnt;
	}

	public String getTotal_approval_cnt() {
		return total_approval_cnt;
	}

	public void setTotal_approval_cnt(String total_approval_cnt) {
		this.total_approval_cnt = total_approval_cnt;
	}

	public String getTotal_approval() {
		return total_approval;
	}

	public void setTotal_approval(String total_approval) {
		this.total_approval = total_approval;
	}

	public String getTotal_cancel_cnt() {
		return total_cancel_cnt;
	}

	public void setTotal_cancel_cnt(String total_cancel_cnt) {
		this.total_cancel_cnt = total_cancel_cnt;
	}

	public String getTotal_cancel_sum() {
		return total_cancel_sum;
	}

	public void setTotal_cancel_sum(String total_cancel_sum) {
		this.total_cancel_sum = total_cancel_sum;
	}

	public String getTotal_sum() {
		return total_sum;
	}

	public void setTotal_sum(String total_sum) {
		this.total_sum = total_sum;
	}

	
	
}
