package com.NumberOne.dto;

import lombok.Data;

@Data
public class ChatRoomDto {
	// 채팅방
	
	private String crcode;			//채팅방번호
	private String crfrmid;			//보낸사람
	private String crtomid;			//받는사람
	
	// 각 채팅방의 안읽은 메세지수
	private int crReadCount;		//읽음상태 count (chatmessage 조인)
}
