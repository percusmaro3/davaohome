package com.davaohome.utils.datatype;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ListUtil {

	public static Integer intMin(List<Integer> list) {

		Integer min = Integer.MAX_VALUE;

		for (Integer element : list) {

			min = Integer.compare(min, element) < 0 ? min : element;
		}

		return min > 0 ? min : 0;
	}

	public static <T> String join(List<T> list, String delimiter) {
		if (list == null) {
			return "";
		}

		StringBuilder result = new StringBuilder();

		for (Iterator<T> iterator = list.iterator(); iterator.hasNext(); ) {
			result.append(iterator.next());

			if (iterator.hasNext()) {
				result.append(delimiter);
			}
		}

		return result.toString();
	}

	public static <T> List<T> convertFromMapValues(Map<?, T> map) {

		return convertFromCollection(map.values());
	}

	public static <T> List<T> convertFromCollection(Collection<T> collection) {

		List<T> list = new ArrayList<>();

		for (T t : collection) {
			list.add(t);
		}

		return list;
	}
}
