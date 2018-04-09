package com.DDot.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.DDot.model.MessageDto;
import com.DDot.model.MessagePagingDto;
import com.DDot.service.MessageService;

@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MessageService msgService;
	
	@RequestMapping(value="messagelist.do", method=RequestMethod.GET)
	public String messagelist(Model model,MessagePagingDto msgPagingDto) throws Exception {
		logger.info("MessageController messagelist");
		
		// 페이징 처리
		int sn = msgPagingDto.getPageNumber();
		int start = (sn) * msgPagingDto.getRecordCountPerPage() + 1;
		int end = (sn+1) * msgPagingDto.getRecordCountPerPage();
		
		msgPagingDto.setStart(start);
		msgPagingDto.setEnd(end);
		
		int totalRecordCount = msgService.getMessageCount(msgPagingDto);
		List<MessageDto> list = msgService.getMessagePagingList(msgPagingDto);
		model.addAttribute("msglist", list);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", msgPagingDto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		return "messagelist.tiles";
	}
	
	@RequestMapping(value="messagedetail.do", method=RequestMethod.GET)
	public String messagedetail(Model model) {
		
		logger.info("MessageController messagedetail");
		return "messagedetail.tiles";
	}
	
	@RequestMapping(value="messagewrite.do", method=RequestMethod.GET)
	public String messagewrite(Model model) {
		
		logger.info("MessageController messagewrite");
		return "messagewrite.tiles";
	}
}
