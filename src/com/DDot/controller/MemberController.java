package com.DDot.controller;

import java.io.File;
import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.DDot.model.MemberDto;
import com.DDot.model.YesMember;
import com.DDot.service.MemberService;

import com.DDot.util.FUpUtil;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService MemberService;
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String login(Model model) {
		
		logger.info("MemberController login");
		return "login.tiles";
	}

	@RequestMapping(value="regi.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String regi(Model model) {
		logger.info("MemberController regi");
		
		return "regi.tiles";
	}

	@RequestMapping(value="main.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String main() {
		
		return "main.tiles";
	}

/*	@RequestMapping(value="kakaoLogin.do", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest req, HttpServletResponse reps) {
		logger.info("MemberController kakaoLogin");
		
		System.out.println("code==>"+code);
		
		return "main.do";
	}*/
	
	@RequestMapping(value="labatory.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String labatory() {
		
		return "labatory.tiles";
	}
	
	@RequestMapping(value="donate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String donate() {
		
		return "donate.tiles";
	}
	
	@RequestMapping(value="attendance.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String attendance() {
		
		return "attendance.tiles";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="getID.do", method=RequestMethod.POST)
	public YesMember getID(Model model, MemberDto mem) {
		logger.info("KhMemberController getID");
		
		int count = 0;
		
		try {
			count = MemberService.getID(mem);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		YesMember yes = new YesMember();
		
		if(count > 0) {
			yes.setMessage("SUCS");
		}else {
			yes.setMessage("FAIL");
		}
		
		return yes;
		
	}
	
	@RequestMapping(value="regiAf.do", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public String regiAf(MemberDto mem, HttpServletRequest req, @RequestParam(value="pic", required=false) MultipartFile pic, Model model)throws Exception{
		logger.info("DDotMemberController regiAf");	
		
		System.out.println("pic==>"+pic);
		
		System.out.println("pic.getOriginalFilename()===>"+pic.getOriginalFilename());
		
		mem.setPic(pic.getOriginalFilename());
		
		//파일 경로(서버)
		//String fupload = req.getServletContext().getRealPath("/upload");
		
		//파일경로(폴더)
		String fupload = "c:\\upload";
		logger.info("fupload:"+fupload);
		
		String f = mem.getPic();
		
		String newFile= FUpUtil.getNewFile(f);
		
		logger.info(fupload + "/" + newFile);
		mem.setPic(newFile);
		
		try {
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, pic.getBytes());
			
			// db insert 부분
			MemberService.addmember(mem);
			
			logger.info("PdsController pdsupload success!!!");
			
		}catch (IOException e) {
			logger.info("PdsController pdsupload fail!!!");
		}
		
		
		MemberService.addmember(mem);
		
		return "login.tiles";
	}	

	@RequestMapping(value="loginAf.do", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public String loginAf(HttpServletRequest req, MemberDto mem, Model model) throws Exception {
		logger.info("MemberController loginAf");
		
		MemberDto login = null;
		login = MemberService.login(mem);
		
		if(login != null && !login.getId().equals("")) {
			System.out.println("loginAf in");
			req.getSession().setAttribute("login", login);
			req.getSession().setAttribute("chatstat", 0);
			return "redirect:/main.do";
		}else {
			return "redirect:/login.do";
		}		
	}
	
	@RequestMapping(value="userInfo.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userInfo() throws Exception {
		
		return "userInfo.tiles";
	}
	
	@RequestMapping(value="logout.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().invalidate();
		
		return "redirect:/index.jsp";
	}
}













