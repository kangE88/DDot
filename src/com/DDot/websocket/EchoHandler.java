package com.DDot.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.DDot.model.MessageVo;
import com.DDot.singleton.ConnectChatUserList;
import com.google.gson.Gson;

public class EchoHandler extends TextWebSocketHandler {

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	/**
	 * 
	 * 클라이언트 연결 이후에 실행되는 메소드
	 * 
	 */

	@Override
	public void afterConnectionEstablished(WebSocketSession session)

			throws Exception {

		sessionList.add(session);

		logger.info("{} 연결됨", session.getId());

		Map<String, Object> map = session.getAttributes();
		String userNickname = (String) map.get("nickname");
		System.out.println("닉네임 : " + userNickname);

		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage("<p class='alertchat'>"+userNickname + "님이 입장하였습니다.</p>"));
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

		Map<String, Object> map = session.getAttributes();
		String userNickname = (String) map.get("nickname");

		if (msgVo.isFisrt) {

		} else {

			for (WebSocketSession sess : sessionList) {
				if (sess.equals(session)) {
					sess.sendMessage(new TextMessage("<p class='mychat'>"+ userNickname + ":" + msgVo.message+"</p>"));
				} else {
					sess.sendMessage(new TextMessage("<p class='otherchat'>"+ userNickname + ":" + msgVo.message+"</p>"));
				}
			}
		}
	}

	/*
	 * 
	 * 클라이언트가 연결을 끊었을 때 실행되는 메소드
	 * 
	 */

	@Override

	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		Map<String, Object> map = session.getAttributes();
		String userNickname = (String) map.get("nickname");
		System.out.println("나간사람아이디 : " + userNickname);

		sessionList.remove(session);

		// 리스트get
		List<String> list = ConnectChatUserList.getInstance().userMap.get("userlist");
		// 리스트에 유저 제외
		list.remove(userNickname);
		// map에 wrapping
		ConnectChatUserList.getInstance().userMap.put("userlist", list);

		if (sessionList.size() > 0) {

			for (WebSocketSession sess : sessionList) {

				sess.sendMessage(new TextMessage(userNickname + "님이 퇴장하였습니다."));

			}
		}

		logger.info("{} 연결 끊김", session.getId());

	}

}
