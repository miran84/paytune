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
package egovframework.example.user.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.user.service.MailSendService;
import egovframework.example.user.service.SmsSendService;
import egovframework.example.user.service.UserService;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
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

@Controller
public class UserController {

	Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
    @Autowired
    private SmsSendService smsSendService;
    
    @Autowired
    private MailSendService mss;
    
	/** EgovSampleService */
	@Resource(name = "userService")
	private UserService userService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/user/login.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String login(HttpServletRequest request, Model model) throws IOException {
		
		model.addAttribute("LOGIN", 			request.getParameter("LOGIN"));
		return "user/login";
	}
	
	@RequestMapping(value = "/loginAction.do", method = RequestMethod.POST)
	public String loginAction(@RequestParam Map<String, String> params, HttpServletRequest request, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		session.setAttribute("SMS_CHECK",			"");
		session.setAttribute("EMAIL_CHECK",			"");
		
		String serverName = request.getServerName();
		params.put("domain", serverName);
		
		Map<String, String> loginAction = userService.loginAction(params);
		logger.debug("loginAction:"+loginAction);
		
		if(loginAction != null){
			boolean matchPw = passwordEncoder.matches(params.get("passwd"), loginAction.get("passwd"));
			logger.debug("matchPw:"+matchPw);
			if(matchPw) {
				params.put("store_id", loginAction.get("store_id"));
				params.put("role_id", loginAction.get("role_id"));
				
				session.setAttribute("sessionLoginAction",	loginAction);
				session.setAttribute("login_id",			loginAction.get("store_id"));
				session.setAttribute("role_id",				loginAction.get("role_id"));
				session.setAttribute("login_first",			loginAction.get("login_first"));
				session.setAttribute("SMS_USER",			userService.findSmsUser(params));
				session.setAttribute("EMAIL_USER",			userService.findEmailUser(params));
				session.setAttribute("LOGIN_CHECK",			"LOGIN_SUCCESS");
				model.addAttribute("LOGIN", 				"2");
			}else {
				session.setAttribute("LOGIN_CHECK",			"LOGIN_FALSE");
			}
		}else{
			session.setAttribute("LOGIN_CHECK",			"LOGIN_FALSE");
		}
		
		return "redirect:/user/login.do";
	}
	
	@RequestMapping(value = "/loginActionNo.do", method = RequestMethod.POST)
	public @ResponseBody String loginActionNo(@RequestParam Map<String, String> params, HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;

		String serverName = request.getServerName();
		logger.debug("serverName=="+serverName);
		params.put("domain", serverName);
		
		Map<String, String> loginAction = userService.loginAction(params);
		logger.debug("loginAction:"+loginAction);
		
		logger.debug("Encoder : "+passwordEncoder.encode(params.get("passwd")));
		
		if(loginAction != null){
			boolean matchPw = passwordEncoder.matches(params.get("passwd"), loginAction.get("passwd"));
			logger.debug("matchPw:"+matchPw);
			if(matchPw) {
				
				if(loginAction.get("login_first").equals("N")) {
					
					String store_id = loginAction.get("store_id");
					String role_id = loginAction.get("role_id");
					params.put("store_id", store_id);
					params.put("role_id", role_id);
					params.put("menu_type", "W");
					
					List<Map<String, String>> menu = null;
					List<Map<String, String>> subMenu = null;
					
					if(role_id.equals("1001")) {
						int admCnt = userService.findAdmCnt(params);
						if(admCnt > 0) {
							menu = userService.findAdmByMenu(params);
							subMenu = userService.findAdmBySubMenu(params);
							session.setAttribute("SUB_ADMIN", 	  "Y");
						}else {
							menu = userService.findUserByMenu(params);
							subMenu = userService.findUserBySubMenu(params);
						}
					}else {
						menu = userService.findUserByMenu(params);
						subMenu = userService.findUserBySubMenu(params);
					}
					
//				List<Map<String, String>> role = userService.findUserByRole(params);
					
					session.setAttribute("sessionLoginAction",	loginAction);
					session.setAttribute("login_id",			store_id);
					session.setAttribute("role_id",				role_id);
					session.setAttribute("SMS_USER",			userService.findSmsUser(params));
					session.setAttribute("EMAIL_USER",			userService.findEmailUser(params));
//					session.setAttribute("LOGIN_CHECK",			"LOGIN_SUCCESS");
					
					session.setAttribute("MENU",				menu);
					session.setAttribute("SUBMENU",				subMenu);
//				session.setAttribute("ROLE",				role);
					
//				String save_id = params.get("save_id");
//				
//				 로그인 유지를 선택할 경우 
//				if (save_id != null && save_id.equals("Y") && loginAction.get("session_key").equals("none")) { 
//					int amount = 60 * 60 * 24 * 365; // 7일
//					Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정 
//					userService.keepLogin(params.get("loginId"), session.getId(), sessionLimit); 
//					
//					Cookie loginCookie = new Cookie("loginCookie", session.getId()); 
//					loginCookie.setPath("/");
//					loginCookie.setMaxAge(60*60*24*365); 
//					// 전송
//					response.addCookie(loginCookie); 
//				}else if (save_id != null && save_id.equals("Y") && !loginAction.get("session_key").equals("none")) { 
//					
//					Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); 
//					
//					if (loginCookie == null) { 
//						int amount = 60 * 60 * 24 * 365; // 7일
//						Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정 
//						userService.keepLogin(params.get("loginId"), session.getId(), sessionLimit); 
//						
//						loginCookie = new Cookie("loginCookie", session.getId()); 
//						loginCookie.setPath("/");
//						loginCookie.setMaxAge(60*60*24*365); 
//						// 전송
//						response.addCookie(loginCookie); 
//					} 
//				}else if (save_id != null && save_id.equals("N") && !loginAction.get("session_key").equals("none")) { 
//					
//					Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); 
//					
//					if (loginCookie != null) { 
//						loginCookie.setPath("/");
//						loginCookie.setMaxAge(0); 
//						response.addCookie(loginCookie); 
//						userService.keepLogin(params.get("loginId"), "none", new Date());
//					} 
//				}
					
//				if(loginAction.get("login_first").equals("Y")) {
//					result = "/user/mypage_info.do";
//				}else {
					
//					for(int i=0; i<subMenu.size(); i++) {
//						if(subMenu.get(i).get("menu_id").equals("4001")) {
//							result = subMenu.get(i).get("menu_url");
//							session.setAttribute("MAIN",		result);
//						}
//					}	
//					logger.debug("result================="+result);
//					if(result == null || result.equals("")) {
//						result = subMenu.get(0).get("menu_url");
//						session.setAttribute("MAIN",		result);
//					}
					
					result = "/main/main.do";
					session.setAttribute("MAIN",		result);
//				}
					
				}else {
					result = "login_first";
				}
				
			}else {
				result = "false";
			}
		}else{
			result = "false";
		}
		
		return result;		
	}
	
	@RequestMapping(value = "/sesionRemove.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String sesionRemove(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException {
		
		session.invalidate(); 
		
		return "1";		
	}	
	
	@RequestMapping(value = "/sesionCheck.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String sesionCheck(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException {
		
		
		return "1";		
	}	
	
	@RequestMapping(value = "/smsEmailCheck.do", method = RequestMethod.POST)
	public @ResponseBody String smsEmailCheck(@RequestParam Map<String, String> params, HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		boolean checkResult = false;
		
		if(params.get("check").equals("1")) {
			String smsAuthKey = (String)session.getAttribute("smsAuthKey");
			if(params.get("auth_no").equals(smsAuthKey)) {
				checkResult = true;
			}
		}else {
			String mailAuthKey = (String)session.getAttribute("mailAuthKey");
			if(params.get("auth_no").equals(mailAuthKey)) {
				checkResult = true;
			}
			
		}
		
		
		if(checkResult){
			
			String login_id = (String)session.getAttribute("login_id");
			String role_id = (String)session.getAttribute("role_id");
			params.put("store_id", login_id);
			params.put("role_id", role_id);
			params.put("menu_type", "W");
			
			List<Map<String, String>> menu = null;
			List<Map<String, String>> subMenu = null;
			
			if(role_id.equals("1001")) {
				int admCnt = userService.findAdmCnt(params);
				if(admCnt > 0) {
					menu = userService.findAdmByMenu(params);
					subMenu = userService.findAdmBySubMenu(params);
					session.setAttribute("SUB_ADMIN", 	  "Y");
				}else {
					menu = userService.findUserByMenu(params);
					subMenu = userService.findUserBySubMenu(params);
				}
			}else {
				menu = userService.findUserByMenu(params);
				subMenu = userService.findUserBySubMenu(params);
			}
			
//			List<Map<String, String>> role = userService.findUserByRole(params);
			
			session.setAttribute("MENU",				menu);
			session.setAttribute("SUBMENU",				subMenu);
//			session.setAttribute("ROLE",				role);
			
//				Map<String, String> loginAction = (Map<String, String>) session.getAttribute("sessionLoginAction");
			
//			String save_id = params.get("save_id");
//			
//			// 로그인 유지를 선택할 경우 
//			if (save_id != null && save_id.equals("Y") && loginAction.get("session_key").equals("none")) { 
//				int amount = 60 * 60 * 24 * 365; // 7일
//				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정 
//				userService.keepLogin(login_id, session.getId(), sessionLimit); 
//				
//				Cookie loginCookie = new Cookie("loginCookie", session.getId()); 
//				loginCookie.setPath("/");
//				loginCookie.setMaxAge(60*60*24*365); 
//				// 전송
//				response.addCookie(loginCookie); 
//			}else if (save_id != null && save_id.equals("Y") && !loginAction.get("session_key").equals("none")) { 
//				
//				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); 
//				
//				if (loginCookie == null) { 
//					int amount = 60 * 60 * 24 * 365; // 7일
//					Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정 
//					userService.keepLogin(login_id, session.getId(), sessionLimit); 
//					
//					loginCookie = new Cookie("loginCookie", session.getId()); 
//					loginCookie.setPath("/");
//					loginCookie.setMaxAge(60*60*24*365); 
//					// 전송
//					response.addCookie(loginCookie); 
//				} 
//			}else if (save_id != null && save_id.equals("N") && !loginAction.get("session_key").equals("none")) { 
//				
//				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); 
//				
//				if (loginCookie != null) { 
//					loginCookie.setPath("/");
//					loginCookie.setMaxAge(0); 
//					response.addCookie(loginCookie); 
//					userService.keepLogin(login_id, "none", new Date());
//				} 
//			}
			
//			if(loginAction.get("login_first").equals("Y")) {
//				result = "/user/mypage_info.do";
//			}else {
//			for(int i=0; i<subMenu.size(); i++) {
//				if(subMenu.get(i).get("menu_id").equals("4001")) {
//					result = subMenu.get(i).get("menu_url");
//					session.setAttribute("MAIN",		result);
//				}
//			}	
//			
//			logger.debug("result================="+result);
//			if(result == null || result.equals("")) {
//				result = subMenu.get(0).get("menu_url");
//				session.setAttribute("MAIN",		result);
//			}
//			}
			
			result = "/main/main.do";
			session.setAttribute("MAIN",		result);
			
			String login_first = (String)session.getAttribute("login_first");
			if(login_first.equals("Y")) {
				result = "LOGIN_FIRST";
			}
			
		}else{
			result = "AUTH_FALSE";
		}
		
		
		return result;		
	}
	
	@RequestMapping(value = "/smsAction.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String smsAction(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		
		if(params.get("type").equals("1")) {
			
			String phone_num = params.get("check_no");
			result = smsSendService.sendAuthSms(phone_num);
			session.setAttribute("smsAuthKey",	result);
			session.setAttribute("PHONE_NUM",	phone_num);
			
		}else if(params.get("type").equals("2")) {
			
			String phone_num = (String)session.getAttribute("PHONE_NUM");
			
			if(phone_num != null) {
				result = smsSendService.sendAuthSms(phone_num);
				session.setAttribute("smsAuthKey",	result);
			}else {
				Map<String, String> loginAction = (Map<String, String>) session.getAttribute("sessionLoginAction");
				result = smsSendService.sendAuthSms(loginAction.get("phone_num"));
				session.setAttribute("smsAuthKey",	result);
			}
		}
		
		return "1";		
	}
	
	@RequestMapping(value = "/emailAction.do", method = RequestMethod.POST)
	public @ResponseBody String emailAction(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		
		if(params.get("type").equals("1")) {
			
			String email = params.get("check_no");
			result = mss.sendAuthMail(email);
			session.setAttribute("mailAuthKey",	result);
			session.setAttribute("EMAIL",	email);
			
		}else if(params.get("type").equals("2")) {
			
			String email = (String)session.getAttribute("EMAIL");
			
			if(email != null) {
				result = mss.sendAuthMail(email);
				session.setAttribute("mailAuthKey",	result);
			}else {
				Map<String, String> loginAction = (Map<String, String>) session.getAttribute("sessionLoginAction");
				result = mss.sendAuthMail(loginAction.get("email"));
				session.setAttribute("mailAuthKey",	result);
			}
		}
		
		return "2";		
	}
	
	@RequestMapping(value = "/smsAddCheck.do", method = RequestMethod.POST)
	public @ResponseBody String smsAddCheck(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		Map<String, String> loginAction = (Map<String, String>)session.getAttribute("sessionLoginAction");
		
		String account_num = params.get("account_num");
		String business_nm = params.get("business_nm");
		
		logger.info("account_num=="+account_num+", business_nm=="+business_nm);
		String account_num_len = loginAction.get("account_num").replaceAll("-", "");
		account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
		
		logger.info("account_num_len=="+account_num_len+", loginAction.business_nm=="+loginAction.get("business_nm"));
		
		if(account_num_len.equals(account_num) && loginAction.get("business_nm").equals(business_nm)) {
			String check_no = smsSendService.sendAuthSms(params.get("check_no"));
			session.setAttribute("smsAuthKey", check_no);
			result = "AUTH_SUCCESS";
		}else {
			result = "AUTH_FALSE";
		}
		
		logger.info("result=="+result);
		return result;		
	}
	
	@RequestMapping(value = "/smsAddCheck2.do", method = RequestMethod.POST)
	public @ResponseBody String smsAddCheck2(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		Map<String, String> loginAction = (Map<String, String>)session.getAttribute("sessionLoginAction");
		
		String account_num = params.get("account_num");
		String business_nm = params.get("business_nm");
		
		String account_num_len = loginAction.get("account_num").replaceAll("-", "");
		account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
		
		if(account_num_len.equals(account_num) && loginAction.get("business_nm").equals(business_nm)) {
			String smsAuthKey = (String)session.getAttribute("smsAuthKey");
			if(params.get("auth_no_1").equals(smsAuthKey)) {
				result = "AUTH_SUCCESS";
			}else {
				result = "AUTH_FALSE2";
			}
		}else {
			result = "AUTH_FALSE1";
		}
		return result;		
	}
	
	@RequestMapping(value = "/smsAdd.do", method = RequestMethod.POST)
	public String smsAdd(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		Map<String, String> loginAction = (Map<String, String>)session.getAttribute("sessionLoginAction");

		String account_num = params.get("account_num1");
		String business_nm = params.get("business_nm1");
		
		String account_num_len = loginAction.get("account_num").replaceAll("-", "");
		account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
		
		if(account_num_len.equals(account_num) && loginAction.get("business_nm").equals(business_nm)) {
			String smsAuthKey = (String)session.getAttribute("smsAuthKey");
			if(params.get("auth_no_1").equals(smsAuthKey)) {
				params.put("store_id", loginAction.get("store_id"));
				params.put("phone_num", params.get("check_no1"));
				userService.phoneAdd(params);
				session.setAttribute("SMS_USER",			userService.findSmsUser(params));
				session.setAttribute("SMS_CHECK",			"SMS_SUCCESS");
			}else {
				session.setAttribute("SMS_CHECK",			"SMS_FALSE1");
			}
			
		}else {
			session.setAttribute("SMS_CHECK",			"SMS_FALSE2");
		}
		
		return "redirect:/user/login.do";
	}
	
	@RequestMapping(value = "/emailAddCheck.do", method = RequestMethod.POST)
	public @ResponseBody String emailAddCheck(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		Map<String, String> loginAction = (Map<String, String>)session.getAttribute("sessionLoginAction");
		
		String account_num = params.get("account_num");
		String business_nm = params.get("business_nm");
		
		String account_num_len = loginAction.get("account_num").replaceAll("-", "");
		account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
		
		if(account_num_len.equals(account_num) && loginAction.get("business_nm").equals(business_nm)) {
			String check_no = mss.sendAuthMail(params.get("check_no"));
			session.setAttribute("mailAuthKey",	check_no);
			result = "AUTH_SUCCESS";
		}else {
			result = "AUTH_FALSE";
		}
		return result;	
	}
	
	@RequestMapping(value = "/emailAddCheck2.do", method = RequestMethod.POST)
	public @ResponseBody String emailAddCheck2(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		Map<String, String> loginAction = (Map<String, String>)session.getAttribute("sessionLoginAction");
		
		String account_num = params.get("account_num");
		String business_nm = params.get("business_nm");
		
		String account_num_len = loginAction.get("account_num").replaceAll("-", "");
		account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
		
		if(account_num_len.equals(account_num) && loginAction.get("business_nm").equals(business_nm)) {
			String mailAuthKey = (String)session.getAttribute("mailAuthKey");
			if(params.get("auth_no_2").equals(mailAuthKey)) {
				result = "AUTH_SUCCESS";
			}else {
				result = "AUTH_FALSE2";
			}
		}else {
			result = "AUTH_FALSE1";
		}
		
		return result;	
	}
	
	@RequestMapping(value = "/emailAdd.do", method = RequestMethod.POST)
	public String emailAdd(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		Map<String, String> loginAction = (Map<String, String>)session.getAttribute("sessionLoginAction");
		
		String account_num = params.get("account_num2");
		String business_nm = params.get("business_nm2");
		
		String account_num_len = loginAction.get("account_num").replaceAll("-", "");
		account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
		
		if(account_num_len.equals(account_num) && loginAction.get("business_nm").equals(business_nm)) {
			String mailAuthKey = (String)session.getAttribute("mailAuthKey");
			if(params.get("auth_no_2").equals(mailAuthKey)) {
				params.put("email", params.get("check_no2"));
				params.put("store_id", loginAction.get("store_id"));
				userService.emailAdd(params);
				session.setAttribute("EMAIL_USER",			userService.findEmailUser(params));
				session.setAttribute("EMAIL_CHECK",			"EMAIL_SUCCESS");
			}else {
				session.setAttribute("EMAIL_CHECK",			"EMAIL_FALSE1");
			}
		}else {
			session.setAttribute("EMAIL_CHECK",			"EMAIL_FALSE2");
		}
		
		return "redirect:/user/login.do";
	}
	
	@RequestMapping(value = "/idSearch.do", method = RequestMethod.POST)
	public @ResponseBody String idSearch(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		Map<String, String> idSearch = userService.idSearch(params);
		
		if(idSearch != null) {
			
			String account_num = params.get("account_num");
			
			String store_id = idSearch.get("store_id");
			String accountNum = idSearch.get("account_num");
			String account_num_len = accountNum.replaceAll("-", "");
			account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
			
			if(account_num.equals(account_num_len)) {
				result = store_id;
			}else {
				result = "ID_FALSE";
			}
			
		}else {
			result = "ID_FALSE";
		}
		return result;	
	}
	
	@RequestMapping(value = "/auth_send.do", method = RequestMethod.POST)
	public @ResponseBody String auth_send(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		boolean check = false;
		Map<String, String> pwSearch = userService.pwSearch(params);
		
		if(pwSearch != null) {
			
			String corp_type = params.get("corp_type");
			String auth_type = params.get("auth_type");
			String account_num = params.get("account_num").replaceAll("-", "");
			String ceo_birth = params.get("ceo_birth").replaceAll("-", "");
			
			String ceoBirth = pwSearch.get("ceo_birth");
			String corpRNum2 = pwSearch.get("corp_regist_num2");
			
			if(corp_type.equals("1") || corp_type.equals("3")) {
				if(ceo_birth.equals(ceoBirth)) {
					check = true;
				}
			}else {
				if(ceo_birth.equals(corpRNum2)) {
					check = true;
				}
				
			}
			
			String accountNum = pwSearch.get("account_num");
			String account_num_len = accountNum.replaceAll("-", "");
			account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
			
			if(account_num.equals(account_num_len) && check) {
				
				if(auth_type.equals("phone")) {
					String check_no = smsSendService.sendAuthSms(pwSearch.get("phone_num"));
					session.setAttribute("smsAuthKey", check_no);
					result = "INFO_SUCCESS";
				}else {
					String check_no = mss.sendAuthMail(pwSearch.get("email"));
					session.setAttribute("mailAuthKey",	check_no);
					result = "INFO_SUCCESS";
				}
				
			}else {
				result = "INFO_FALSE";
			}
			
		}else {
			result = "INFO_FALSE";
		}
		return result;	
	}
	
	@RequestMapping(value = "/auth_check.do", method = RequestMethod.POST)
	public @ResponseBody String auth_check(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		Map<String, String> pwSearch = userService.pwSearch(params);
		
		if(!pwSearch.isEmpty()) {
			
			String auth_type = params.get("auth_type");
			String account_num = params.get("account_num");
			
			String accountNum = pwSearch.get("account_num");
			String account_num_len = accountNum.replaceAll("-", "");
			account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
			
			if(account_num.equals(account_num_len)) {
				
				if(auth_type.equals("phone")) {
					String smsAuthKey = (String) session.getAttribute("smsAuthKey");
					if(params.get("auth_no").equals(smsAuthKey)) {
						result = "AUTH_SUCCESS";
					}else {
						result = "AUTH_FALSE";
					}
				}else {
					String mailAuthKey = (String) session.getAttribute("mailAuthKey");
					if(params.get("auth_no").equals(mailAuthKey)) {
						result = "AUTH_SUCCESS";
					}else {
						result = "AUTH_FALSE";
					}
				}
				
			}else {
				result = "INFO_FALSE";
			}
			
		}else {
			result = "INFO_FALSE";
		}
		return result;	
	}
	
	@RequestMapping(value = "/pwSearch.do", method = RequestMethod.POST)
	public @ResponseBody String pwSearch(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		Map<String, String> pwSearch = userService.pwSearch(params);
		
		if(!pwSearch.isEmpty()) {
			
			String auth_type = params.get("auth_type");
			String account_num = params.get("account_num");
			
			String accountNum = pwSearch.get("account_num");
			String account_num_len = accountNum.replaceAll("-", "");
			account_num_len = account_num_len.substring(account_num_len.length()-5, account_num_len.length());
			
			if(account_num.equals(account_num_len)) {
				
				if(auth_type.equals("phone")) {
					String smsAuthKey = (String) session.getAttribute("smsAuthKey");
					if(params.get("auth_no").equals(smsAuthKey)) {
						
						result = "AUTH_SUCCESS";
					}else {
						result = "AUTH_FALSE";
					}
				}else {
					String mailAuthKey = (String) session.getAttribute("mailAuthKey");
					if(params.get("auth_no").equals(mailAuthKey)) {
						
						result = "AUTH_SUCCESS";
					}else {
						result = "AUTH_FALSE";
					}
				}
				
			}else {
				result = "INFO_FALSE";
			}
			
		}else {
			result = "INFO_FALSE";
		}
		return result;	
	}
	
	@RequestMapping(value = "/authCheck.do", method = RequestMethod.POST)
	public @ResponseBody String authCheck(@RequestParam Map<String, String> params, HttpSession session, ModelMap model)
			throws IOException {
		
		String result = null;
		
		String auth_no = params.get("auth_no");
		String certify = params.get("certify");

		if(certify.equals("phone_num")) {
			String smsAuthKey = (String)session.getAttribute("smsAuthKey");
			if(auth_no.equals(smsAuthKey)) {
				result = "AUTH_SUCCESS";
			}else {
				result = "AUTH_FALSE";
			}
		}else if(certify.equals("email")) {
			String mailAuthKey = (String)session.getAttribute("mailAuthKey");
			if(auth_no.equals(mailAuthKey)) {
				result = "AUTH_SUCCESS";
			}else {
				result = "AUTH_FALSE";
			}			
		}
	
		return result;		
	}
	
	@RequestMapping(value = "/pwSearch2.do", method = RequestMethod.POST)
	public @ResponseBody String pwSearch2(@RequestParam Map<String, String> params, HttpServletRequest request, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
		
		if(params.get("type").equals("1")) {
			String passwd = passwordEncoder.encode(params.get("passwd"));
			params.put("passwd", passwd);
			userService.pwChange(params);
			result = "INFO_SUCCESS";
		}else {
			
			Map<String, String> loginAction = (Map<String, String>)session.getAttribute("sessionLoginAction");
			boolean matchPw = passwordEncoder.matches(params.get("passwd"), loginAction.get("passwd"));
			
			if(matchPw) {
				String passwd = passwordEncoder.encode(params.get("newpasswd"));
				params.put("passwd", passwd);
				params.put("store_id", loginAction.get("store_id"));
				userService.pwChange(params);
				
				String serverName = request.getServerName();
				params.put("domain", serverName);
				params.put("loginId", loginAction.get("store_id"));
				loginAction = userService.loginAction(params);
				session.setAttribute("sessionLoginAction",	loginAction);
				
				result = "INFO_SUCCESS";
			}else {
				result = "INFO_FALSE";
			}
		}
		
		return result;	
	}
	
	@RequestMapping(value = "/pwSearch3.do", method = RequestMethod.POST)
	public @ResponseBody String pwSearch3(@RequestParam Map<String, String> params, HttpServletRequest request, HttpSession session, ModelMap model)
			throws IOException, SQLException {
		
		String result = null;
			
		Map<String, String> loginAction = (Map<String, String>)session.getAttribute("sessionLoginAction");
		boolean matchPw = passwordEncoder.matches(params.get("passwd"), loginAction.get("passwd"));
		
		if(matchPw) {
			String passwd = passwordEncoder.encode(params.get("newpasswd"));
			params.put("passwd", passwd);
			params.put("store_id", loginAction.get("store_id"));
			params.put("login_first", params.get("login_first"));
			userService.pwChange(params);
			
			String serverName = request.getServerName();
			params.put("domain", serverName);
			params.put("loginId", loginAction.get("store_id"));
			loginAction = userService.loginAction(params);
			session.setAttribute("sessionLoginAction",	loginAction);
			
			result = (String)session.getAttribute("MAIN");
		}else {
			result = "INFO_FALSE";
		}
		
		return result;	
	}
	
	@RequestMapping(value = "/user/mypage_info.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String mypage_info(Model model) throws IOException {
		return "user/mypage_info";
	}
	
	@RequestMapping(value = "/user/mypageMod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String mypageMod(@RequestParam Map<String, String> params, HttpSession session, Model model) throws IOException, SQLException {
		
		String result = (String) session.getAttribute("MAIN");
		userService.myPageMod(params);
		
		params.put("loginId", (String)session.getAttribute("login_id"));
		Map<String, String> loginAction = userService.loginAction(params);
		session.setAttribute("sessionLoginAction",	loginAction);
		
		return "redirect:"+result;
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(@RequestParam Map<String, String> params, HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws IOException, SQLException {
		
		String login_id = (String)session.getAttribute("login_id");
		
		if (login_id != null) { 
			String userId = login_id;
			session.invalidate(); 
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); 
			
			if (loginCookie != null) { 
			    loginCookie.setPath("/");
				loginCookie.setMaxAge(0); 
				response.addCookie(loginCookie); 
				userService.keepLogin(userId, "none", new Date());
			} 
		}
			
		return "redirect:/user/login.do";
	}
	
	@RequestMapping(value = "/forward.do")
	public String forward(@RequestParam Map<String, String> params, HttpSession session, ModelMap model) throws IOException {
		
		model.addAttribute("msgCode", params.get("msgCode"));
		model.addAttribute("returnUrl", params.get("returnUrl"));
		
		session.invalidate();
		
		return "forward";
	}
	

//	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
//	public @ResponseBody String test(@RequestParam Map<String, String> params, HttpServletRequest request, HttpSession session, ModelMap model)
//			throws IOException, SQLException {
//		
//		String passwd = passwordEncoder.encode(request.getParameter("passwd"));
//		logger.debug("passwd="+passwd);
//		
//		return passwd;	
//	}	
}
