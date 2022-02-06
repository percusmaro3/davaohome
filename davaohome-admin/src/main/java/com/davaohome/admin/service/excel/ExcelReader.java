package com.davaohome.admin.service.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelReader {

	InputStream is;
	int rows = 0;
	int currentRow = 0;
	int cells = 0;
	XSSFSheet sheet;

	public ExcelReader(String fileName) throws IOException {
		this(new FileInputStream(fileName));
	}

	public ExcelReader(File f) throws FileNotFoundException, IOException {
		this(new FileInputStream(f));
	}

	public ExcelReader(InputStream is) throws IOException {
		this.is = is;
		initExcelFile();
	}

	private void initExcelFile() throws IOException {
		//		POIFSFileSystem fs = new POIFSFileSystem(is);
		XSSFWorkbook wb = new XSSFWorkbook(is);

		sheet = wb.getSheetAt(0);
	}


	public String[] readNext() {
		XSSFRow row = sheet.getRow(currentRow++);
		if (row != null) {
			return getCellData(row);
		} else {
			return null;
		}
	}

	private String[] getCellData(XSSFRow row) {
		int cells = row.getPhysicalNumberOfCells();

		String[] record = new String[cells];

		for (int c = 0; c < cells; c++) {
			XSSFCell cell = row.getCell(c);
			if (cell != null) {
				record[c] = getCellDataByString(cell);
			} else {
				record[c] = "";
			}
		}
		return record;
	}

	private String getCellDataByString(XSSFCell cell) {
		switch (cell.getCellType()) {
			case XSSFCell.CELL_TYPE_FORMULA:
				return cell.getCellFormula().trim();
			case XSSFCell.CELL_TYPE_STRING:
				return cell.getStringCellValue().trim();
			case XSSFCell.CELL_TYPE_BLANK:
				return "";
			case XSSFCell.CELL_TYPE_ERROR:
			default:
				return cell.getRawValue().trim();
		}
	}

}
