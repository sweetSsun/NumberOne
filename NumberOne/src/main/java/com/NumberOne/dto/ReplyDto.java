package com.NumberOne.dto;

import lombok.Data;

@Data
public class ReplyDto {
	//댓긅-일반, 자랑 
	String rpcode;      //댓글번호
	String rpbdcode;	//글번호
	String rpcontents;	//내용
	String rpmid;		//작성자
	String rpdate;		//작성일
	int rpstate;		//상태
}
