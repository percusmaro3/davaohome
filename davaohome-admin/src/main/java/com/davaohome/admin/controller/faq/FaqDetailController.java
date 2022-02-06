package com.davaohome.admin.controller.faq;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.davaohome.bo.model.faq.Faq;
import com.davaohome.bo.model.faq.FaqContents;
import com.davaohome.bo.service.faq.FaqService;
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

@Controller
@RequestMapping("/faq")
public class FaqDetailController {

	private static final Logger log = LoggerFactory.getLogger(FaqDetailController.class);

	@Autowired
	FaqService faqService;

	@RequestMapping(value = "/newFaq")
	public String showNewFaqDetail(Model model) throws Exception {

		setBaseData(JobType.INSERT, new Faq(), model);

		return "/faq/faqDetail";
	}

	@RequestMapping(value = "/{faqNo}")
	public String showFaqDetail(@PathVariable Integer faqNo, Model model) throws Exception {

		Faq faq = faqService.getFaq(faqNo);

		setBaseData(JobType.UPDATE, faq, model);

		return "/faq/faqDetail";
	}

	@RequestMapping(value = "/register")
	public String registerFaq(@ModelAttribute Faq faq, HttpServletRequest request, Model model) throws Exception {

		AdminSessionUtil.setLastUpdater(faq);

		ErrorMsg em = new ErrorMsg();
		makeFaqContents(faq, request, em);

		if (em.hasErrorMsg()) {

			model.addAttribute("errorMsg", em.getErrorMsg());
			setBaseData(JobType.INSERT, faq, model);

			return "/faq/faqDetail";
		}

		faqService.insertFaq(faq);

		return "/common/popupcloseOpenerReload";
	}

	@RequestMapping(value = "/update")
	public String updateFaq(@ModelAttribute Faq faq, HttpServletRequest request, Model model) throws Exception {

		AdminSessionUtil.setLastUpdater(faq);

		ErrorMsg em = new ErrorMsg();
		makeFaqContents(faq, request, em);

		if (em.hasErrorMsg()) {

			model.addAttribute("errorMsg", em.getErrorMsg());
			setBaseData(JobType.UPDATE, faq, model);

			return "/faq/faqDetail";
		}

		faqService.updateFaq(faq);

		return "/common/popupcloseOpenerReload";
	}

	private void setBaseData(JobType jobType, Faq faq, Model model) {

		model.addAttribute("jobType", jobType);
		model.addAttribute("faq", faq);
		model.addAttribute("languageList", ActiveLanguage.values());
	}

	private void makeFaqContents(Faq faq, HttpServletRequest request, ErrorMsg em) {

		Map<String, FaqContents> faqContentsMap = new HashMap<>();

		for (ActiveLanguage al : ActiveLanguage.values()) {
			FaqContents faqContents = new FaqContents();

			String questionParam = "question_" + al.name();
			String answerParam = "answer_" + al.name();

			String question = request.getParameter(questionParam);
			String answer = request.getParameter(answerParam);

			if (StringUtils.isNotEmpty(question)) {

				faqContents.setFaqNo(faq.getFaqNo());
				faqContents.setLanguage(al.name());
				faqContents.setQuestion(question);
				faqContents.setAnswer(answer);

				faqContentsMap.put(al.name(), faqContents);
			} else if (al != ActiveLanguage.en) {
				// 영어가 아닌데 빈 값이면 영어로 데이터를 채워 넣는다.
				FaqContents enContents = faqContentsMap.get(ActiveLanguage.en.name());

				faqContents.setFaqNo(enContents.getFaqNo());
				faqContents.setLanguage(al.name());
				faqContents.setQuestion(enContents.getQuestion());
				faqContents.setAnswer(enContents.getAnswer());

				faqContentsMap.put(al.name(), faqContents);
			}
		}

		if (!faqContentsMap.containsKey("en")) {
			em.addErrorMsg(MessageHelper.getMessage("common.inputDefaultLanguage"));
			return;
		}

		faq.setContentsMap(faqContentsMap);
	}
}
