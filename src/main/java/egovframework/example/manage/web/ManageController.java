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
package egovframework.example.manage.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.manage.service.ManageDefaultVO;
import egovframework.example.manage.service.ManageService;
import egovframework.example.manage.service.ManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  ?????????      ?????????              ????????????
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           ????????????
 *
 * @author ????????????????????? ???????????? ?????????
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class ManageController {

	Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	/** EgovSampleService */
	@Resource(name = "manageService")
	private ManageService manageService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/manage/manage_all.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_all(ManageDefaultVO searchManageVO, HttpSession session, Model model) throws IOException {
		
		model.addAttribute("view_type", searchManageVO.getView_type());
		
		if(searchManageVO.getView_type() != null && searchManageVO.getView_type().equals("L")) {
			searchManageVO = (ManageDefaultVO) session.getAttribute("searchManageVO");
			model.addAttribute("searchManageVO", searchManageVO);
		}else {
			session.setAttribute("searchManageVO",	searchManageVO);
		}
		
		return "manage/manage_all";
	}
	
	@RequestMapping(value = "/manage/manage_all_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_all_data(ManageDefaultVO searchManageVO, HttpSession session, Model model) throws IOException, SQLException {
		
		if(searchManageVO.getView_type().equals("L")) {

			searchManageVO = (ManageDefaultVO) session.getAttribute("searchManageVO");

			/** EgovPropertyService.sample */
			searchManageVO.setPageUnit(searchManageVO.getPageUnit());
			searchManageVO.setPageSize(propertiesService.getInt("pageSize"));
			
			/** pageing setting */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchManageVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchManageVO.getPageUnit());
			paginationInfo.setPageSize(searchManageVO.getPageSize());
			
			searchManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
			
			List<ManageVO> selectManageList = manageService.selectManageList(searchManageVO);
			int cnt = manageService.selectManageListToCnt(searchManageVO);
			
			paginationInfo.setTotalRecordCount(cnt);
			
			model.addAttribute("resultList", selectManageList);
			model.addAttribute("cnt", cnt);
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("pageUnit", searchManageVO.getPageUnit());
		}else {

			/** EgovPropertyService.sample */
			searchManageVO.setPageUnit(searchManageVO.getPageUnit());
			searchManageVO.setPageSize(propertiesService.getInt("pageSize"));
			
			/** pageing setting */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchManageVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchManageVO.getPageUnit());
			paginationInfo.setPageSize(searchManageVO.getPageSize());
			
			searchManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
			
			List<ManageVO> selectManageList = manageService.selectManageList(searchManageVO);
			int cnt = manageService.selectManageListToCnt(searchManageVO);
			
			paginationInfo.setTotalRecordCount(cnt);
			
			model.addAttribute("resultList", selectManageList);
			model.addAttribute("cnt", cnt);
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("pageUnit", searchManageVO.getPageUnit());
		}
		

		session.setAttribute("searchManageVO",	searchManageVO);
		
		return "manage/data/manage_all_data";
	}
	
	
	@RequestMapping(value = "/manage/manage_all_register.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_all_register(Model model) throws IOException {
		return "manage/manage_all_register";
	}
	
	@RequestMapping(value = "/manage/manageAdd.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manageAdd(ManageVO vo, Model model) throws IOException, SQLException {
		
		vo.setPasswd(passwordEncoder.encode(vo.getPasswd()));
		manageService.manageAdd(vo);
		String url = "";
		if(vo.getRole_id().equals("1002")) {
			url = "redirect:/manage/manage_all.do";
		}else if(vo.getRole_id().equals("1003")) {
			url = "redirect:/manage/manage_branch.do";
		}		
		return url;
	}
	
	@RequestMapping(value = "/manage/manage_all_modify.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_all_modify(ManageVO vo, Model model) throws IOException, SQLException {
		
		ManageVO manageVo = manageService.selectManageInfo(vo);
		model.addAttribute("manageVo", manageVo);
		return "manage/manage_all_modify";
	}
	
	@RequestMapping(value = "/manage/manage_all_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_all_view(ManageVO vo, Model model) throws IOException, SQLException {
		
		ManageVO manageVo = manageService.selectManageInfo(vo);
		model.addAttribute("manageVo", manageVo);
		return "manage/manage_all_view";
	}
	
	@RequestMapping(value = "/manage/manage_all_excel.do")
	public void manage_all_excel(ManageDefaultVO searchManageVO, HttpServletResponse response, HttpSession session, Model model) throws IOException, SQLException {
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("Sheet1");
		HSSFRow row = sheet.createRow((short) 0);

		sheet.setColumnWidth(0, 1500);
      	sheet.setColumnWidth(1, 3500);
      	sheet.setColumnWidth(2, 3500);
      	sheet.setColumnWidth(3, 3500);
      	sheet.setColumnWidth(4, 3500);
      	sheet.setColumnWidth(5, 3500);
      	sheet.setColumnWidth(6, 3500);
      	sheet.setColumnWidth(7, 3500);
      	sheet.setColumnWidth(8, 3500);
      	sheet.setColumnWidth(9, 3500);
      	sheet.setColumnWidth(10, 3500);
        sheet.setColumnWidth(11, 3500);
        sheet.setColumnWidth(12, 3500);
        
		HSSFFont font = wb.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);

		HSSFCellStyle titlestyle = wb.createCellStyle();
		titlestyle.setFont(font);

		HSSFCell cell = row.createCell(0);
		cell.setCellValue("??????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(1);
		cell.setCellValue("???????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(2);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(3);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(4);
		cell.setCellValue("???????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(5);
		cell.setCellValue("?????????ID");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(6);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(7);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(8);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(9);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(10);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(11);
		cell.setCellValue("??????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(12);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		HSSFCellStyle style = wb.createCellStyle();
		style.setFont(font);

		searchManageVO.setList(searchManageVO.getArr_check_id().split(","));
		
		List<ManageVO> selectManageList = manageService.selectManageListExcel(searchManageVO);
		
		int i = 0;
		for (ManageVO manageVO : selectManageList) {
			
			row = sheet.createRow((short) (i + 1));
			
			cell = row.createCell(0);
			cell.setCellValue(i+1);
			cell.setCellStyle(style);
			
			cell = row.createCell(1);
			cell.setCellValue(manageVO.getStore_id());
			cell.setCellStyle(style);
			
			cell = row.createCell(2);
			cell.setCellValue(manageVO.getBusiness_nm());
			cell.setCellStyle(style);
			
			cell = row.createCell(3);
			cell.setCellValue(manageVO.getContract_date());
			cell.setCellStyle(style);
			
			cell = row.createCell(4);
			cell.setCellValue(manageVO.getCorp_regist_num());
			cell.setCellStyle(style);
			
			cell = row.createCell(5);
			cell.setCellValue(manageVO.getTerminal_id());
			cell.setCellStyle(style);
			
			cell = row.createCell(6);
			cell.setCellValue("??????");
			cell.setCellStyle(style);
			
			cell = row.createCell(7);
			cell.setCellValue(manageVO.getTel());
			cell.setCellStyle(style);
			
			cell = row.createCell(8);
			cell.setCellValue(manageVO.getPerson_nm1());
			cell.setCellStyle(style);
			
			cell = row.createCell(9);
			cell.setCellValue(manageVO.getEmail());
			cell.setCellStyle(style);
			
			cell = row.createCell(10);
			cell.setCellValue(manageVO.getPhone_num());
			cell.setCellStyle(style);
			
			cell = row.createCell(11);
			cell.setCellValue((manageVO.getState() != null && manageVO.getState().equals("Y"))?"?????????":"?????????");
			cell.setCellStyle(style);
			
			cell = row.createCell(12);
			cell.setCellValue((manageVO.getTax() != null && manageVO.getTax().equals("Y"))?"???????????????":"????????????");
			cell.setCellStyle(style);
			
			i++;
		}

		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(date);
		cal.get(Calendar.YEAR);
		String name = "output.xls";

		File file = new File(propertiesService.getString("Globals.tmp"), name);

		FileOutputStream fileOutputStream = new FileOutputStream(file);

		wb.write(fileOutputStream);

		byte b[] = new byte[(int) file.length()];

		response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xls");
		response.setHeader("Content-Length", String.valueOf(file.length()));
		
		FileInputStream fis = null;
		BufferedInputStream fin = null;
		
		try {
			if (file.isFile()) {
				
				fis = new FileInputStream(file);
				fin = new BufferedInputStream(fis);
				BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
				int read = 0;
				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
			}
			
			if(file.exists()) file.delete();
			
		} catch (FileNotFoundException e) {
			
			logger.debug("manage_all_excel Exception : "+e);
		} catch (IOException e) {
			
			logger.debug("manage_all_excel Exception : "+e);
		} finally {
            try {
                if (fileOutputStream != null)
                	fileOutputStream.close();
                
                if (fin != null)
                	fin.close();
                
                if (fis != null)
                	fis.close();
            } catch (IOException ex) {
                System.err.format("IOException: %s%n", ex);
            }
        }
	}
	
	@RequestMapping(value = "/manage/manageMod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manageMod(ManageVO vo, Model model) throws IOException, SQLException {
		
		if(vo.getPasswd()!=null &&  !"".equals(vo.getPasswd())) vo.setPasswd(passwordEncoder.encode(vo.getPasswd()));
		
		manageService.manageMod(vo);
		
		String url = "";
		if(vo.getRole_id().equals("1002")) {
			url = "redirect:/manage/manage_all.do";
		}else if(vo.getRole_id().equals("1003")) {
			url = "redirect:/manage/manage_branch.do";
		}		
		return url;
	}
	
	@RequestMapping(value = "/manage/manageDel.do", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Object manageDel(ManageVO vo, Model model) throws IOException, SQLException {
		
		Object result=null;
		result = manageService.manageDel(vo);
		
		return result;
	}
	
	@RequestMapping(value = "/manage/manage_branch.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_branch(ManageDefaultVO searchManageVO, HttpSession session, Model model) throws IOException, SQLException {
		
		model.addAttribute("view_type", searchManageVO.getView_type());
		
		if(searchManageVO.getView_type() != null && searchManageVO.getView_type().equals("L")) {
			searchManageVO = (ManageDefaultVO) session.getAttribute("searchManageVO");
			model.addAttribute("searchManageVO", searchManageVO);
		}else {
			session.setAttribute("searchManageVO",	searchManageVO);
		}
		
		return "manage/manage_branch";
	}
	
	@RequestMapping(value = "/manage/manage_branch_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_branch_data(ManageDefaultVO searchManageVO, HttpSession session, Model model) throws IOException, SQLException {
		
		if(searchManageVO.getView_type().equals("L")) {

			searchManageVO = (ManageDefaultVO) session.getAttribute("searchManageVO");
			/** EgovPropertyService.sample */
			searchManageVO.setPageUnit(searchManageVO.getPageUnit());
			searchManageVO.setPageSize(propertiesService.getInt("pageSize"));
			
			/** pageing setting */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchManageVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchManageVO.getPageUnit());
			paginationInfo.setPageSize(searchManageVO.getPageSize());
			
			searchManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
			
			List<ManageVO> selectManageList2 = manageService.selectManageList2(searchManageVO);
			int cnt2 = manageService.selectManageListToCnt2(searchManageVO);
			
			paginationInfo.setTotalRecordCount(cnt2);
			
			model.addAttribute("resultList", selectManageList2);
			model.addAttribute("cnt", cnt2);
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("pageUnit", searchManageVO.getPageUnit());

		}else {

			/** EgovPropertyService.sample */
			searchManageVO.setPageUnit(searchManageVO.getPageUnit());
			searchManageVO.setPageSize(propertiesService.getInt("pageSize"));
			
			/** pageing setting */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchManageVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchManageVO.getPageUnit());
			paginationInfo.setPageSize(searchManageVO.getPageSize());
			
			searchManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());		
			
			List<ManageVO> selectManageList2 = manageService.selectManageList2(searchManageVO);
			int cnt2 = manageService.selectManageListToCnt2(searchManageVO);
			
			paginationInfo.setTotalRecordCount(cnt2);
			
			model.addAttribute("resultList", selectManageList2);
			model.addAttribute("cnt", cnt2);
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("pageUnit", searchManageVO.getPageUnit());
		}
		
		
		session.setAttribute("searchManageVO",	searchManageVO);
		
		return "manage/data/manage_branch_data";
	}
	
	@RequestMapping(value = "/manage/manage_branch_register.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_branch_register(Model model) throws IOException {
		return "manage/manage_branch_register";
	}
	
	@RequestMapping(value = "/manage/manage_branch_modify.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_branch_modify(ManageVO vo, Model model) throws IOException, SQLException {
		
		ManageVO manageVo = manageService.selectManageInfo(vo);
		model.addAttribute("manageVo", manageVo);
		
		return "manage/manage_branch_modify";
	}
	
	@RequestMapping(value = "/manage/manage_branch_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manage_branch_view(ManageVO vo, Model model) throws IOException, SQLException {
		
		ManageVO manageVo = manageService.selectManageInfo(vo);
		model.addAttribute("manageVo", manageVo);
		
		return "manage/manage_branch_view";
	}
	
	@RequestMapping(value = "/manage/manage_branch_excel.do")
	public void manage_branch_excel(ManageDefaultVO searchManageVO, HttpServletResponse response, HttpSession session, Model model) throws IOException, SQLException {
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("Sheet1");
		HSSFRow row = sheet.createRow((short) 0);

		sheet.setColumnWidth(0, 1500);
      	sheet.setColumnWidth(1, 3500);
      	sheet.setColumnWidth(2, 3500);
      	sheet.setColumnWidth(3, 3500);
      	sheet.setColumnWidth(4, 3500);
      	sheet.setColumnWidth(5, 3500);
      	sheet.setColumnWidth(6, 3500);
      	sheet.setColumnWidth(7, 3500);
      	sheet.setColumnWidth(8, 3500);
      	sheet.setColumnWidth(9, 3500);
      	sheet.setColumnWidth(10, 3500);
        sheet.setColumnWidth(11, 3500);
        sheet.setColumnWidth(12, 3500);
        sheet.setColumnWidth(13, 3500);
        
		HSSFFont font = wb.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);

		HSSFCellStyle titlestyle = wb.createCellStyle();
		titlestyle.setFont(font);

		HSSFCell cell = row.createCell(0);
		cell.setCellValue("??????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(1);
		cell.setCellValue("???????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(2);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(3);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(4);
		cell.setCellValue("???????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(5);
		cell.setCellValue("?????????ID");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(6);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(7);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(8);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(9);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(10);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(11);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(12);
		cell.setCellValue("??????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(13);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		HSSFCellStyle style = wb.createCellStyle();
		style.setFont(font);

		searchManageVO.setList(searchManageVO.getArr_check_id().split(","));
		
		List<ManageVO> selectManageList2 = manageService.selectManageList2Excel(searchManageVO);
		
		int i = 0;
		for (ManageVO manageVO : selectManageList2) {
			
			row = sheet.createRow((short) (i + 1));
			
			cell = row.createCell(0);
			cell.setCellValue(i+1);
			cell.setCellStyle(style);

			cell = row.createCell(1);
			cell.setCellValue(manageVO.getStore_id());
			cell.setCellStyle(style);

			cell = row.createCell(2);
			cell.setCellValue(manageVO.getBusiness_nm());
			cell.setCellStyle(style);

			cell = row.createCell(3);
			cell.setCellValue(manageVO.getContract_date());
			cell.setCellStyle(style);

			cell = row.createCell(4);
			cell.setCellValue(manageVO.getCorp_regist_num());
			cell.setCellStyle(style);

			cell = row.createCell(5);
			cell.setCellValue(manageVO.getTerminal_id());
			cell.setCellStyle(style);

			cell = row.createCell(6);
			cell.setCellValue("");
			cell.setCellStyle(style);

			cell = row.createCell(7);
			cell.setCellValue(manageVO.getTel());
			cell.setCellStyle(style);

			cell = row.createCell(8);
			cell.setCellValue(manageVO.getPerson_nm1());
			cell.setCellStyle(style);
			
			cell = row.createCell(9);
			cell.setCellValue(manageVO.getEmail());
			cell.setCellStyle(style);
			
			cell = row.createCell(10);
			cell.setCellValue(manageVO.getPhone_num());
			cell.setCellStyle(style);
			
			cell = row.createCell(11);
			cell.setCellValue(manageVO.getBusiness_nm3());
			cell.setCellStyle(style);
			
			cell = row.createCell(12);
			cell.setCellValue((manageVO.getState() != null && manageVO.getState().equals("Y"))?"?????????":"?????????");
			cell.setCellStyle(style);
			
			cell = row.createCell(13);
			cell.setCellValue((manageVO.getTax() != null && manageVO.getTax().equals("Y"))?"???????????????":"????????????");
			cell.setCellStyle(style);

			i++;
		}

		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(date);
		cal.get(Calendar.YEAR);
		String name = "output.xls";

		File file = new File(propertiesService.getString("Globals.tmp"), name);

		FileOutputStream fileOutputStream = new FileOutputStream(file);

		wb.write(fileOutputStream);

		byte b[] = new byte[(int) file.length()];

		response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xls");
		response.setHeader("Content-Length", String.valueOf(file.length()));
		
		FileInputStream fis = null;
		BufferedInputStream fin = null;
		
		try {
			if (file.isFile()) {
				
				fis = new FileInputStream(file);
				fin = new BufferedInputStream(fis);
				BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
				int read = 0;
				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
			}
			
			if(file.exists()) file.delete();
			
		} catch (FileNotFoundException e) {
			
			logger.debug("manage_branch_excel Exception : "+e);
		} catch (IOException e) {
			
			logger.debug("manage_branch_excel Exception : "+e);
		} finally {
            try {
                if (fileOutputStream != null)
                	fileOutputStream.close();
                
                if (fin != null)
                	fin.close();
                
                if (fis != null)
                	fis.close();
            } catch (IOException ex) {
                System.err.format("IOException: %s%n", ex);
            }
        }
	}
	
}
