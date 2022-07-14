package com.NumberOne.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dao.ChatDao;
import com.NumberOne.dto.ChatMessageDto;
import com.NumberOne.dto.ChatRoomDto;
import com.google.gson.Gson;

@Service
public class ChatService {

	@Autowired
	private ChatDao chdao;
	
	
	public void insertChat() {
		
		
		
	}

	// 중고거래 관심상품 채팅메세지 입력 요청
	public String insertResellChat(String[] gd_names, ChatMessageDto chatMessage, String gdtitle) {
		System.out.println("ChatService.insertResellChat() 호출");
		ModelAndView mav = new ModelAndView();
		int insertResult = 0;
		
		// 해당 사용자간의 채팅방이 있는지 확인 후 없으면 새롭게 생성
		ChatRoomDto chatRoom = selectChatRoom(chatMessage.getCmfrmid(), chatMessage.getCmtomid());
		if (chatRoom == null) {
			insertChatRoom(chatMessage);
			chatRoom = selectChatRoom(chatMessage.getCmfrmid(), chatMessage.getCmtomid());
		}
		chatMessage.setCmcrcode(chatRoom.getCrcode());
		System.out.println("chatRoom : " + chatRoom);
		
		
		// cmcode 생성
		int cmcode = createCmcode();
		chatMessage.setCmcode(cmcode);
		
		// 중고거래 시도시 입력할 메세지 생성
		String goodsChatMsg = null;
		goodsChatMsg = gdtitle + " 글 - ";
		if(gd_names.length==1) {
			for (String gdcheck : gd_names) {
				goodsChatMsg += gdcheck;
			}
		} else {
			for (int i = 0; i < gd_names.length; i++) {
				String gdcheck = gd_names[i];
				if (i != gd_names.length-1) {
					goodsChatMsg += gdcheck + ", "; 
				} else {
					goodsChatMsg += gdcheck; 
				}
			}			
		}
		goodsChatMsg += " 상품에 관심있어요";
		System.out.println("goodsChatMsg : " + goodsChatMsg);
		chatMessage.setCmcontents(goodsChatMsg);
		
		// 처음 중고거래 시도시의 세션은 구매자 뿐이므로 sessionCount를 1로 보내줌
		chatMessage.setSessionCount(1);
		
		
		System.out.println("chatDto : " + chatMessage);

		// 채팅 메세지 입력
		chdao.insertChatMessage(chatMessage);
		
		Gson gson = new Gson();
		String crcode = gson.toJson(chatMessage.getCmcrcode());
//		
//		// 채팅 출력_닉네임
//		String chfrmnick = chdao.selectMfrnick(chatMessage.getCmfrmid());
//		String chtomnick = chdao.selectMtonick(chatMessage.getCmtomid());
//		chatMessage.setChfrmnick(chfrmnick);
//		chatMessage.setChtomnick(chtomnick);
		
		return crcode;
	}



	// 채팅방 조회 (보낸 메세지의 crcode)
	public ChatRoomDto selectChatRoom(String crcode) {
		System.out.println("ChatService.selectChatRoom_1() 호출");
		ChatRoomDto chatRoom = chdao.selectChatRoom_1(crcode); 
		return chatRoom;
	}

	// 채팅방 유무 확인 (신규채팅방 생성 확인용)
	public ChatRoomDto selectChatRoom(String crfrmid, String crtomid) {
		System.out.println("ChatService.selectChatRoom_2() 호출");
		ChatRoomDto chatRoom = chdao.selectChatRoom_2(crfrmid, crtomid); 
		return chatRoom;
	}

	// 새로운 채팅방 생성
	public void insertChatRoom(ChatMessageDto chatMessage) {
		System.out.println("ChatService.insertChatRoom() 호출");
		// crcode 생성
		String maxCrcode = chdao.selectMaxCrcode();
		int crcodeNum = Integer.parseInt(maxCrcode.substring(3)) + 1;
		System.out.println("crcodeNum: "+crcodeNum);
		String crcode;
		if(crcodeNum<10) {
			crcode = "CR0000"+crcodeNum;
		} else if(crcodeNum<100) {
			crcode = "CR000"+crcodeNum;
		} else if(crcodeNum<1000) {
			crcode = "CR00"+crcodeNum;
		} else if(crcodeNum<10000) {
			crcode = "CR0"+crcodeNum;
		} else {
			crcode = "CR"+crcodeNum;
		} 
		chatMessage.setCmcrcode(crcode);

		// 채팅방 생성
		int insertResult = chdao.insertChatRoom(chatMessage);
		if (insertResult > 0) {
			System.out.println("신규 채팅방 생성 완료");
		}
	}	
	
	// cmcode 생성 메소드
	public int createCmcode() {
		int cmcode = chdao.selectMaxCmcode() + 1;
		System.out.println("cmcode : "+ cmcode);
		return cmcode;
	}
	
	
	
}
