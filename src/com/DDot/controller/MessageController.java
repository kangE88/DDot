package com.DDot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.DDot.model.MemberDto;
import com.DDot.model.MessageDto;
import com.DDot.model.MessagePagingDto;
import com.DDot.service.MemberService;
import com.DDot.service.MessageService;

@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	@Autowired
	MessageService msgService;
	@Autowired
	MemberService memService;
	
	@RequestMapping(value="messagelist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String messagelist(HttpServletRequest req,Model model,MessagePagingDto msgPagingDto,
			int category
			) throws Exception {
		logger.info("MessageController messagelist");
		
		
		if (category == 0) {
			String sendto = ((MemberDto)req.getSession().getAttribute("login")).getNickname();
			msgPagingDto.setSendto(sendto);
			msgPagingDto.setSenddel(2);
		}else if (category == 1) {
			String nickname = ((MemberDto)req.getSession().getAttribute("login")).getNickname();
			msgPagingDto.setNickname(nickname);
			msgPagingDto.setNickdel(2);
		}else if (category == 2) {
			String sendto = ((MemberDto)req.getSession().getAttribute("login")).getNickname();
			msgPagingDto.setSendto(sendto);
			msgPagingDto.setSenddel(0);
		}
		
		
		
		// 페이징 처리
		int sn = msgPagingDto.getPageNumber();
		int start = (sn) * msgPagingDto.getRecordCountPerPage() + 1;
		int end = (sn+1) * msgPagingDto.getRecordCountPerPage();
		
		msgPagingDto.setStart(start);
		msgPagingDto.setEnd(end);
		
		Map<String, Object> data = new HashMap<String,Object>();
		
		data.put("msgdto", msgPagingDto);
		data.put("category", category);
		
		int totalRecordCount = msgService.getMessageCount(data);
		List<MessageDto> list = msgService.getMessagePagingList(data);
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
			Model model,HttpServletRequest req,
			@RequestParam("seq") int seq,
			int category
			) throws Exception {
		
		logger.info("MessageController messagedetail");
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("seq", seq);
		data.put("category", category);
		
		MessageDto msg = msgService.getMessage(seq);
		if (category == 0 || category == 2) {
			if (msg.getSendread() == 0) {
				msgService.increaseRead(data);
				req.getSession().setAttribute("messagecount", msgService.checkMessage(msg.getNickname())-1);
				
			}
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
		
		
		return "redirect:/messagelist.do?category=0";
	}
	
	@RequestMapping(value="messagedelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String messageDelete(Model model,String checklist,Integer seq) throws Exception {
		
		logger.info("MessageController messagedelete");
		
		
		if (checklist != null) {
			msgService.deleteMessage(checklist.split(","));
		}else {
			String[] str = {String.valueOf(seq)};
			msgService.deleteMessage(str);
		}
		
		
		
		return "redirect:/messagelist.do?category=0";
	}
	
	@ResponseBody
	@RequestMapping(value="checkmessage.do", method={RequestMethod.GET, RequestMethod.POST})
	public Integer checkMessage(HttpServletRequest req, Model model,String nickname) throws Exception {
		
		int count=0;
		
		count = msgService.checkMessage(nickname);
		//System.out.println(count);
		req.getSession().setAttribute("messagecount", count);
		
		
		return count;
	}
	
	@ResponseBody
	@RequestMapping(value="messageCheckNick.do", method={RequestMethod.GET, RequestMethod.POST})
	public Integer messageCheckNick(Model model,MemberDto mem) throws Exception {
		
		int count=0;
		
		count = memService.getNickname(mem);
		//System.out.println(count);
		
		
		return count;
	}
	
}
