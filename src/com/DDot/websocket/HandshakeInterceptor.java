package com.DDot.websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;

import com.DDot.model.MemberDto;
import com.DDot.singleton.ConnectChatUserList;


public class HandshakeInterceptor implements org.springframework.web.socket.server.HandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		// 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
        System.out.println("Before Handshake");
          
          
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
  
        HttpServletRequest req =  ssreq.getServletRequest();
 
        /*String userId = req.getParameter("userid");
        System.out.println("param, id:"+userId);
        attributes.put("userId", userId);*/
  
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
        
        MemberDto dto = (MemberDto)req.getSession().getAttribute("login");
        String nickname = dto.getNickname();
        attributes.put("nickname", nickname);
        System.out.println("HttpSession에 저장된 nickname:"+nickname);
        
       return true;


	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
/*		System.out.println("After Handshake");
        
        
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
  
        HttpServletRequest req =  ssreq.getServletRequest();
 
        
  
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
        
        MemberDto dto = (MemberDto)req.getSession().getAttribute("login");
        String nick = dto.getNickname();
        ConnectChatUserMap.getInstance().usersMap.remove(nick, nick);*/
	}

}
