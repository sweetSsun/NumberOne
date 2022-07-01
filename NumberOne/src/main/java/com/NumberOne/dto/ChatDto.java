package com.NumberOne.dto;

import lombok.Data;

@Data
public class ChatDto {
	//채팅

	private int chcode;				//채팅번호
	private String chfrmid;			//보낸사람	
	private String chtomid;			//받는사람	
	private String chcontents;		//내용
	private String chdate;			//작성일


	private String chfrmnick;		//보낸사람 닉네임
	private String chtomnick;		//받는사람 닉네임
	
	private String chdatetime;		//작성시간
}
