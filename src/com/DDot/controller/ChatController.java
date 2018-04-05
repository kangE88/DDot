package com.DDot.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.DDot.model.MemberDto;
import com.DDot.singleton.ConnectChatUserList;

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
	public String home(Locale locale, Model model, HttpServletRequest req) {
		logger.info("Welcome home! The client locale is {}.", locale);
		//닉네임받아오기
		String nick = ((MemberDto)req.getSession().getAttribute("login")).getNickname();
		//리스트get
		List<String> list = ConnectChatUserList.getInstance().userMap.get("userlist");
		//리스트에 유저 추가
		list.add(nick);
		//map에 wrapping
		ConnectChatUserList.getInstance().userMap.put("userlist", list);
		
		for (String str : ConnectChatUserList.getInstance().userMap.get("userlist")) {
			System.out.println("chat컨트롤러에서 세팅한 유저리스트 : " + str);
		}
		//req.getSession().setAttribute("userlist", ConnectChatUserList.getInstance().userMap.get("userlist"));
		
		return "chat.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "chatstatus.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void chatStatus(Locale locale, Model model,HttpServletRequest req, int chatstat) {
		logger.info("채팅의 상태야!!! {}.", chatstat);
		
		req.getSession().setAttribute("chatstatus", chatstat);
		
		return ;
	}
	
	@ResponseBody
	@RequestMapping(value = "chatuser.do", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, List<String>> chatStatus(Locale locale, Model model,HttpServletRequest req) {
		
		logger.info("채팅접속자 파악 {}.", ConnectChatUserList.getInstance().userMap.get("userlist").size());
		
		return ConnectChatUserList.getInstance().userMap;
	}
	
}
