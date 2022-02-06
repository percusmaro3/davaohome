package com.davaohome.web.common.pager;


import com.davaohome.bo.model.base.PageIndexSetter;

public class PagerMaker {

	public static Pagination makePagerWithIndexSet(int page, int itemPerPage, PageIndexSetter pis) {

		Pagination paging = new Pagination(page, itemPerPage);

		pis.setStartRowIndex(paging.getStartRowId());
		pis.setFetchCount(itemPerPage);

		return paging;
	}
}
