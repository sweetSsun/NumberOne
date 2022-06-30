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
		sessionList.add(session);
		
		Map<String, Object> connectMap = session.getAttributes();
		String loginId = (String)connectMap.get("loginId");
		
		if (loginId == null) {
			loginId = "비회원_"+session.getId();
		} else {
			loginId = loginId+"_"+session.getId();
		}
		
		Gson gson = new Gson();
		ChatDto chatdto = new ChatDto();
		chatdto.setChfrmid(loginId); // from 메세지를 보내는 사람의 ID 
		chatdto.setChcontents("connect"); // "connect" 에 담은 메세지
		
		// 채팅방 번호 생성 (select)
		//String mvcode = "MV001"; 
		String chcode ="CH";
		String maxChcode = mvdao.selectMaxMvcode();
		
		if (maxChcode == null) {
			mvcode = mvcode+"001";
		} else {
			// maxMvcode = maxMvcode.split("MV")[1];
			maxChcode = maxChcode.substring(2);
			System.out.println(maxChcode);
			
			int codeNum = Integer.parseInt(maxChcode) + 1;
			
			if ( codeNum < 10) {
				mvcode = mvcode + "00" + codeNum; 
			} else if (codeNum < 100) {
				mvcode = mvcode + "0" + codeNum;
			} else {
				mvcode = mvcode + codeNum;
			}
		}
	
	cgvMvList.get(i).setMvcode(mvcode);
	System.out.println("영화코드 : "+mvcode);
		
		
		super.afterConnectionEstablished(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		super.handleTextMessage(session, message);
	}
	
}
