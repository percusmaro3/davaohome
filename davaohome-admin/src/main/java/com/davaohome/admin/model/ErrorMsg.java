package com.davaohome.admin.model;

import java.util.ArrayList;
import java.util.List;

public class ErrorMsg {

	List<String> errorList = new ArrayList<>();

	public void addErrorMsg(String errorMsg) {
		errorList.add(errorMsg);
	}

	public boolean hasErrorMsg() {
		return this.errorList.size() > 0;
	}

	public String getErrorMsg() {
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < errorList.size(); i++) {
			String s = errorList.get(i);
			sb.append(s);
			if (i != errorList.size() - 1) {
				sb.append("<br/>");
			}
		}

		return sb.toString();
	}
}
