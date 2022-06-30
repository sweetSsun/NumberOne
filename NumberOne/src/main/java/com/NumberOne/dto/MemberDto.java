package com.NumberOne.dto;

import lombok.Data;

@Data
public class MemberDto {
	//회원게시판
	private String mid;				//아이디
	private String mpw;				//비밀번호
	private String mname;			//이름	
	private String mnickname;		//닉네임	
	private String mphone;			//전화번호
	private String memail;			//이메일
	private String maddr;			//주소
	private String mprofile;		//프로펠
	private String mmessage;		//상태메세지
	private int mstate; 			//상태
	private String date;			//가입일

	private int mwarning;   		//신고수 (warningBoards 테이블 조인)

}
