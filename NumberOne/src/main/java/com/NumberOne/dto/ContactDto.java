package com.NumberOne.dto;

import lombok.Data;

@Data
public class ContactDto {
	//문의게시판
	String ctcode;		//글번호
	String cttitle;		//글제목	
	String ctcontents;	//글내용
	String ctmid;		//작성자		
	String ctdate;		//작성일
	String ctans;		//답변
	String ctansdate;	//답변일
}
