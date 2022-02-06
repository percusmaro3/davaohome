package com.davaohome.web.controller.home;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
//@RequestMapping("/{languageCode}")
public class HomeController2 {

	private static final Logger log = LoggerFactory.getLogger(HomeController2.class);

    private boolean isTest(HttpServletRequest request){

        String requestURL = request.getRequestURL().toString();
        return requestURL.indexOf("test.") != -1;
    }

//    @RequestMapping(value = "/**")
//    public String renewal(@PathVariable String languageCode, HttpServletRequest request, Model model) throws Exception {
//
//        System.out.println("getRequestURL " +request.getRequestURL());
//        System.out.println("getRequestURI " +request.getRequestURI());
//        System.out.println("getPathInfo " +request.getPathInfo());
//        return "/notice/renewal";
//    }

	@RequestMapping(value = "/main")
	public String main(@PathVariable String languageCode, HttpServletRequest request, Model model) throws Exception {

        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/index";

	}


	@RequestMapping(value = "/company")
	public String company(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
		return "/company/company";
	}

	@RequestMapping(value = "/company/outline")
	public String outline(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
		return "/company/outline";
	}

	@RequestMapping(value = "/company/history")
	public String history(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
		return "/company/history";
	}

    @RequestMapping(value = "/company/ceo")
    public String ceo(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/company/ceo";
    }

    @RequestMapping(value = "/company/globalNetwork")
    public String globalNetwork(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/company/globalNetwork";
    }

    @RequestMapping(value = "/company/management")
    public String management(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/company/management";
    }

    @RequestMapping(value = "/company/branch")
    public String branch(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/company/branch";
    }

    @RequestMapping(value = "/company/contact")
    public String contact(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/company/contact";
    }

	@RequestMapping(value = "/business")
	public String business(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
		return "/business/business";
	}

    @RequestMapping(value = "/business/comm")
    public String comm(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/business/comm";
    }

    @RequestMapping(value = "/business/fashion")
    public String fashion(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/business/fashion";
    }

    @RequestMapping(value = "/business/franchise")
    public String food(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/business/franchise";
    }

    @RequestMapping(value = "/business/realEstate")
    public String realEstate(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/business/realEstate";
    }

    @RequestMapping(value = "/business/tour")
    public String tour(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/business/tour";
    }


	@RequestMapping(value = "/notice")
	public String notice(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
		return "/notice";
	}

    @RequestMapping(value = "/notice/news")
    public String news(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/notice/news";
    }

    @RequestMapping(value = "/notice/promotion")
    public String promotion(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/notice/promotion";
    }

    @RequestMapping(value = "/recruit/homeFuture")
    public String homeFuture(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/recruit/homeFuture";
    }

    @RequestMapping(value = "/recruit/recruit")
    public String recruit(HttpServletRequest request, Model model) throws Exception {
        if( !isTest(request) )
            return "/notice/renewal";
        else
        return "/recruit/recruit";
    }

}
