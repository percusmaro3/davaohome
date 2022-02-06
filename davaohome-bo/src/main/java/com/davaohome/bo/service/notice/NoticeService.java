package com.davaohome.bo.service.notice;

import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.model.notice.Notice;
import com.davaohome.bo.model.notice.NoticeContents;
import com.davaohome.bo.model.notice.NoticeSearchParam;
import com.davaohome.bo.repository.notice.NoticeRepository;
import com.davaohome.utils.CnvBoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;

	@Transactional(rollbackFor = Exception.class)
	public void insertNotice(Notice notice) {

		Integer noticeNo = noticeRepository.insertNotice(notice);

		for (NoticeContents nc : notice.getContentsMap().values()) {
			nc.setNoticeNo(noticeNo);
			noticeRepository.insertNoticeContents(nc);
		}
	}

	@Transactional(rollbackFor = Exception.class)
	public void updateNotice(Notice notice) {

		noticeRepository.updateNotice(notice);

		noticeRepository.deleteNoticeContents(notice.getNoticeNo());
		for (NoticeContents nc : notice.getContentsMap().values()) {
			noticeRepository.insertNoticeContents(nc);
		}
	}

	public Notice getNotice(Integer noticeNo) {

		Notice notice = noticeRepository.getNotice(noticeNo);
		List<NoticeContents> contentsList = noticeRepository.getNoticeContents(noticeNo);

		notice.setContentsMap(CnvBoUtil.convertListToLanguageMap(contentsList));

		return notice;
	}

	public Notice getNoticeWithLanguage(Integer noticeNo, String language) {

		return noticeRepository.getNoticeWithLanguage(noticeNo, language);
	}

	public PagerResult getNoticeList(NoticeSearchParam noticeSearchParam) {

		return noticeRepository.getNoticeList(noticeSearchParam);
	}

	public List<NoticeContents> getNoticeContents(Integer noticeNo) {

		return noticeRepository.getNoticeContents(noticeNo);
	}
}
