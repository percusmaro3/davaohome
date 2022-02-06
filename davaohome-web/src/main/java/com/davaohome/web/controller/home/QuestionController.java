package com.davaohome.web.controller.home;

import com.davaohome.bo.model.faq.Question;
import com.davaohome.bo.service.faq.FaqService;
import com.davaohome.mail.MailContents;
import com.davaohome.mail.MailSender;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/{languageCode}")
public class QuestionController {

	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);

	private static String FROM_EMAIL = "kanri@wise-ss.jp";
	private static String QUESTION_MANAGER_EMAIL = "kanri@wise-ss.jp";
	private static String QUESTION_TITLE = "[DavaoInvest] Question";

	@Autowired
	FaqService faqService;

	@RequestMapping(value = "/sendQuestion")
	public String sendQuestion(@PathVariable String languageCode, @ModelAttribute Question question,
							   HttpServletRequest request, Model model) throws Exception {

		try {
			MailContents mc = new MailContents();

			String body = getMailBody(question);

			mc.setFromEmail(FROM_EMAIL);
			mc.addToEmail(QUESTION_MANAGER_EMAIL);

			mc.setTitle(QUESTION_TITLE);
			mc.setBody(body);

			MailSender ms = new MailSender();
			ms.setMailContents(mc);
			ms.sendMail();

			question.setSendResult("SUCCESS");
		}catch (Exception e){
			e.printStackTrace();
			question.setSendResult("FAIL");
		}finally {
			faqService.insertQuestion(question);
		}

		model.addAttribute("alertMsg", "문의가 접수 되었습니다.");
		model.addAttribute("redirectUrl", "/"+languageCode+"/home");

		return "/common/alertRedirect";
	}

	private String getMailBody(Question question) {

		StringBuffer sb = new StringBuffer();
		sb.append("User Name : "+ question.getUserName()).append("<br/>")
		  .append("User Email : "+question.getUserEmail()).append("<br/><br/>")
		  .append("Question : "+question.getQuestion());

		return sb.toString();
	}
}
