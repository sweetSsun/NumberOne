package com.NumberOne.dto;

import lombok.Data;

@Data
public class MemberDto {
	//회원게시판
	String mid;				//아이디
	String mpw;				//비밀번호
	String mname;			//이름	
	String mnickname;		//닉네임	
	String mphone;			//전화번호
	String memail;			//이메일
	String maddr;			//주소
	String mprofile;		//프로펠
	String mmessage;		//상태메세지
	int mstate; 			//상태
	String date;			//가입일

	int mwarning;   		//신고수 (warningBoards 테이블 조인)
}
