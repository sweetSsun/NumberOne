package com.NumberOne.dto;

import lombok.Data;

@Data
public class ChatDto {
	//채팅

	private int chcode;      //채팅변호

	private String chfrmid;		//보낸사람	
	private String chtomid;		//받은사람	
	private String chcontents;	//내용
	private String chdate;		//작성시간


}
