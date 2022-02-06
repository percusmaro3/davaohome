package com.davaohome.bo.repository.faq;

import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.model.faq.Faq;
import com.davaohome.bo.model.faq.FaqContents;
import com.davaohome.bo.model.faq.FaqSearchParam;
import com.davaohome.bo.model.faq.Question;
import com.davaohome.bo.repository.base.BaseRepository;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FaqRepository extends BaseRepository {

	private static final String PREFIX = "faq.";

	public Integer insertFaq(Faq faq) {

		this.sql.insert(PREFIX + "insertFaq", faq);

		return faq.getFaqNo();
	}

	public void insertQuestion(Question question) {

		this.sql.insert(PREFIX + "insertQuestion", question);
	}

	public void updateFaq(Faq faq) {

		this.sql.insert(PREFIX + "updateFaq", faq);
	}

	public Faq getFaq(Integer faqNo) {

		return this.sql.selectOne(PREFIX + "getFaq", faqNo);
	}

	public PagerResult getFaqList(FaqSearchParam faqSearchParam) {

		return this.selectPagerList(PREFIX + "getFaqList", faqSearchParam);
	}

	public Faq getFaqWithLanguage(Integer faqNo, String language) {
		Map<String, Object> param = new HashMap<>();
		param.put("faqNo", faqNo);
		param.put("language", language);

		return this.sql.selectOne(PREFIX + "getFaqWithLanguage", param);
	}

	public List<FaqContents> getFaqContents(Integer faqNo) {

		return this.sql.selectList(PREFIX + "getFaqContents", faqNo);
	}

	public void insertFaqContents(FaqContents faqContents) {
		this.sql.insert(PREFIX + "insertFaqContents", faqContents);
	}

	public void deleteFaqContents(Integer faqNo) {
		this.sql.delete(PREFIX + "deleteFaqContents", faqNo);
	}
}
