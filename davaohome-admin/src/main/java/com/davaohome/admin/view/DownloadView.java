package com.davaohome.admin.view;

import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class DownloadView extends AbstractView {
	private static final String CONTENT_TYPE = "applcation/octet-stream";
	private static final Logger LOGGER = LoggerFactory.getLogger(DownloadView.class);

	public DownloadView() {
		setContentType(CONTENT_TYPE);
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		initResponse(response, (String)map.get("fileName"));
		OutputStream out = response.getOutputStream();

		if (map.keySet().contains("workbook")) {

			HSSFWorkbook workbook = (HSSFWorkbook)map.get("workbook");

			try {
				workbook.write(out);
			} catch (Exception e) {
				//LOGGER.error(e.getMessage());
				LOGGER.error("[CATCH_EXCEPTION]", e);
			} finally {
				out.close();
			}
		}
	}

	private void initResponse(HttpServletResponse response, String fileName) {

		response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
		response.setContentType("applcation/octet-stream");
	}
}
