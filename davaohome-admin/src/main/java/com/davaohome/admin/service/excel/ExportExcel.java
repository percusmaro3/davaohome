package com.davaohome.admin.service.excel;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.stereotype.Service;

@Service
public class ExportExcel {

	public static final int EXCEL_MAX_ROW_BOUNDARY = 500000;

	public static HSSFWorkbook makeExcelWorkbook(List<String> header, List<List<String>> data) throws IOException {

		HSSFWorkbook workbook = new HSSFWorkbook();

		HSSFSheet sheet = workbook.createSheet("Sheet1");

		int rowIndex = 0;
		if (header != null && header.size() != 0) {
			rowIndex = createHeader(workbook, sheet, header);
		}

		HSSFCell cell = null;
		HSSFRow row = null;
		for (List<String> rowData : data) {
			row = sheet.createRow(rowIndex++);

			int cellIndex = 0;
			for (String str : rowData) {
				cell = row.createCell(cellIndex++);
				cell.setCellValue(str);
			}
		}

		return workbook;
	}

	public static void exportExcel(HSSFWorkbook workbook, String fileName, HttpServletResponse response) throws IOException {

		response.setHeader("Content-Type", "application/vnd.ms-excel;charset=\"utf-8\"");
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
		response.setHeader("Content-Description", "JSP Generated Data");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setBufferSize(32000);
		OutputStream out = response.getOutputStream();

		workbook.write(out);
		out.flush();
		out.close();
	}

	private static int createHeader(HSSFWorkbook workbook, HSSFSheet sheet, List<String> header) {

		HSSFCell cell = null;
		HSSFRow row = sheet.createRow(0);
		CellStyle headerCellStyle = createHeaderCellStyle(workbook);

		int rowIndex = 0;
		for (String str : header) {
			cell = row.createCell(rowIndex++);
			cell.setCellValue(str);
			cell.setCellStyle(headerCellStyle);
		}

		return 1;
	}

	private static CellStyle createHeaderCellStyle(HSSFWorkbook workbook) {
		CellStyle cs = workbook.createCellStyle();
		Font f = workbook.createFont();
		f.setColor(Font.COLOR_RED);
		f.setBoldweight(Font.BOLDWEIGHT_BOLD);

		cs.setFont(f);
		return cs;
	}

	//	public HSSFWorkbook exportDataToExcel(List<List<String>> stringList) {
	//
	//		HSSFWorkbook workbook = new HSSFWorkbook();
	//
	//		HSSFSheet sheet = workbook.createSheet("Sheet1");
	//
	//		if (stringList.size() > EXCEL_MAX_ROW_BOUNDARY) {
	//			throw new ExcelBoundaryException(stringList.size());
	//		}
	//
	//		int i = 0;
	//		for (List<String> strList : stringList) {
	//			HSSFRow row = sheet.createRow(i++);
	//
	//			int j = 0;
	//			for (String str : strList) {
	//				HSSFCell cell = row.createCell(j++);
	//				cell.setCellValue(str);
	//			}
	//		}
	//
	//		return workbook;
	//	}
	//
	//	public HSSFWorkbook makeCastingTemplate(ArrayList<String> rowList, ArrayList<String> columnList) {
	//
	//		HSSFWorkbook workbook = new HSSFWorkbook();
	//		HSSFSheet sheet = workbook.createSheet("Sheet1");
	//		int rowSize = rowList.size();
	//		int columnSize = columnList.size();
	//		/*if ((rowSize + columnSize) > EXCEL_MAX_ROW_BOUNDARY) {
	//			throw new ExcelBoundaryException();
	//		}*/
	//
	//		for (int i = 0; i < rowSize; i++) {
	//			HSSFRow row = sheet.createRow(i + 1);
	//			HSSFCell cell = row.createCell(0);
	//			cell.setCellValue(rowList.get(i));
	//		}
	//
	//		HSSFRow row = sheet.createRow(0);
	//		for (int i = 0; i < columnSize; i++) {
	//			HSSFCell cell = row.createCell(i + 1);
	//			cell.setCellValue(columnList.get(i));
	//		}
	//
	//		//컬럼 사이즈 조절
	//		for (int i = 0; i < columnSize + 1; i++) {
	//			sheet.autoSizeColumn((short) i);
	//			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 512);
	//		}
	//
	//		return workbook;
	//	}
	//
	//	public XSSFWorkbook newExportDataToExcel(List<List<String>> stringList) {
	//
	//		XSSFWorkbook workbook = new XSSFWorkbook();
	//		XSSFSheet sheet = workbook.createSheet("Sheet1");
	//
	//		if (stringList.size() > EXCEL_MAX_ROW_BOUNDARY) {
	//			throw new ExcelBoundaryException(stringList.size());
	//		}
	//
	//		int i = 0;
	//		for (List<String> strList : stringList) {
	//			XSSFRow row = sheet.createRow(i++);
	//
	//			int j = 0;
	//			for (String str : strList) {
	//				XSSFCell cell = row.createCell(j++);
	//				cell.setCellValue(str);
	//			}
	//		}
	//
	//		return workbook;
	//	}

}
