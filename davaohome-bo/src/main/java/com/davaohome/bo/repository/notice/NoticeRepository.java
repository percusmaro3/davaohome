package com.davaohome.bo.repository.notice;

import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.model.notice.Notice;
import com.davaohome.bo.model.notice.NoticeContents;
import com.davaohome.bo.model.notice.NoticeSearchParam;
import com.davaohome.bo.repository.base.BaseRepository;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class NoticeRepository extends BaseRepository {

	private static final String PREFIX = "notice.";

	public Integer insertNotice(Notice notice) {

		this.sql.insert(PREFIX + "insertNotice", notice);

		return notice.getNoticeNo();
	}

	public void updateNotice(Notice notice) {

		this.sql.insert(PREFIX + "updateNotice", notice);
	}

	public Notice getNotice(Integer noticeNo) {

		return this.sql.selectOne(PREFIX + "getNotice", noticeNo);
	}

	public PagerResult getNoticeList(NoticeSearchParam noticeSearchParam) {

		return this.selectPagerList(PREFIX + "getNoticeList", noticeSearchParam);
	}

	public Notice getNoticeWithLanguage(Integer noticeNo, String language) {
		Map<String, Object> param = new HashMap<>();
		param.put("noticeNo", noticeNo);
		param.put("language", language);

		return this.sql.selectOne(PREFIX + "getNoticeWithLanguage", param);
	}

	public List<NoticeContents> getNoticeContents(Integer noticeNo) {

		return this.sql.selectList(PREFIX + "getNoticeContents", noticeNo);
	}

	public void insertNoticeContents(NoticeContents noticeContents) {
		this.sql.insert(PREFIX + "insertNoticeContents", noticeContents);
	}

	public void deleteNoticeContents(Integer noticeNo) {
		this.sql.delete(PREFIX + "deleteNoticeContents", noticeNo);
	}
}
