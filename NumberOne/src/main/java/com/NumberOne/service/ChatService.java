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
	
	private ChatRoomDto chatRoom;
	private ChatMessageDto chatMessage;
	
	
	public void insertChat() {
		
		
		
	}


	public ChatRoomDto selectChatRoom(String cmcrcode) {
		System.out.println("ChatService.selectChatRoom() 호출");
		chatRoom = chdao.selectChatRoom(cmcrcode); 
		return chatRoom;
	}	
	
	
	
	
	
}
