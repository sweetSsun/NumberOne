package com.NumberOne.dto;

import lombok.Data;

@Data
public class ContactDto {
	//문의게시판
	private String ctcode;		//글번호
	private String cttitle;		//글제목	
	private String ctcontents;	//글내용
	private String ctmid;		//작성자		
	private String ctdate;		//작성일
	private String ctans;		//답변
	private String ctansdate;	//답변일

}
