package com.davaohome.web.controller.home;

import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.model.notice.Notice;
import com.davaohome.bo.model.notice.NoticeSearchParam;
import com.davaohome.bo.service.notice.NoticeService;
import com.davaohome.web.common.CnvAdminConstant;
import com.davaohome.web.common.pager.PagerMaker;
import com.davaohome.web.common.pager.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/{languageCode}")
public class HomeController {

	private static final Logger log = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    NoticeService noticeService;

    private boolean isTest(HttpServletRequest request){

        String requestURL = request.getRequestURL().toString();
        return requestURL.indexOf("test.") != -1;
    }

	@RequestMapping(value = "/home")
	public String home(@PathVariable String languageCode, HttpServletRequest request, Model model) throws Exception {

        setTopNoticeList(languageCode, model);
        return "/web/home";
	}


	private void setTopNoticeList(String languageCode, Model model){
        NoticeSearchParam noticeSearchParam = new NoticeSearchParam();
        noticeSearchParam.setLanguage(languageCode);

        Pagination paging = PagerMaker.makePagerWithIndexSet(1, 5, noticeSearchParam);
        PagerResult pr = noticeService.getNoticeList(noticeSearchParam);
        paging.setTotalItemCount(pr.getTotalResultCount());

        List<Notice> noticeList = (List<Notice>)pr.getResult();

        model.addAttribute("noticeList", noticeList);
    }

	@RequestMapping(value = "/company")
	public String company(HttpServletRequest request, Model model) throws Exception {
		return "/web/company";
	}

	@RequestMapping(value = "/guide")
	public String guide(HttpServletRequest request, Model model) throws Exception {
		return "/web/guide";
	}

	@RequestMapping(value = "/introduce")
	public String introduce(HttpServletRequest request, Model model) throws Exception {
		return "/web/introduce";
	}

    @RequestMapping(value = "/list01")
    public String list01(HttpServletRequest request, Model model) throws Exception {
        return "/web/list01";
    }

    @RequestMapping(value = "/list02")
    public String list02(HttpServletRequest request, Model model) throws Exception {
        return "/web/list02";
    }

    @RequestMapping(value = "/list03")
    public String list03(HttpServletRequest request, Model model) throws Exception {
        return "/web/list03";
    }

    @RequestMapping(value = "/news")
    public String news(@PathVariable String languageCode, @RequestParam(required = false, defaultValue = "1") Integer page, HttpServletRequest request, Model model) throws Exception {

        NoticeSearchParam noticeSearchParam = new NoticeSearchParam();
        noticeSearchParam.setLanguage(languageCode);

        Pagination paging = PagerMaker.makePagerWithIndexSet(page, 2, noticeSearchParam);
        PagerResult pr = noticeService.getNoticeList(noticeSearchParam);
        paging.setTotalItemCount(pr.getTotalResultCount());

        model.addAttribute("paging", paging);
        model.addAttribute("noticeList", pr.getResult());

        return "/web/news";
    }

    @RequestMapping(value = "/partner")
    public String partner(HttpServletRequest request, Model model) throws Exception {
        return "/web/partner";
    }

    @RequestMapping(value = "/performance")
    public String performance(HttpServletRequest request, Model model) throws Exception {
        return "/web/performance";
    }

    @RequestMapping(value = "/question")
    public String question(HttpServletRequest request, Model model) throws Exception {
        return "/web/question";
    }

    @RequestMapping(value = "/strength")
    public String strength(HttpServletRequest request, Model model) throws Exception {
        return "/web/strength";
    }

}
