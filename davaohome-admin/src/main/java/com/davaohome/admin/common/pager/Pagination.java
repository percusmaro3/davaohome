package com.davaohome.admin.common.pager;

import javax.servlet.jsp.tagext.SimpleTagSupport;

public class Pagination extends SimpleTagSupport {
	private static final int INITIAL_PAGE = 1;
	private static final int NEXT_PAGE = 10;
	private static final int ITEM_PER_PAGE = 10;
	private int itemPerPage = ITEM_PER_PAGE;
	private int nextPage = NEXT_PAGE;
	private int page = INITIAL_PAGE;
	private int totalItemCount;

	public Pagination(int page, int itemPerPage) {
		this.page = page;
		this.itemPerPage = itemPerPage;
	}

	public int getCurrentPage() {
		if (this.page < INITIAL_PAGE) {
			page = INITIAL_PAGE;
		}
		int pageCount = getPageCount();
		if (page > pageCount) {
			page = pageCount;
		}
		return page;
	}

	public int getPageCount() {
		return (totalItemCount - INITIAL_PAGE) / itemPerPage + INITIAL_PAGE;
	}

	public int getPageBegin() {
		return ((getCurrentPage() - INITIAL_PAGE) / nextPage) * nextPage + INITIAL_PAGE;
	}

	public int getPageEnd() {
		int pageCount = getPageCount();
		int num = getPageBegin() + nextPage - INITIAL_PAGE;
		return Math.min(pageCount, num);
	}

	public int getTotalItemCount() {
		return this.totalItemCount;
	}

	public void setTotalItemCount(int totalItemCount) {
		this.totalItemCount = totalItemCount;
	}

	public int getItemPerPage() {
		return itemPerPage;
	}

	public void setItemPerPage(int itemPerPage) {
		this.itemPerPage = itemPerPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCurrentItem() {
		return (page - INITIAL_PAGE) * itemPerPage;
	}

	public int getJumpNextPage() {
		return Math.min(getPageCount(), getPageEnd() + INITIAL_PAGE);
	}

	public int getJumpPrevPage() {
		return Math.max(INITIAL_PAGE, getPageBegin() - INITIAL_PAGE);
	}

	public int getStartRowId() {
		return (page - INITIAL_PAGE) * itemPerPage;
	}

	public int getEndRowId() {
		return (page - INITIAL_PAGE) * itemPerPage + itemPerPage;
	}

	public int getFirstPage() {
		return INITIAL_PAGE;
	}

}
