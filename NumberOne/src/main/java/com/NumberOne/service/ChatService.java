package com.NumberOne.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.NumberOne.dao.ChatDao;
import com.NumberOne.dto.ChatMessageDto;
import com.NumberOne.dto.ChatRoomDto;

@Service
public class ChatService {

	@Autowired
	private ChatDao chdao;
	
	
	public void insertChat() {
		
		
		
	}


	// 채팅방 유무 확인
	public ChatRoomDto selectChatRoom(String cmcrcode) {
		System.out.println("ChatService.selectChatRoom() 호출");
		ChatRoomDto chatRoom = chdao.selectChatRoom(cmcrcode); 
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
	
	
	
	
	
}
