package com.NumberOne.dto;

import lombok.Data;

@Data
public class ChatDto {
	//채팅
	String chcode;      //채팅번호
	String chfrmid;		//보낸사람	
	String chtomid;		//받은사람	
	String chcontents;	//내용
	String chdate;		//작성시간
}
