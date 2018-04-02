package com.DDot.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.DDot.model.MemberDto;
import com.DDot.model.YesMember;
import com.DDot.service.MemberService;

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
	public String regiAf(MemberDto mem, Model model)throws Exception{
		logger.info("DDotMemberController regiAf");	
		
/*		System.out.println("======== MEMBER ========");
		System.out.println("id==>"+mem.getId());
		System.out.println("pwd==>"+mem.getPwd());

		System.out.println("nickname==>"+mem.getNickname());
		System.out.println("Email===>"+mem.getEmail());
		
		System.out.println("pic===>"+mem.getPic());
		System.out.println("intro==>"+mem.getIntro());
		System.out.println("======== MEMBER ========");*/
		
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
			return "redirect:/main.do";
		}else {
			return "redirect:/login.do";
		}		
	}
	
	@RequestMapping(value="logout.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String logout() {
		return "login.tiles";
	}
}













