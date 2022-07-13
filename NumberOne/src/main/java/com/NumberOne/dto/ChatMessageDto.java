package com.NumberOne.dto;

import lombok.Data;

@Data
public class ChatMessageDto {
	//채팅메세지

	private int cmcode;				//채팅번호
	private String cmcrcode;		//채팅방번호
	private String cmfrmid;			//보낸사람	
	private String cmcontents;		//내용
	private String cmdate;			//보낸시간
	private int cmread;				//읽음상태
	
	// 채팅방 출력시 닉네임으로
	private String chfrmnick;		//보낸사람 닉네임
	private String chtomnick;		//받는사람 닉네임
	
	//읽음상태 값을 저장하기 위해 필요한 세션
	private int sessionCount;
	
	
	
}
