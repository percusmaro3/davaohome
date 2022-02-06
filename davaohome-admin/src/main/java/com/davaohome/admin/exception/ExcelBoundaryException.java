package com.davaohome.admin.exception;

public class ExcelBoundaryException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ExcelBoundaryException(int current) {

		super("The number of current rows is " + current + ". Out of excel row boundary, 65535.");
	}
}
