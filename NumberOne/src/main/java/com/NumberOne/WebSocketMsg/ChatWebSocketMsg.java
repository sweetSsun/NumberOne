package com.NumberOne.WebSocketMsg;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.NumberOne.dao.ChatDao;
import com.NumberOne.dto.ChatDto;
import com.google.gson.Gson;

public class ChatWebSocketMsg extends TextWebSocketHandler {

	@Autowired
	ChatDao chdao;
	
	
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
		

/*<<<<<<< HEAD
		// 채팅방 번호 생성 (select)
		
		String mvcode = "MV001"; 
		String chcode ="CH";
		String maxChcode = mvdao.selectMaxMvcode();
>>>>>>> 6122118f56a2a60894d9aafe4a5db8f777350c5c
		
		/* 실행하면서 나타날 말이 있으면 여기다 쓰면 좋겠다 싶어서 ... 입력도 안한 날짜가 들어갈까?.. 응안들어가
		for(int i = 0; i < sessionList.size(); i++) {
	        if( !sessionList.get(i).getId().equals(session.getId())) {
	        	sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto.getChdate())));
	        }
		}
		*/

		super.afterConnectionEstablished(session);

		

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
		
		/* 끄면서 나타날 말이 있으면 여기다 쓰면 좋겠는데 객체타입만 받는다... 날짜를 넣어보고 싶었다.
		for(int i = 0; i < sessionList.size(); i++) {
	        if( !sessionList.get(i).getId().equals(session.getId())) {
	        	sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto.getChdate())));
	        }
		}
		*/
	
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage() 호출 : " + session.getId());
		System.out.println("message.getPayload() : "+message.getPayload());
		
		Gson gson = new Gson();
		ChatDto chatdto = gson.fromJson(message.getPayload(), ChatDto.class);
		

			// 채팅 번호 생성 (select)
			int maxChcode = chdao.selectMaxChcode();
			int chcode = 0;
				System.out.println("채팅MAX번호 : "+maxChcode);
				if (maxChcode==0) {
					chcode = 1; 
				} else {
					chcode = maxChcode + 1;
				}				
			System.out.println("채팅번호 : "+chcode);
			chatdto.setChcode(chcode);
			System.out.println("DB입력 전 : "+chatdto);
			
			// 채팅 입력
			chdao.insertChat(chatdto);
			
			// 채팅 출력_닉네임
			String chfrmnick = chdao.selectMfrnick(chatdto.getChfrmid());
			String chtomnick = chdao.selectMtonick(chatdto.getChtomid());
			chatdto.setChfrmnick(chfrmnick);
			chatdto.setChtomnick(chtomnick);

			// 채팅 출력_시간
			
			// 날짜를 뽑고싶어서 split으로 해봤는데 
			String chdate = chdao.selectTime(chatdto.getChcode());
			System.out.println(chdate);
			String[] chdate_split = chdate.split(" ");
			System.out.println(chdate_split[0]);
			System.out.println(chdate_split[1]+" "+chdate_split[2]);
			chatdto.setChdate(chdate_split[0]);
			chatdto.setChdatetime(chdate_split[1]+" "+chdate_split[2]);
			
			
			System.out.println("DB입력 후 : "+chatdto);
				
			
		// 보낸사람이 본인이면 메세지를 전달하지않는다
		for(int i = 0; i < sessionList.size(); i++) {
	        if( !sessionList.get(i).getId().equals(session.getId())) {
	            sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto)));
	        }
	    }
		
	}
	
}
