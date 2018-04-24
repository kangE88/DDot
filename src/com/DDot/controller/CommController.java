package com.DDot.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.DDot.model.CommDto;
import com.DDot.model.ReplyDto;
import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;
import com.DDot.service.CommService;
import com.DDot.service.ReplyService;

@Controller
public class CommController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommController.class);

	@Autowired
	CommService commService;
	
	@Autowired
	ReplyService replyService;
	

		@RequestMapping(value="commlist.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String commlist(Model model, BbsParam param) throws Exception{
			logger.info("DDotCommController commlist"+ new Date());		
		
			System.out.println("param.toString()" + param.toString());
			
			// paging 처리
			int sn = param.getPageNumber();
			int start = (sn) * param.getRecordCountPerPage() + 1;
			int end = (sn+1) * param.getRecordCountPerPage();
			
			param.setStart(start);
			param.setEnd(end);
			
			int totalRecordCount = commService.getCommCount(param);
			List<CommDto> list = commService.getCommPagingList(param);
			model.addAttribute("commlist", list);
			
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);
			
			model.addAttribute("s_category", param.getS_category());
			model.addAttribute("s_keyword", param.getS_keyword());
			
			return "commlist.tiles";
		}
		
		@RequestMapping(value = "commwrite.do", method = {RequestMethod.GET,	RequestMethod.POST})
		public String commwrite(Model model) {
			logger.info(" DDotCommController Commwrite! "+ new Date());
			return "commwrite.tiles";
		}
		
		@RequestMapping(value = "commwriteAf.do", method = RequestMethod.POST)
		public String commwriteAf(CommDto comm, Model model) throws Exception {
			if(comm.getContent().equals("") || comm.getTitle().equals("") || comm.getNickname().equals("")){
				return "commwrite";
			}
			logger.info("DDotCommController commwriteAf! "+ new Date());
			commService.writeComm(comm);

			return "redirect:/commlist.do";
		}
		
		@RequestMapping(value = "commdetail.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String commdetail(int seq, ReplyDto reply, Model model) throws Exception {
			logger.info("DDotCommController commdetail! "+ new Date());
			CommDto comm=null;
			commService.readCount(seq);
			comm = commService.getComm(seq);
			model.addAttribute("comm", comm);
			
			// 댓글 쓰기
			if(reply.getNickname() !=null) {
				reply.setComm_seq(reply.getSeq());
				replyService.writeReplyComm(reply);
			}
			
			// 전체 댓글 가져오기
			List<ReplyDto> list = replyService.getReplyCommList(seq);
			model.addAttribute("replylist", list);
			
			// 댓글 count
			int count = replyService.getReplyCommCount(seq);
			model.addAttribute("replycount", count);
			
			return "commdetail.tiles";
		}
		
		@ResponseBody
		@RequestMapping(value = "replycountcomm.do", method = {RequestMethod.GET, RequestMethod.POST})
		public Map<String, Integer> replycountcomm(int seq, Model model) throws Exception {
			
			Map<String, Integer> replyMap = new HashMap<String, Integer>();
			replyMap.put("replycount", replyService.getReplyCommCount(seq));
			
			return replyMap;
		}
		

		@RequestMapping(value = "commdeletereply.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String bbsdetail(int seq, Model model) throws Exception {
			logger.info("DDotCommController commdeletereply! "+ new Date());

			replyService.deleteReply(seq);

			return "bbsdetail.tiles";
		}
		
		@RequestMapping(value = "commupdate.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String commupdate(int seq, Model model) throws Exception{
			logger.info("DDotCommController commupdate! "+ new Date());
			
			CommDto comm=commService.getComm(seq);		
			model.addAttribute("comm", comm);		
			return "commupdate.tiles";
		}
		
		@RequestMapping(value="commupdateAf.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String commupdateAf(Model model, CommDto comm) throws Exception{
			logger.info("DDotCommController commupdateAf"+ new Date());		
			
			commService.updateComm(comm);
			model.addAttribute("seq", comm.getSeq());
			return "redirect:/commdetail.do"; 
		}
		
		@RequestMapping(value="commdelete.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String commdelete(Model model, int seq) throws Exception{
			logger.info("DDotCommController commdelete"+ new Date());		
			
			commService.deleteComm(seq);

			return "redirect:/commlist.do";
		}
}
