package com.davaohome.web.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davaohome.exception.WithLogException;
import com.davaohome.web.util.ExceptionLogUtils;
import org.apache.commons.httpclient.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
@RequestMapping("/error")
public class ErrorHandleController {

	private static final Logger log = LoggerFactory.getLogger(ErrorHandleController.class);

	@ExceptionHandler(Throwable.class)
	public ModelAndView handleException(HttpServletRequest request, HttpServletResponse response, Exception ex) {

		reportException(request, ex);

		if (isJson(request)) {
			return makeErrorJsonResult();
		} else {
			return makeErrorHtmlPage(HttpStatus.SC_INTERNAL_SERVER_ERROR, ex);
		}
	}

	@RequestMapping("/error")
	public ModelAndView errorInfo(@RequestParam Integer status, HttpServletRequest request,
								  HttpServletResponse response, Exception exception) {

		return makeErrorHtmlPage(status, exception);
	}

	private ModelAndView makeErrorJsonResult() {

		return null;
	}

	private boolean isJson(HttpServletRequest request) {
		return false;
	}


	private ModelAndView makeErrorHtmlPage(Integer status, Exception ex) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/error/error");
		mav.addObject("httpStatusCode", status);

		if (ex != null) {
			StringWriter sw = new StringWriter();
			ex.printStackTrace(new PrintWriter(sw));
			mav.addObject("exceptionStr", sw.toString());
		}

		return mav;
	}

	private void reportException(HttpServletRequest request, Exception ex) {
		String requestInfo = ExceptionLogUtils.getRequestInfo(request);

		loggingException(requestInfo, ex);
		sendExceptionMail(requestInfo, ex);
	}

	private void sendExceptionMail(String requestInfo, Exception ex) {
		// if release, Send mailbak to Developer
	}

	private void loggingException(String requestInfo, Exception ex) {

		if (ex == null) {
			log.error(requestInfo);
		} else if (ex instanceof WithLogException) {
			((WithLogException) ex).writeLog(log, requestInfo);
		} else {
			if (ex.getCause() != null) {
				log.error(requestInfo, ex.getCause());
			} else {
				log.error(requestInfo, ex);
			}
		}
	}
}
