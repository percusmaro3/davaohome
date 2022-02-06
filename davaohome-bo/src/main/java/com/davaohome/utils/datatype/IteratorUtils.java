package com.davaohome.utils.datatype;

import java.util.Arrays;
import java.util.Collections;

public class IteratorUtils {

	public static <T> Iterable<T> emptyIfNull(Iterable<T> iterable) {
		if (iterable == null) {
			//return Collections.<T> emptyList();
			return Collections.emptyList();
		} else {
			return iterable;
		}
	}

	public static <T> Iterable<T> emptyIfNull(T[] arr) {
		if (arr == null) {
			return Collections.emptyList();
		} else {
			return Arrays.asList(arr);
		}
	}
}
