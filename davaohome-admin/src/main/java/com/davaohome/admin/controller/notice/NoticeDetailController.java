package com.davaohome.admin.controller.notice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.davaohome.admin.message.MessageHelper;
import com.davaohome.admin.model.ErrorMsg;
import com.davaohome.admin.model.JobType;
import com.davaohome.admin.util.AdminSessionUtil;
import com.davaohome.bo.model.base.ActiveLanguage;
import com.davaohome.bo.model.notice.Notice;
import com.davaohome.bo.model.notice.NoticeContents;
import com.davaohome.bo.service.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeDetailController {

	private static final Logger log = LoggerFactory.getLogger(NoticeDetailController.class);

	@Autowired
	NoticeService noticeService;

	@RequestMapping(value = "/newNotice")
	public String showNewNoticeDetail(Model model) throws Exception {

		setBaseData(JobType.INSERT, new Notice(), model);

		return "notice/noticeDetail";
	}

	@RequestMapping(value = "/{noticeNo}")
	public String showNoticeDetail(@PathVariable Integer noticeNo, Model model) throws Exception {

		Notice notice = noticeService.getNotice(noticeNo);

		setBaseData(JobType.UPDATE, notice, model);

		return "notice/noticeDetail";
	}

	@RequestMapping(value = "/register")
	public String registerNotice(@ModelAttribute Notice notice, HttpServletRequest request, Model model) throws Exception {

		AdminSessionUtil.setLastUpdater(notice);

		ErrorMsg em = new ErrorMsg();
		makeNoticeContents(notice, request, em);

		if (em.hasErrorMsg()) {

			model.addAttribute("errorMsg", em.getErrorMsg());
			setBaseData(JobType.INSERT, notice, model);

			return "notice/noticeDetail";
		}

		noticeService.insertNotice(notice);

		return "/common/popupcloseOpenerReload";
	}

	@RequestMapping(value = "/update")
	public String updateNotice(@ModelAttribute Notice notice, HttpServletRequest request, Model model) throws Exception {

		AdminSessionUtil.setLastUpdater(notice);

		ErrorMsg em = new ErrorMsg();
		makeNoticeContents(notice, request, em);

		if (em.hasErrorMsg()) {

			model.addAttribute("errorMsg", em.getErrorMsg());
			setBaseData(JobType.UPDATE, notice, model);

			return "notice/noticeDetail";
		}

		noticeService.updateNotice(notice);

		return "/common/popupcloseOpenerReload";
	}

	private void setBaseData(JobType jobType, Notice notice, Model model) {

		model.addAttribute("jobType", jobType);
		model.addAttribute("notice", notice);
		model.addAttribute("languageList", ActiveLanguage.values());
	}

	private void makeNoticeContents(Notice notice, HttpServletRequest request, ErrorMsg em) {

		Map<String, NoticeContents> noticeContentsMap = new HashMap<>();

		for (ActiveLanguage al : ActiveLanguage.values()) {
			NoticeContents noticeContents = new NoticeContents();

			String titleParam = "title_" + al.name();
			String contentParam = "descriptionHtml_" + al.name();

			String title = request.getParameter(titleParam);
			String contents = request.getParameter(contentParam);

			if (StringUtils.isNotEmpty(title)) {

				noticeContents.setNoticeNo(notice.getNoticeNo());
				noticeContents.setLanguage(al.name());
				noticeContents.setTitle(title);
				noticeContents.setContent(contents);

				noticeContentsMap.put(al.name(), noticeContents);
			} else if (al != ActiveLanguage.en) {
				// 영어가 아닌데 빈 값이면 영어로 데이터를 채워 넣는다.
				NoticeContents enContents = noticeContentsMap.get(ActiveLanguage.en.name());

				noticeContents.setNoticeNo(enContents.getNoticeNo());
				noticeContents.setLanguage(al.name());
				noticeContents.setTitle(enContents.getTitle());
				noticeContents.setContent(enContents.getContent());

				noticeContentsMap.put(al.name(), noticeContents);
			}
		}

		if (!noticeContentsMap.containsKey("en")) {
			em.addErrorMsg(MessageHelper.getMessage("common.inputDefaultLanguage"));
			return;
		}

		notice.setContentsMap(noticeContentsMap);
	}
}
