package com.davaohome.admin.common.pager;

import java.io.Writer;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PaginationTag extends SimpleTagSupport {
	Pagination pagination;

	private Writer getWriter() {
		JspWriter out = getJspContext().getOut();
		return out;
	}

	@Override
	public void doTag() throws JspException {
		Writer out = getWriter();

		try {
			out.write("<script type=\"text/javascript\">\n");
			out.write("function goPage(page){\n");
			out.write("	var url = document.location.href;\n");
			out.write("	var sMatch = /([&|?]page=)([0-9])*/g;\n");
			out.write("	if ( sMatch.test(url) ) {\n");
			out.write("		url = url.replace(sMatch, '$1'+page);\n");
			out.write("	} else {\n");
			out.write("		if ( /\\?/g.test(url) ) {\n");
			out.write("			url += '&page='+page;\n");
			out.write("		} else {\n");
			out.write("			url += '?page='+page;\n");
			out.write("		}\n");
			out.write("	}\n");
			out.write("	document.location.href = url;\n");
			out.write("}\n");
			out.write("</script>\n");

			out.write("<div class=\"pagination\">\n");
			out.write("<a href=\"javascript:goPage('" + pagination.getFirstPage() + "')\" class=\"pre_end\"><<</a>\n");
			out.write("<a href=\"javascript:goPage('" + pagination.getJumpPrevPage() + "')\" class=\"pre\"><</a>\n");
			for (int i = pagination.getPageBegin(); i <= pagination.getPageEnd(); i++) {
				if (i == pagination.getCurrentPage()) {
					out.write("<strong>" + i + "</strong>\n");
				} else {
					out.write("<a href=\"javascript:goPage('" + i + "')\">" + i + "</a>\n");
				}
			}
			out.write("<a href=\"javascript:goPage('" + pagination.getJumpNextPage() + "')\" class=\"next\">></a>\n");
			out.write("<a href=\"javascript:goPage('" + pagination.getPageCount() + "')\" class=\"next_end\">>></a>\n");
			out.write("</div>\n");
		} catch (java.io.IOException ex) {
			throw new JspException("Error in Paginator tag", ex);
		}
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

}
