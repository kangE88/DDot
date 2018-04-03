package com.DDot.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.DDot.model.MessageVo;
import com.google.gson.Gson;

public class EchoHandler extends TextWebSocketHandler {
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	public static HashMap<String, String> usersMap = new HashMap<String, String>(); 
	/**
	 * 
	 * 클라이언트 연결 이후에 실행되는 메소드
	 * 
	 */

	@Override
	public void afterConnectionEstablished(WebSocketSession session)

			throws Exception {
		
		
		sessionList.add(session);
		ServletServerHttpRequest sseq;
		

		logger.info("{} 연결됨", session.getId());
		
		Map<String,Object> map = session.getAttributes();
		  String userNickname = (String)map.get("nickname");
		  usersMap.put(session.getId(), userNickname);
		  System.out.println("닉네임 : " + userNickname);
		  
		for (WebSocketSession sess : sessionList) {

			sess.sendMessage(new TextMessage(userNickname + "님이 입장하였습니다."));
		}
	}

	/**
	 * 
	 * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
	 * 
	 */

	@Override

	protected void handleTextMessage(WebSocketSession session,

			TextMessage message) throws Exception {

		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
		String msg = message.getPayload();
		Gson gson = new Gson();
		MessageVo msgVo = gson.fromJson(msg, MessageVo.class);
		
		Map<String,Object> map = session.getAttributes();
		String userNickname = (String)map.get("nickname");
		
		if (msgVo.isFisrt) {
			
		
			for (WebSocketSession sess : sessionList) {

				sess.sendMessage(new TextMessage(userNickname + ":" + msgVo.message));

			}
		}else {
			
		}
			for (WebSocketSession sess : sessionList) {

				sess.sendMessage(new TextMessage(userNickname + ":" + msgVo.message));

		}
	}

	/*
	 * 
	 * 클라이언트가 연결을 끊었을 때 실행되는 메소드
	 * 
	 */

	@Override

	public void afterConnectionClosed(WebSocketSession session,

			CloseStatus status) throws Exception {

		
		Map<String,Object> map = session.getAttributes();
		  String userId = (String)map.get("userId");
		  System.out.println("나간사람아이디 : " + userId);
		  
		  sessionList.remove(session);
		  usersMap.remove(session.getId());
		  
		  if (sessionList.size() > 0) {
			
		
		   	  for (WebSocketSession sess : sessionList) {

			  sess.sendMessage(new TextMessage(userId+"님이 퇴장하였습니다."));

			}
		  }
		
		logger.info("{} 연결 끊김", session.getId());
		
		
	}

}
