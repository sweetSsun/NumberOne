package com.NumberOne.WebSocketMsg;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.NumberOne.dao.ChatDao;
import com.NumberOne.dto.ChatMessageDto;
import com.NumberOne.dto.ChatRoomDto;
import com.NumberOne.service.ChatService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

public class ChatWebSocketMsg extends TextWebSocketHandler {

	@Autowired
	ChatDao chdao;
	
	@Autowired
	ChatService chsvc;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
    // <채팅방, 해당 채팅방의 세션>
	private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
//    private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	// 접속 세션
	// <session, 방번호>
    private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
//	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
    // 세션 접속인원
    private static int loginMbCount;
    
    /* 웹소켓 연결 성공시 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished() 호출");
		loginMbCount++;
		System.out.println(session.getId() + " 연결성공 >> 총 접속인원 : " + loginMbCount + "명");
		
		// 맵과 세션목록에 추가
//		users.put(session.getId(), session);
//		sessionList.add(session);
//		
//		Map<String, Object> ChatMap = session.getAttributes();
//		String chfrmid = (String)ChatMap.get("loginId");
//		chfrmid = "보내는사람_"+session.getId();
//		System.out.println("chfrmid : "+chfrmid);
//		
//		
//		Gson gson = new Gson();
//		ChatDto chatdto = new ChatDto();
//		chatdto.setChfrmid(chfrmid); 		// from 메세지를 보내는 사람의 ID 
		

		/* 실행하면서 나타날 말이 있으면 여기다 쓰면 좋을것같다
		for(int i = 0; i < sessionList.size(); i++) {
	        if( !sessionList.get(i).getId().equals(session.getId())) {
	        	sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto.getChdate())));
	        }
		}
		*/

//		super.afterConnectionEstablished(session);
	}
	
	/* 웹소켓 연결 종료시 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed() 호출");
		loginMbCount--;
        System.out.println(session.getId() + " 연결종료 >> 총 접속인원 : " + loginMbCount + "명");
        
        // 맵과 세션목록에서 제거
        if(sessionList.get(session) != null) {
            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
            RoomList.get(sessionList.get(session)).remove(session);
            sessionList.remove(session);
        }
//        users.remove(session.getId());
//        sessionList.remove(session);
		
		
//		System.out.println("session.getId() : "+session.getId());
//		sessionList.remove(session);
//		
//		// 끄면서 나타날 loginId
//		Map<String, Object> ChatMap = session.getAttributes();
//		String chfrmid = (String)ChatMap.get("loginId");
//		chfrmid = "보내는사람_"+session.getId();
//		System.out.println("loginId : "+chfrmid);
//		
//		Gson gson = new Gson();
//		ChatDto chatdto = new ChatDto();
//		chatdto.setChfrmid(chfrmid); 		// from 메세지를 보내는 사람의 ID
		
		/* 끄면서 나타날 말이 있으면 여기다 쓰면 좋을 것 같다
		for(int i = 0; i < sessionList.size(); i++) {
	        if( !sessionList.get(i).getId().equals(session.getId())) {
	        	sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatdto.getChdate())));
	        }
		}
		*/
	}
	
	/* 웹소켓으로 메세지가 전송됐을 때 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage() 호출 : " + session.getId());
		
		// Json객체 -> Java객체 변환 (gson 말고 jackson 사용)
		Gson gson = new Gson();
		ChatMessageDto chatMessage = //objectMapper.readValue(message.getPayload(), ChatMessageDto.class);
									 gson.fromJson(message.getPayload(), ChatMessageDto.class);  
		System.out.println("전달메세지 : " + chatMessage);
		
		// 받은 메세지에 저장되어있는 채팅방코드로 해당 채팅방 찾기
		ChatRoomDto chatRoom = chsvc.selectChatRoom(chatMessage.getCmcrcode());
		
		// 세션에 채팅방 입력
		// RoomList 세션에 채팅방이 없고, 채팅방에 지금 입장했고, DB에 채팅방 있을 때
		if (RoomList.get(chatRoom.getCrcode()) == null && chatMessage.getCmcontents().equals("ENTER-CHAT") && chatRoom != null) {
			//채팅방에 들어갈 session들
			ArrayList<WebSocketSession> inputSession = new ArrayList<>();
			inputSession.add(session);
			sessionList.put(session, chatRoom.getCrcode());
			RoomList.put(chatRoom.getCrcode(), inputSession);
			System.out.println("새로운 채팅방 입장");
		} 
		
		// RoomList 세션에 채팅방이 존재할 때
		else if (RoomList.get(chatRoom.getCrcode()) != null && chatMessage.getCmcontents().equals("ENTER-CHAT") && chatRoom != null) {
			// RoomList에 해당 채팅방코드를 가진 방이 있는지 확인하고 session을 추가 (해당 채팅방에 접속인원 추가)
			
			RoomList.get(chatRoom.getCrcode()).add(session);
			// sessionList에 추가
			sessionList.put(session, chatRoom.getCrcode());
			System.out.println("생성되어있는 채팅방 입장");
		} 
		
		// 채팅메세지 입력 시
		else if (RoomList.get(chatRoom.getCrcode()) != null && !chatMessage.getCmcontents().equals("ENTER-CHAT") && chatRoom != null) {
			// 보낸 사람 닉네임 조회
			String cmfrmnickname = chdao.selectMnickname(chatMessage.getCmfrmid());
			chatMessage.setCmfrmnickname(cmfrmnickname);
			
			// 현재 session 수
			int sessionCount = 0;
			// 해당 채팅방의 session 확인하고 뿌리기
			for(WebSocketSession sess : RoomList.get(chatRoom.getCrcode())) {
				sessionCount++;
				// Java객체 -> Json객체 변환 (gson 말고 jackson 사용)
//				sess.sendMessage(new TextMessage(objectMapper.writeValueAsString(chatMessage)));
				sess.sendMessage(new TextMessage(gson.toJson(chatMessage)));
			}

			// 동적쿼리에서 사용할 sessionCount 저장 (세션값에 따라 cmread가 달라짐)
			chatMessage.setSessionCount(sessionCount);
			
			// cmcode 생성
			int cmcode = chsvc.createCmcode();
			chatMessage.setCmcode(cmcode);
			// DB에 메세지 저장
			int insertResult = chdao.insertChatMessage(chatMessage);
			
			
			System.out.println("DB입력 결과 : " + insertResult);
		}

	}
//
//			// 채팅 번호 생성 (select)
//			int maxChcode = chdao.selectMaxChcode();
//			int chcode = 0;
//				System.out.println("채팅MAX번호 : "+maxChcode);
//				if (maxChcode==0) {
//					chcode = 1; 
//				} else {
//					chcode = maxChcode + 1;
//				}				
//			System.out.println("채팅번호 : "+chcode);
//			chatMessage.setCmcode(chcode);
//			System.out.println("DB입력 전 : "+chatMessage);
//			
//			// 채팅 입력
//			chdao.insertChat(chatMessage);
//			
//			// 채팅 출력_닉네임
//			String chfrmnick = chdao.selectMfrnick(chatMessage.getCmfrmid());
//			String chtomnick = chdao.selectMtonick(chatMessage.getCmtomid());
//			chatMessage.setChfrmnick(chfrmnick);
//			chatMessage.setChtomnick(chtomnick);
//
//			// 채팅 출력_시간
//			
//			// 날짜를 뽑고싶어서 split으로 해봤는데 
//			String chdate = chdao.selectTime(chatMessage.getChcode());
//			System.out.println(chdate);
//			String[] chdate_split = chdate.split(" ");
//			System.out.println(chdate_split[0]);
//			System.out.println(chdate_split[1]+" "+chdate_split[2]);
//			chatMessage.setChdate(chdate_split[0]);
//			chatMessage.setChdatetime(chdate_split[1]+" "+chdate_split[2]);
//			
//			
//			System.out.println("DB입력 후 : "+chatMessage);
//				
//			
//		// 보낸사람이 본인이면 메세지를 전달하지않는다
//		for(int i = 0; i < sessionList.size(); i++) {
//	        if( !sessionList.get(i).getId().equals(session.getId())) {
//	            sessionList.get(i).sendMessage(new TextMessage(gson.toJson(chatMessage)));
//	        }
//	    }
		

	
}
