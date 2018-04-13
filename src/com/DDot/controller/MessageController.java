package com.DDot.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.DDot.model.MemberDto;
import com.DDot.model.MessageDto;
import com.DDot.model.MessagePagingDto;
import com.DDot.service.MessageService;

@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MessageService msgService;
	
	@RequestMapping(value="messagelist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String messagelist(HttpServletRequest req,Model model,MessagePagingDto msgPagingDto,
			int category
			) throws Exception {
		logger.info("MessageController messagelist");
		
		
		if (category == 0) {
			String sendto = ((MemberDto)req.getSession().getAttribute("login")).getNickname();
			msgPagingDto.setSendto(sendto);
		}else if (category == 1) {
			String nickname = ((MemberDto)req.getSession().getAttribute("login")).getNickname();
			msgPagingDto.setNickname(nickname);
		}else if (category == 2) {
			String sendto = ((MemberDto)req.getSession().getAttribute("login")).getNickname();
			msgPagingDto.setSendto(sendto);
			msgPagingDto.setDel(0);
		}
		
		
		
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
		model.addAttribute("category", category);
		
		return "messagelist.tiles";
	}
	
	@RequestMapping(value="messagedetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String messagedetail(
			Model model,
			@RequestParam("seq") int seq,
			int category
			) throws Exception {
		
		logger.info("MessageController messagedetail");
		
		MessageDto msg = msgService.getMessage(seq);
		if (msg.getRead() == 0) {
			msgService.increaseRead(seq);
		}
		model.addAttribute("msg", msg);
		model.addAttribute("category", category);
		
		return "messagedetail.tiles";
	}
	
	@RequestMapping(value="messagewrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String messagewrite(Model model,
			String replyname) {
		
		logger.info("MessageController messagewrite");
		
		if (replyname != null) {
			model.addAttribute("replyname", replyname);
		}
		
		return "messagewrite.tiles";
	}
	
	@RequestMapping(value="messagewriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String messagewriteAf(Model model,MessageDto msgDto) throws Exception {
		
		logger.info("MessageController messagewrite");
		msgService.writeMessage(msgDto);
		
		
		return "redirect:/messagelist.do";
	}
	
	@RequestMapping(value="messagedelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String messageDelete(Model model,int seq) throws Exception {
		
		logger.info("MessageController messagedelete");
		msgService.deleteMessage(seq);
		
		
		return "redirect:/messagelist.do";
	}
}
