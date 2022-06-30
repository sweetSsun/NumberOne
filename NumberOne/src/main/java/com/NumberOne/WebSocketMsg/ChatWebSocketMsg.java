package com.NumberOne.WebSocketMsg;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.NumberOne.dto.ChatDto;
import com.google.gson.Gson;

public class ChatWebSocketMsg extends TextWebSocketHandler {

	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished() 호출");
//		sessionList.add(session);
		
		Map<String, Object> ChatMap = session.getAttributes();
		String loginId = (String)ChatMap.get("loginId");
		System.out.println("loginId : "+loginId);
		
		
		Gson gson = new Gson();
		ChatDto chatdto = new ChatDto();
		chatdto.setChfrmid(loginId); 		// from 메세지를 보내는 사람의 ID 
		chatdto.setChcontents("connect");	// "connect" 에 담은 메세지
		
		// 보낸사람이 본인이면 메세지를 받지않는다
		for(int i = 0; i < sessionList.size(); i++) {
			if( !sessionList.get(i).getId().equals(session.getId())) {
				sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto)));
			}
		}
		
	
		
		
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed() 호출");
		System.out.println("session.getId() : "+session.getId());
//		sessionList.remove(session);
		
		// 끄면서 나타날 loginId
		Map<String, Object> ChatMap = session.getAttributes();
		String loginId = (String)ChatMap.get("loginId");
		System.out.println("loginId : "+loginId);
		
		Gson gson = new Gson();
		ChatDto chatdto = new ChatDto();
		chatdto.setChfrmid(loginId); 		// from 메세지를 보내는 사람의 ID 
		chatdto.setChcontents("disconnect");	// "connect" 에 담은 메세지
		
		for(int i = 0; i < sessionList.size(); i++) {
			sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto)));
		}
		
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage() 호출 : " + session.getId());
		System.out.println("message.getPayload() : "+message.getPayload());
		
		Gson gson = new Gson();
		ChatDto chatdto = gson.fromJson(message.getPayload(), ChatDto.class);
		
		System.out.println(chatdto);
		for(int i = 0; i < sessionList.size(); i++) {
			if( !sessionList.get(i).getId().equals(session.getId())) {
				sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto)));
			}
		}
		
	}
	
}
