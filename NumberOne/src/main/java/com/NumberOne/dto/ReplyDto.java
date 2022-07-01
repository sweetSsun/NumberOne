package com.NumberOne.dto;

import lombok.Data;

@Data
public class ReplyDto {
	//댓긅-일반, 자랑 
	private String rpcode;      //댓글번호
	private String rpbdcode;	//글번호
	private String rpcontents;	//내용
	private String rpmid;		//작성자
	private String rpdate;		//작성일
	private int rpstate;		//상태
	
	private String rpbdtitle;		//댓글원본 글 제목
	
}
