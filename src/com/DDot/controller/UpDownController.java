package com.DDot.controller;

import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;
import com.DDot.model.MemberDto;
import com.DDot.model.UpDownDto;
import com.DDot.service.BbsService;
import com.DDot.service.CommService;
import com.DDot.service.UpDownService;

@Controller
public class UpDownController {
	
	private static final Logger logger = LoggerFactory.getLogger(UpDownController.class);

	@Autowired
	UpDownService upDownService;
	
	@Autowired
	BbsService bbsService;
	
	@Autowired
	CommService commService;
	
		// Ajax쓸  땐 ResponseBody 무조건 사용해야 데이터를 취득 가능
		@ResponseBody
		@RequestMapping(value = "updownbbsgood.do", method = {RequestMethod.GET,	RequestMethod.POST})
		public Map<String, Integer> updownbbsgood(HttpServletRequest req, Model model, int seq, UpDownDto updown) throws Exception {
			logger.info(" UpDownController updownbbsgood! "+ new Date());
			
			String nickname = ((MemberDto)req.getSession().getAttribute("login")).getNickname();	

			updown.setBbs_seq(seq);
			updown.setNickname(nickname);
			
			int resultBad = upDownService.getUpDownBbsBad(updown);
			int resultGood = upDownService.getUpDownBbsGood(updown);
			
			
			if(resultGood==0 && resultBad==1) {
				upDownService.deleteUpDownBbsBad(updown);
				upDownService.countBbsMinusBad(seq);
			}
			
			if(resultGood==1) {
				upDownService.deleteUpDownBbsGood(updown);
				upDownService.countBbsMinusGood(seq);
			}else if(resultGood==0){
				upDownService.writeUpDownBbsGood(updown);
				upDownService.countBbsPlusGood(seq);
			}
			
			Map<String, Integer> updownMap = new HashMap<String, Integer>();
			updownMap.put("up", bbsService.getBbs(seq).getUp());
			updownMap.put("down", bbsService.getBbs(seq).getDown());
			
			return updownMap;
		}
		
		@ResponseBody
		@RequestMapping(value = "updownbbsbad.do", method = {RequestMethod.GET,	RequestMethod.POST})
		public Map<String, Integer> updownbbsbad(HttpServletRequest req, Model model, int seq, UpDownDto updown) throws Exception {
			logger.info(" UpDownController updownbbsbad! "+ new Date());
			
			String nickname = ((MemberDto)req.getSession().getAttribute("login")).getNickname();	

			updown.setBbs_seq(seq);
			updown.setNickname(nickname);

			int resultGood = upDownService.getUpDownBbsGood(updown);
			int resultBad = upDownService.getUpDownBbsBad(updown);
			
			if(resultGood==1 && resultBad==0) {
				upDownService.deleteUpDownBbsGood(updown);
				upDownService.countBbsMinusGood(seq);
			}
			
			if(resultBad==1) {
				upDownService.deleteUpDownBbsBad(updown);
				upDownService.countBbsMinusBad(seq);
			}else if(resultBad==0){
				upDownService.writeUpDownBbsBad(updown);
				upDownService.countBbsPlusBad(seq);
			}

			Map<String, Integer> updownMap = new HashMap<String, Integer>();
			updownMap.put("up", bbsService.getBbs(seq).getUp());
			updownMap.put("down", bbsService.getBbs(seq).getDown());
			
			return updownMap;
		}
		
		@ResponseBody
		@RequestMapping(value = "updowncommgood.do", method = {RequestMethod.GET,	RequestMethod.POST})
		public Map<String, Integer> updowncommgood(HttpServletRequest req, Model model, int seq, UpDownDto updown) throws Exception {
			logger.info(" UpDownController updowncommgood! "+ new Date());
			
			String nickname = ((MemberDto)req.getSession().getAttribute("login")).getNickname();	

			updown.setComm_seq(seq);
			updown.setNickname(nickname);
			
			int resultBad = upDownService.getUpDownCommBad(updown);
			int resultGood = upDownService.getUpDownCommGood(updown);
			
			
			if(resultGood==0 && resultBad==1) {
				upDownService.deleteUpDownCommBad(updown);
				upDownService.countCommMinusBad(seq);
			}
			
			if(resultGood==1) {
				upDownService.deleteUpDownCommGood(updown);
				upDownService.countCommMinusGood(seq);
			}else if(resultGood==0){
				upDownService.writeUpDownCommGood(updown);
				upDownService.countCommPlusGood(seq);
			}
			
			Map<String, Integer> updownMap = new HashMap<String, Integer>();
			updownMap.put("up", commService.getComm(seq).getUp());
			updownMap.put("down", commService.getComm(seq).getDown());
			
			return updownMap;
		}
		
		@ResponseBody
		@RequestMapping(value = "updowncommbad.do", method = {RequestMethod.GET,	RequestMethod.POST})
		public Map<String, Integer> updowncommbad(HttpServletRequest req, Model model, int seq, UpDownDto updown) throws Exception {
			logger.info(" UpDownController updowncommbad! "+ new Date());
			
			String nickname = ((MemberDto)req.getSession().getAttribute("login")).getNickname();	

			updown.setComm_seq(seq);
			updown.setNickname(nickname);

			int resultGood = upDownService.getUpDownCommGood(updown);
			int resultBad = upDownService.getUpDownCommBad(updown);
			
			if(resultGood==1 && resultBad==0) {
				upDownService.deleteUpDownCommGood(updown);
				upDownService.countCommMinusGood(seq);
			}
			
			if(resultBad==1) {
				upDownService.deleteUpDownCommBad(updown);
				upDownService.countCommMinusBad(seq);
			}else if(resultBad==0){
				upDownService.writeUpDownCommBad(updown);
				upDownService.countCommPlusBad(seq);
			}
			
			Map<String, Integer> updownMap = new HashMap<String, Integer>();
			updownMap.put("up", commService.getComm(seq).getUp());
			updownMap.put("down", commService.getComm(seq).getDown());
			
			return updownMap;
		}

}
