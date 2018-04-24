package com.DDot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.DDot.email.Email;
import com.DDot.email.EmailSender;
import com.DDot.model.MemberDto;
import com.DDot.service.MemberService;

@Controller
public class EmailController  {
     
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;
	
	@Autowired
	MemberService memberservise;
	
	@ResponseBody
    @RequestMapping(value="sendpw.do", method= {RequestMethod.GET, RequestMethod.POST})
    public String sendEmailAction (MemberDto mem, Model model) throws Exception {
	    
	    System.out.println("sendEmailAction!");
	    System.out.println(mem.toString());
	    
	    String id=mem.getId();
	    String e_mail=mem.getEmail();
	    String pw=memberservise.findPWD(mem);
	    
	    System.out.println(id);
	    System.out.println(e_mail);
	    
	    System.out.println(pw);
	    System.out.println("====go======");
	    if(pw!=null) {
	        email.setContent("비밀번호는 "+pw+" 입니다.");
		    email.setReceiver(e_mail);
		    email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
		    emailSender.SendEmail(email);
		    
		    return "login.do";
	    }else {
	        return "logout.do";
	    }
    }
}