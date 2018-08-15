package com.DDot.websocket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.DDot.model.ChatVo;
import com.DDot.singleton.ConnectChatUserList;
import com.google.gson.Gson;

public class EchoHandler extends TextWebSocketHandler {

   private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
   //리스트
   //private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
   //맵
   private Map<String,WebSocketSession> sessionList = new HashMap<String,WebSocketSession>();

   /**
    * 
    * 클라이언트 연결 이후에 실행되는 메소드
    * 
    */

   @Override
   public void afterConnectionEstablished(WebSocketSession session)

         throws Exception {
      //리스트
      //sessionList.add(session);

      logger.info("{} 연결됨", session.getId());

      Map<String, Object> map = session.getAttributes();
      String userNickname = (String) map.get("nickname");
      sessionList.put(userNickname, session);
      System.out.println("닉네임 : " + userNickname);
      
      

      for (String user : sessionList.keySet()) {
         sessionList.get(user).sendMessage(new TextMessage("<p class='alertchat'>"+userNickname+"님이 입장하였습니다.</p>"));
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

      String chat = message.getPayload();
      Gson gson = new Gson();
      ChatVo chatVo = gson.fromJson(chat, ChatVo.class);
      /*
      Map<String, Object> map = session.getAttributes();
      String userNickname = (String) map.get("nickname");
      */

      if (chatVo.isFisrt) {

      } else {

         for (String user : sessionList.keySet()) {
            if (sessionList.get(user).equals(session)) {
               sessionList.get(user).sendMessage(new TextMessage("<p class='mychat'>"+ chatVo.nickname + ":" + chatVo.message+"</p>"));
            } else {
               sessionList.get(user).sendMessage(new TextMessage("<p class='otherchat'>"+ chatVo.nickname + ":" + chatVo.message+"</p>"));
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

      sessionList.remove(userNickname);

      // 리스트get
      List<String> list = ConnectChatUserList.getInstance().userMap.get("userlist");
      // 리스트에 유저 제외
      list.remove(userNickname);
      // map에 wrapping
      ConnectChatUserList.getInstance().userMap.put("userlist", list);

      if (sessionList.size() > 0) {

         for (String user : sessionList.keySet()) {

            sessionList.get(user).sendMessage(new TextMessage("<p class='alertchat'>"+userNickname + "님이 퇴장하였습니다.</p>"));

         }
      }

      logger.info("{} 연결 끊김", session.getId());

   }

}