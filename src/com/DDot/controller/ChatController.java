package com.DDot.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "chatting.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		
		return "chat.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "chatstatus.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void chatStatus(Locale locale, Model model,HttpServletRequest req, int chatstat) {
		logger.info("채팅의 상태야!!! {}.", chatstat);
		
		req.getSession().setAttribute("chatstatus", chatstat);
		
		return ;
	}
	
}
