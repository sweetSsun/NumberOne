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
		
		Map<String, Object> ChatMap = session.getAttributes();
		String chfrmid = (String)ChatMap.get("loginId");
		chfrmid = "보내는사람_"+session.getId();
		System.out.println("chfrmid : "+chfrmid);
		
		
		Gson gson = new Gson();
		ChatDto chatdto = new ChatDto();
		chatdto.setChfrmid(chfrmid); 		// from 메세지를 보내는 사람의 ID 
		
<<<<<<< HEAD

=======
/*<<<<<<< HEAD
		// 채팅방 번호 생성 (select)
		
		String mvcode = "MV001"; 
		String chcode ="CH";
		String maxChcode = mvdao.selectMaxMvcode();
>>>>>>> 6122118f56a2a60894d9aafe4a5db8f777350c5c
		
		// 실행하면서 나타날 말이 있으면 여기다 쓰면 좋겠는데 오류가 난다...
		// session.sendMessage(new TextMessage(gson.toJson(chatdto)));
		
	
		
<<<<<<< HEAD

=======
		
<<<<<<< HEAD
		super.afterConnectionEstablished(session);
		
=======
		
>>>>>>> 25fbb11d09bf04f4761224e889f7c74e9703ce4b
*/
>>>>>>> 6122118f56a2a60894d9aafe4a5db8f777350c5c
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed() 호출");
		System.out.println("session.getId() : "+session.getId());
		sessionList.remove(session);
		
		// 끄면서 나타날 loginId
		Map<String, Object> ChatMap = session.getAttributes();
		String chfrmid = (String)ChatMap.get("loginId");
		chfrmid = "보내는사람_"+session.getId();
		System.out.println("loginId : "+chfrmid);
		
		Gson gson = new Gson();
		ChatDto chatdto = new ChatDto();
		chatdto.setChfrmid(chfrmid); 		// from 메세지를 보내는 사람의 ID
		
		// 끄면서 나타날 말이 있으면 여기다 쓰면 좋겠는데 객체타입만 받는다...
		// sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto)));

		 
	
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String chfrmid = session.getId();
		String chcontents = message.getPayload();		
		
		System.out.println("handleTextMessage() 호출 : " + chfrmid);
		System.out.println("전달받은 메세지 : "+chcontents);
		
		Gson gson = new Gson();
		ChatDto chatdto = gson.fromJson(chcontents, ChatDto.class);
		chatdto.setChfrmid(chfrmid);
		chatdto.setChcontents(chcontents);
		
		
		
		
		System.out.println(chatdto);
		
		//session.sendMessage(new TextMessage(gson.toJson(chatdto)));

		// 보낸사람이 본인이면 메세지를 전달하지않는다
		for(int i = 0; i < sessionList.size(); i++) {
	        if( !sessionList.get(i).getId().equals(session.getId())) {
	            sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto)));
	        }
	    }
		
	}
	
}
