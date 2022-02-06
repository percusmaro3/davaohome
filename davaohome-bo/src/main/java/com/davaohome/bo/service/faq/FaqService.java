package com.davaohome.bo.service.faq;

import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.model.faq.Faq;
import com.davaohome.bo.model.faq.FaqContents;
import com.davaohome.bo.model.faq.FaqSearchParam;
import com.davaohome.bo.model.faq.Question;
import com.davaohome.bo.repository.faq.FaqRepository;
import com.davaohome.utils.CnvBoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FaqService {

	@Autowired
	private FaqRepository faqRepository;

	@Transactional(rollbackFor = Exception.class)
	public void insertFaq(Faq faq) {

		Integer faqNo = faqRepository.insertFaq(faq);

		for (FaqContents nc : faq.getContentsMap().values()) {
			nc.setFaqNo(faqNo);
			faqRepository.insertFaqContents(nc);
		}
	}

	@Transactional(rollbackFor = Exception.class)
	public void updateFaq(Faq faq) {

		faqRepository.updateFaq(faq);

		faqRepository.deleteFaqContents(faq.getFaqNo());
		for (FaqContents nc : faq.getContentsMap().values()) {
			faqRepository.insertFaqContents(nc);
		}
	}

	public Faq getFaq(Integer faqNo) {

		Faq faq = faqRepository.getFaq(faqNo);
		List<FaqContents> contentsList = faqRepository.getFaqContents(faqNo);

		faq.setContentsMap(CnvBoUtil.convertListToLanguageMap(contentsList));

		return faq;
	}

	public Faq getFaqWithLanguage(Integer faqNo, String language) {

		return faqRepository.getFaqWithLanguage(faqNo, language);
	}

	public PagerResult getFaqList(FaqSearchParam faqSearchParam) {

		return faqRepository.getFaqList(faqSearchParam);
	}

	public List<FaqContents> getFaqContents(Integer faqNo) {

		return faqRepository.getFaqContents(faqNo);
	}

	public void insertQuestion(Question question) {

		faqRepository.insertQuestion(question);
	}

}
