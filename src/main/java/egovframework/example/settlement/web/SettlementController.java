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
package egovframework.example.settlement.web;

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
import java.util.Map;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.cmmn.DataUtil;
import egovframework.example.settlement.service.SettlementDefaultVO;
import egovframework.example.settlement.service.SettlementService;
import egovframework.example.settlement.service.SettlementVO;
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
public class SettlementController {

	Logger logger = LoggerFactory.getLogger(SettlementController.class);
	
	/** EgovSampleService */
	@Resource(name = "settlementService")
	private SettlementService settlementService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/settlement/{pageId}")
	public String getSettlement(@PathVariable("pageId") String pageId, Model model) throws Exception {

		return "settlement/"+pageId;
	}
	
	@RequestMapping(value = "/settlement/calendar.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String calender(Model model) throws IOException {
		return "settlement/calendar";
	}
	
	@RequestMapping(value = "/settlement/storeid_search.do", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String storeid_search(SettlementDefaultVO searchSettlementVO, Model model)
			throws IOException, SQLException {
		
		String result = null;
		
		SettlementVO settlementVo = settlementService.storeidSearch(searchSettlementVO);
		
		if(settlementVo != null) {
			result = settlementVo.getBusiness_nm();
		}else {
			result = "none";
		}
		
		logger.debug("result="+result);
		return result;		
	}
	
	@RequestMapping(value = "/settlement/calendar_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String calender_data(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		
		List<SettlementVO> selectCalendarList = settlementService.selectCalendarList(searchSettlementVO);
		
		logger.debug("store_id : "+searchSettlementVO.getStore_id());
		if(searchSettlementVO.getStore_id() != null && !searchSettlementVO.getStore_id().equals("")) {
			
			List<SettlementVO> settlementVo = settlementService.selectCalendarData(searchSettlementVO);
			model.addAttribute("settlementVo", settlementVo);
		}
		
		model.addAttribute("resultList", selectCalendarList);
		model.addAttribute("yyyy", searchSettlementVO.getYyyy());
		model.addAttribute("pre", DataUtil.getPrevDate2(searchSettlementVO.getYm()));
		model.addAttribute("now", DataUtil.getMaxDate2(searchSettlementVO.getYm()));
		model.addAttribute("afe", DataUtil.getNextDate2(searchSettlementVO.getYm()));
		return "settlement/data/calendar_data";
	}
	
	@RequestMapping(value = "/settlement/settlement_all.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_all(SettlementDefaultVO searchSettlementVO, HttpSession session, Model model) throws IOException, SQLException {
		
		model.addAttribute("view_type", searchSettlementVO.getView_type());
		
		if(searchSettlementVO.getView_type() != null && searchSettlementVO.getView_type().equals("L")) {
			searchSettlementVO = (SettlementDefaultVO) session.getAttribute("searchSettlementVO");
			model.addAttribute("searchSettlementVO", searchSettlementVO);
		}else {
			session.setAttribute("searchSettlementVO",	searchSettlementVO);
		}
		
		return "settlement/settlement_all";
	}
	@RequestMapping(value = "/settlement/settlement_all_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_all_data(SettlementDefaultVO searchSettlementVO, HttpSession session, Model model) throws IOException, SQLException {
		
		if(searchSettlementVO.getView_type().equals("L")) {
			searchSettlementVO = (SettlementDefaultVO) session.getAttribute("searchSettlementVO");
		}
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(searchSettlementVO.getPageUnit());
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());
		
		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<SettlementVO> selectSettlementAllList = settlementService.selectSettlementAllList(searchSettlementVO);
		
		int cnt = 0;
		SettlementVO settlementVO = new SettlementVO();
		if(selectSettlementAllList != null && selectSettlementAllList.size() > 0) {
			
			cnt = Integer.parseInt(selectSettlementAllList.get(0).getTotal_cnt());
			settlementVO.setTotal_cnt(selectSettlementAllList.get(0).getTotal_cnt());
			settlementVO.setTotal_approval(selectSettlementAllList.get(0).getTotal_approval());
			settlementVO.setTotal_cancel_sum(selectSettlementAllList.get(0).getTotal_cancel_sum());
			settlementVO.setTotal_approval_cnt(selectSettlementAllList.get(0).getTotal_approval_cnt());
			settlementVO.setTotal_cancel_cnt(selectSettlementAllList.get(0).getTotal_cancel_cnt());
			settlementVO.setTotal_settlement(selectSettlementAllList.get(0).getTotal_settlement());
			settlementVO.setTotal_settlement2(selectSettlementAllList.get(0).getTotal_settlement2());
			settlementVO.setTotal_settlement3(selectSettlementAllList.get(0).getTotal_settlement3());
			settlementVO.setTotal_vat(selectSettlementAllList.get(0).getTotal_vat());
			settlementVO.setTotal_vat2(selectSettlementAllList.get(0).getTotal_vat2());
			settlementVO.setTotal_vat3(selectSettlementAllList.get(0).getTotal_vat3());
			settlementVO.setTotal_amount(selectSettlementAllList.get(0).getTotal_amount());
			settlementVO.setTotal_amount2(selectSettlementAllList.get(0).getTotal_amount2());
			settlementVO.setTotal_amount3(selectSettlementAllList.get(0).getTotal_amount3());
		}
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementAllList);
		model.addAttribute("settlementVO", settlementVO);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchSettlementVO.getPageUnit());
		
		session.setAttribute("searchSettlementVO",	searchSettlementVO);
		
		return "settlement/data/settlement_all_data";
	}
	@RequestMapping(value = "/settlement/settlement_all_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_all_view(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		SettlementVO settlementVO = settlementService.selectSettlementAllInfo(searchSettlementVO);
		model.addAttribute("settlementVO", settlementVO);
		return "settlement/settlement_all_view";
	}

	@RequestMapping(value = "/settlement/settlement_all_info.do")
	public String settlement_all_info(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException  {
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(searchSettlementVO.getPageUnit());
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());
		
		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<SettlementVO> selectSettlementManageDetailList = settlementService.selectSettlementManageDetailList(searchSettlementVO);
		
		int cnt = 0;
		
		SettlementVO settlementVO = new SettlementVO();
		if(selectSettlementManageDetailList != null && selectSettlementManageDetailList.size() > 0) {
			
			settlementVO.setD_amount(selectSettlementManageDetailList.get(0).getD_amount());
			settlementVO.setD_cancel_sum(selectSettlementManageDetailList.get(0).getD_cancel_sum());
			cnt = selectSettlementManageDetailList.get(0).getD_total_cnt();
			settlementVO.setD_approval_cnt(selectSettlementManageDetailList.get(0).getD_approval_cnt());
			settlementVO.setD_cancel_cnt(selectSettlementManageDetailList.get(0).getD_cancel_cnt());
		}
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementManageDetailList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("settlementVO", settlementVO);
		
		return "settlement/data/settlement_all_info";
	}	
	
	@RequestMapping(value = "/settlement/settlement_all_hold.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_all_hold(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		settlementService.settlementAllHoldAdd(searchSettlementVO);
		
		return "redirect:/settlement/settlement_all.do";
	}
	
	@RequestMapping(value = "/settlement/settlement_all_mod.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_all_mod(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		settlementService.settlementAllHoldDel(searchSettlementVO);
		
		return "redirect:/settlement/settlement_his.do";
	}
	
	@RequestMapping(value = "/settlement/settlement_all_excel.do")
	public void settlement_all_excel(SettlementDefaultVO searchSettlementVO, HttpServletResponse response, Model model) throws IOException, SQLException {
		
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
        sheet.setColumnWidth(14, 3500);
        sheet.setColumnWidth(15, 3500);
        sheet.setColumnWidth(16, 3500);
        
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
		cell.setCellValue("?????????ID");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(3);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(4);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(5);
		cell.setCellValue("??????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(6);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(7);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(8);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(9);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(10);
		cell.setCellValue("????????? ?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(11);
		cell.setCellValue("?????????/???????????? ?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(12);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(13);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(14);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(15);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(16);
		cell.setCellValue("??????");
		cell.setCellStyle(titlestyle);

		HSSFCellStyle style = wb.createCellStyle();
		style.setFont(font);

		searchSettlementVO.setList(searchSettlementVO.getArr_check_id().split(","));
		
		List<SettlementVO> selectSettlementAllList = settlementService.selectSettlementAllListExcel(searchSettlementVO);
		
		int i = 0;
		for (SettlementVO settlementVO : selectSettlementAllList) {
			
			row = sheet.createRow((short) (i + 1));
			
			cell = row.createCell(0);
			cell.setCellValue(i+1);
			cell.setCellStyle(style);
			
			cell = row.createCell(1);
			cell.setCellValue(settlementVO.getUserid());
			cell.setCellStyle(style);
			
			cell = row.createCell(2);
			cell.setCellValue(settlementVO.getTerminalid());
			cell.setCellStyle(style);
			
			cell = row.createCell(3);
			cell.setCellValue("??????");
			cell.setCellStyle(style);
			
			cell = row.createCell(4);
			cell.setCellValue(settlementVO.getPeriod());
			cell.setCellStyle(style);
			
			cell = row.createCell(5);
			cell.setCellValue(settlementVO.getBank_nm());
			cell.setCellStyle(style);
			
			cell = row.createCell(6);
			cell.setCellValue(settlementVO.getOrderno());
			cell.setCellStyle(style);
			
			cell = row.createCell(7);
			cell.setCellValue(settlementVO.getUsername());
			cell.setCellStyle(style);
			
			cell = row.createCell(8);
			cell.setCellValue(settlementVO.getProductname());
			cell.setCellStyle(style);
			
			cell = row.createCell(9);
			cell.setCellValue(settlementVO.getAmount());
			cell.setCellStyle(style);
			
			cell = row.createCell(10);
			cell.setCellValue(settlementVO.getCommission());
			cell.setCellStyle(style);
			
			cell = row.createCell(11);
			cell.setCellValue(settlementVO.getCommission2()+"%/"+settlementVO.getCommission3()+"%");
			cell.setCellStyle(style);
			
			cell = row.createCell(12);
			cell.setCellValue(settlementVO.getVat());
			cell.setCellStyle(style);
			
			cell = row.createCell(13);
			cell.setCellValue(settlementVO.getAmount2());
			cell.setCellStyle(style);
			
			cell = row.createCell(14);
			cell.setCellValue(settlementVO.getBusiness_nm3());
			cell.setCellStyle(style);
			
			cell = row.createCell(15);
			cell.setCellValue(settlementVO.getBusiness_nm2());
			cell.setCellStyle(style);
			
			cell = row.createCell(16);
			cell.setCellValue(settlementVO.getState());
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
			
			logger.debug("settlement_all_excel Exception : "+e);
		} catch (IOException e) {
			
			logger.debug("settlement_all_excel Exception : "+e);
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
	
	@RequestMapping(value = "/settlement/settlement_manage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_manage(SettlementDefaultVO searchSettlementVO, HttpSession session, Model model) throws IOException {
		
		
		return "settlement/settlement_manage";
	}
	
	@RequestMapping(value = "/settlement/settlement_branch.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_branch(SettlementDefaultVO searchSettlementVO, HttpSession session, Model model) throws IOException {
		
		
		return "settlement/settlement_branch";
	}
	
	@RequestMapping(value = "/settlement/settlement_store.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_store(SettlementDefaultVO searchSettlementVO, HttpSession session, Model model) throws IOException {
		
		
		return "settlement/settlement_store";
	}
	
	
	@RequestMapping(value = "/settlement/settlement_his.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_his(SettlementDefaultVO searchSettlementVO, HttpSession session, Model model) throws IOException {
		
		model.addAttribute("view_type", searchSettlementVO.getView_type());
		
		if(searchSettlementVO.getView_type() != null && searchSettlementVO.getView_type().equals("L")) {
			searchSettlementVO = (SettlementDefaultVO) session.getAttribute("searchSettlementVO");
			model.addAttribute("searchSettlementVO", searchSettlementVO);
		}else {
			session.setAttribute("searchSettlementVO",	searchSettlementVO);
		}
		
		return "settlement/settlement_his";
	}
	@RequestMapping(value = "/settlement/settlement_his_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_his_data(SettlementDefaultVO searchSettlementVO, HttpSession session, Model model) throws IOException, SQLException {
		
		if(searchSettlementVO.getView_type().equals("L")) {

			searchSettlementVO = (SettlementDefaultVO) session.getAttribute("searchSettlementVO");
	
		}
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(searchSettlementVO.getPageUnit());
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());
		
		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<SettlementVO> selectSettlementHisList = settlementService.selectSettlementHisList(searchSettlementVO);
		SettlementVO settlementVO = settlementService.selectSettlementHisListCnt(searchSettlementVO);
		int cnt = settlementVO.getTocnt();
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementHisList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("amount", settlementVO.getAmount());
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchSettlementVO.getPageUnit());
		
		session.setAttribute("searchSettlementVO",	searchSettlementVO);
		
		return "settlement/data/settlement_his_data";
	}
	@RequestMapping(value = "/settlement/settlement_his_view.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_his_view(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		SettlementVO settlementVO = settlementService.selectSettlementHisInfo(searchSettlementVO);
		model.addAttribute("settlementVO", settlementVO);
		return "settlement/settlement_his_view";
	}
	
	@RequestMapping(value = "/settlement/settlement_his_excel.do")
	public void settlement_his_excel(SettlementDefaultVO searchSettlementVO, HttpServletResponse response, Model model) throws IOException, SQLException {
		
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
        sheet.setColumnWidth(14, 3500);
        sheet.setColumnWidth(15, 3500);
        sheet.setColumnWidth(16, 3500);
        
		HSSFFont font = wb.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);

		HSSFCellStyle titlestyle = wb.createCellStyle();
		titlestyle.setFont(font);

		HSSFCell cell = row.createCell(0);
		cell.setCellValue("??????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(0);
		cell.setCellValue("???????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(1);
		cell.setCellValue("?????????ID");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(2);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(3);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(4);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(5);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);

		cell = row.createCell(6);
		cell.setCellValue("??????");
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
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(11);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(12);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(13);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(14);
		cell.setCellValue("????????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(15);
		cell.setCellValue("?????????");
		cell.setCellStyle(titlestyle);
		
		cell = row.createCell(16);
		cell.setCellValue("??????");
		cell.setCellStyle(titlestyle);

		HSSFCellStyle style = wb.createCellStyle();
		style.setFont(font);

		searchSettlementVO.setList(searchSettlementVO.getArr_check_id().split(","));
		
		List<SettlementVO> selectSettlementHisList = settlementService.selectSettlementHisListExcel(searchSettlementVO);
		
		int i = 0;
		for (SettlementVO settlementVO : selectSettlementHisList) {
			
			row = sheet.createRow((short) (i + 1));
			
			cell = row.createCell(0);
			cell.setCellValue(i+1);
			cell.setCellStyle(style);
					
			cell = row.createCell(0);
			cell.setCellValue(settlementVO.getUserid());
			cell.setCellStyle(style);
			
			cell = row.createCell(1);
			cell.setCellValue(settlementVO.getTerminalid());
			cell.setCellStyle(style);
			
			cell = row.createCell(2);
			cell.setCellValue("??????");
			cell.setCellStyle(style);
			
			cell = row.createCell(3);
			cell.setCellValue(settlementVO.getPeriod());
			cell.setCellStyle(style);
			
			cell = row.createCell(4);
			cell.setCellValue(settlementVO.getAuthdate());
			cell.setCellStyle(style);
			
			cell = row.createCell(5);
			cell.setCellValue(settlementVO.getCanceldate());
			cell.setCellStyle(style);
			
			cell = row.createCell(6);
			cell.setCellValue(settlementVO.getBank_nm());
			cell.setCellStyle(style);
			
			cell = row.createCell(7);
			cell.setCellValue(settlementVO.getOrderno());
			cell.setCellStyle(style);
			
			cell = row.createCell(8);
			cell.setCellValue(settlementVO.getUsername());
			cell.setCellStyle(style);
			
			cell = row.createCell(9);
			cell.setCellValue(settlementVO.getProductname());
			cell.setCellStyle(style);
			
			cell = row.createCell(10);
			cell.setCellValue(settlementVO.getAmount());
			cell.setCellStyle(style);
			
			cell = row.createCell(11);
			cell.setCellValue(settlementVO.getCommission());
			cell.setCellStyle(style);
			
			cell = row.createCell(12);
			cell.setCellValue(settlementVO.getVat());
			cell.setCellStyle(style);
			
			cell = row.createCell(13);
			cell.setCellValue(settlementVO.getCommission_total());
			cell.setCellStyle(style);
			
			cell = row.createCell(14);
			cell.setCellValue(settlementVO.getBusiness_nm3());
			cell.setCellStyle(style);
			
			cell = row.createCell(15);
			cell.setCellValue(settlementVO.getBusiness_nm2());
			cell.setCellStyle(style);
			
			cell = row.createCell(16);
			cell.setCellValue(settlementVO.getState());
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
			
			logger.debug("settlement_his_excel Exception : "+e);
		} catch (IOException e) {
			
			logger.debug("settlement_his_excel Exception : "+e);
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
	
	@RequestMapping(value = "/settlement/settlement_manage.do")
	public String settlement_manage(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		return "settlement/settlement_manage";
	}
	
	@RequestMapping(value = "/settlement/settlement_manage_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_manage_data(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(searchSettlementVO.getPageUnit());
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());
		
		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<SettlementVO> selectSettlementManageList = settlementService.selectSettlementManageList(searchSettlementVO);
		
		int cnt = 0;
		String amount = "0";

		SettlementVO settlementVO = new SettlementVO();
		if(selectSettlementManageList != null && selectSettlementManageList.size() > 0) {
			cnt = selectSettlementManageList.get(0).getTocnt();
			amount = selectSettlementManageList.get(0).getAmount_sum();
			
			settlementVO.setTotal_cnt(selectSettlementManageList.get(0).getTotal_cnt());
			settlementVO.setTotal_approval(selectSettlementManageList.get(0).getTotal_approval());
			settlementVO.setTotal_cancel_sum(selectSettlementManageList.get(0).getTotal_cancel_sum());
			settlementVO.setTotal_approval_cnt(selectSettlementManageList.get(0).getTotal_approval_cnt());
			settlementVO.setTotal_cancel_cnt(selectSettlementManageList.get(0).getTotal_cancel_cnt());
			settlementVO.setTotal_settlement(selectSettlementManageList.get(0).getTotal_settlement());
			settlementVO.setTotal_settlement2(selectSettlementManageList.get(0).getTotal_settlement2());
			settlementVO.setTotal_settlement3(selectSettlementManageList.get(0).getTotal_settlement3());
			settlementVO.setTotal_vat(selectSettlementManageList.get(0).getTotal_vat());
			settlementVO.setTotal_vat2(selectSettlementManageList.get(0).getTotal_vat2());
			settlementVO.setTotal_vat3(selectSettlementManageList.get(0).getTotal_vat3());
			settlementVO.setTotal_amount(selectSettlementManageList.get(0).getTotal_amount());
			settlementVO.setTotal_amount2(selectSettlementManageList.get(0).getTotal_amount2());
			settlementVO.setTotal_amount3(selectSettlementManageList.get(0).getTotal_amount3());
		}
		
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementManageList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("amount", amount);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchSettlementVO.getPageUnit());
		model.addAttribute("searchSettlementVO", searchSettlementVO);
		model.addAttribute("settlementVO", settlementVO);
		
		return "settlement/data/settlement_manage_data";
	}
	
	@RequestMapping(value = "/settlement/settlement_manage_info.do")
	public String settlement_manage_info(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException  {
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(searchSettlementVO.getPageUnit());
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());
		
		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<SettlementVO> selectSettlementManageDetailList = settlementService.selectSettlementManageDetailList(searchSettlementVO);
		
		int cnt = 0;
		
		SettlementVO settlementVO = new SettlementVO();
		if(selectSettlementManageDetailList != null && selectSettlementManageDetailList.size() > 0) {
			
			settlementVO.setD_amount(selectSettlementManageDetailList.get(0).getD_amount());
			settlementVO.setD_cancel_sum(selectSettlementManageDetailList.get(0).getD_cancel_sum());
			cnt = selectSettlementManageDetailList.get(0).getD_total_cnt();
			settlementVO.setD_approval_cnt(selectSettlementManageDetailList.get(0).getD_approval_cnt());
			settlementVO.setD_cancel_cnt(selectSettlementManageDetailList.get(0).getD_cancel_cnt());
		}
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementManageDetailList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("settlementVO", settlementVO);
		
		return "settlement/data/settlement_manage_info";
	}
	
	@RequestMapping(value = "/settlement/settlement_branch.do")
	public String settlement_branch(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		return "settlement/settlement_branch";
	}
	
	@RequestMapping(value = "/settlement/settlement_branch_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_branch_data(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(searchSettlementVO.getPageUnit());
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());
		
		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<SettlementVO> selectSettlementManageList = settlementService.selectSettlementManageList(searchSettlementVO);
		
		int cnt = 0;
		String amount = "0";
		
		SettlementVO settlementVO = new SettlementVO();
		if(selectSettlementManageList != null && selectSettlementManageList.size() > 0) {
			cnt = selectSettlementManageList.get(0).getTocnt();
			amount = selectSettlementManageList.get(0).getAmount_sum();
			
			settlementVO.setTotal_cnt(selectSettlementManageList.get(0).getTotal_cnt());
			settlementVO.setTotal_approval(selectSettlementManageList.get(0).getTotal_approval());
			settlementVO.setTotal_cancel_sum(selectSettlementManageList.get(0).getTotal_cancel_sum());
			settlementVO.setTotal_approval_cnt(selectSettlementManageList.get(0).getTotal_approval_cnt());
			settlementVO.setTotal_cancel_cnt(selectSettlementManageList.get(0).getTotal_cancel_cnt());
			settlementVO.setTotal_settlement(selectSettlementManageList.get(0).getTotal_settlement());
			settlementVO.setTotal_settlement2(selectSettlementManageList.get(0).getTotal_settlement2());
			settlementVO.setTotal_settlement3(selectSettlementManageList.get(0).getTotal_settlement3());
			settlementVO.setTotal_vat(selectSettlementManageList.get(0).getTotal_vat());
			settlementVO.setTotal_vat2(selectSettlementManageList.get(0).getTotal_vat2());
			settlementVO.setTotal_vat3(selectSettlementManageList.get(0).getTotal_vat3());
			settlementVO.setTotal_amount(selectSettlementManageList.get(0).getTotal_amount());
			settlementVO.setTotal_amount2(selectSettlementManageList.get(0).getTotal_amount2());
			settlementVO.setTotal_amount3(selectSettlementManageList.get(0).getTotal_amount3());
		}
		
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementManageList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("amount", amount);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchSettlementVO.getPageUnit());
		model.addAttribute("searchSettlementVO", searchSettlementVO);
		model.addAttribute("settlementVO", settlementVO);
		
		return "settlement/data/settlement_branch_data";
	}	
	
	@RequestMapping(value = "/settlement/settlement_branch_info.do")
	public String settlement_branch_info(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException  {
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(searchSettlementVO.getPageUnit());
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());
		
		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<SettlementVO> selectSettlementManageDetailList = settlementService.selectSettlementManageDetailList(searchSettlementVO);
		
		int cnt = 0;
		
		SettlementVO settlementVO = new SettlementVO();
		if(selectSettlementManageDetailList != null && selectSettlementManageDetailList.size() > 0) {
			
			settlementVO.setD_amount(selectSettlementManageDetailList.get(0).getD_amount());
			settlementVO.setD_cancel_sum(selectSettlementManageDetailList.get(0).getD_cancel_sum());
			cnt = selectSettlementManageDetailList.get(0).getD_total_cnt();
			settlementVO.setD_approval_cnt(selectSettlementManageDetailList.get(0).getD_approval_cnt());
			settlementVO.setD_cancel_cnt(selectSettlementManageDetailList.get(0).getD_cancel_cnt());
		}
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementManageDetailList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("settlementVO", settlementVO);
		
		return "settlement/data/settlement_branch_info";
	}
	
	@RequestMapping(value = "/settlement/settlement_store.do")
	public String settlement_store(SettlementDefaultVO searchSettlementVO, Model model) throws IOException {
		
		return "settlement/settlement_store";
	}
	
	@RequestMapping(value = "/settlement/settlement_store_data.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String settlement_store_data(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException {
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(searchSettlementVO.getPageUnit());
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());
		
		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<SettlementVO> selectSettlementManageList = settlementService.selectSettlementManageList(searchSettlementVO);
		
		int cnt = 0;
		String amount = "0";
		
		SettlementVO settlementVO = new SettlementVO();
		if(selectSettlementManageList != null && selectSettlementManageList.size() > 0) {
			cnt = selectSettlementManageList.get(0).getTocnt();
			amount = selectSettlementManageList.get(0).getAmount_sum();
			
			settlementVO.setTotal_cnt(selectSettlementManageList.get(0).getTotal_cnt());
			settlementVO.setTotal_approval(selectSettlementManageList.get(0).getTotal_approval());
			settlementVO.setTotal_cancel_sum(selectSettlementManageList.get(0).getTotal_cancel_sum());
			settlementVO.setTotal_approval_cnt(selectSettlementManageList.get(0).getTotal_approval_cnt());
			settlementVO.setTotal_cancel_cnt(selectSettlementManageList.get(0).getTotal_cancel_cnt());
			settlementVO.setTotal_settlement(selectSettlementManageList.get(0).getTotal_settlement());
			settlementVO.setTotal_settlement2(selectSettlementManageList.get(0).getTotal_settlement2());
			settlementVO.setTotal_settlement3(selectSettlementManageList.get(0).getTotal_settlement3());
			settlementVO.setTotal_vat(selectSettlementManageList.get(0).getTotal_vat());
			settlementVO.setTotal_vat2(selectSettlementManageList.get(0).getTotal_vat2());
			settlementVO.setTotal_vat3(selectSettlementManageList.get(0).getTotal_vat3());
			settlementVO.setTotal_amount(selectSettlementManageList.get(0).getTotal_amount());
			settlementVO.setTotal_amount2(selectSettlementManageList.get(0).getTotal_amount2());
			settlementVO.setTotal_amount3(selectSettlementManageList.get(0).getTotal_amount3());
		}
		
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementManageList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("amount", amount);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageUnit", searchSettlementVO.getPageUnit());
		model.addAttribute("searchSettlementVO", searchSettlementVO);
		model.addAttribute("settlementVO", settlementVO);
		
		return "settlement/data/settlement_store_data";
	}
	
	@RequestMapping(value = "/settlement/settlement_store_info.do")
	public String settlement_store_info(SettlementDefaultVO searchSettlementVO, Model model) throws IOException, SQLException  {
		
		/** EgovPropertyService.sample */
		searchSettlementVO.setPageUnit(searchSettlementVO.getPageUnit());
		searchSettlementVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchSettlementVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchSettlementVO.getPageUnit());
		paginationInfo.setPageSize(searchSettlementVO.getPageSize());
		
		searchSettlementVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchSettlementVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchSettlementVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<SettlementVO> selectSettlementManageDetailList = settlementService.selectSettlementManageDetailList(searchSettlementVO);
		
		int cnt = 0;
		
		SettlementVO settlementVO = new SettlementVO();
		if(selectSettlementManageDetailList != null && selectSettlementManageDetailList.size() > 0) {
			
			settlementVO.setD_amount(selectSettlementManageDetailList.get(0).getD_amount());
			settlementVO.setD_cancel_sum(selectSettlementManageDetailList.get(0).getD_cancel_sum());
			cnt = selectSettlementManageDetailList.get(0).getD_total_cnt();
			settlementVO.setD_approval_cnt(selectSettlementManageDetailList.get(0).getD_approval_cnt());
			settlementVO.setD_cancel_cnt(selectSettlementManageDetailList.get(0).getD_cancel_cnt());
		}
		
		paginationInfo.setTotalRecordCount(cnt);
		
		model.addAttribute("resultList", selectSettlementManageDetailList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("settlementVO", settlementVO);
		
		return "settlement/data/settlement_store_info";
	}
}
