package com.davaohome.utils.datatype;

import java.util.ArrayList;
import java.util.List;

public class GetListSectionValue {

	private static int MAX_COUNT = 400;

	public static <T> List<List<T>> listSectionValue(List<T> paramList) {

		List<List<T>> result = new ArrayList<>();

		List<T> unitList = new ArrayList<>();
		int index = 1;
		for (T each : paramList) {

			unitList.add(each);
			
			if ((index % MAX_COUNT) == 0 || index == paramList.size()) {
				result.add(unitList);
				unitList = new ArrayList<>();
			}
			
			index++;
		}

		return result;
	}
}
