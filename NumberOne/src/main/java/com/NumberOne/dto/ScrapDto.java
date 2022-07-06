package com.NumberOne.dto;

import lombok.Data;

@Data
public class ScrapDto {
	
	private String scmid;		//스크랩한 사람
	private String scbdcode;	//스크랩한 글번호	
	
	//마이페이지 - 스크랩 목록 출력으로 추가
	private String bdtitle;		//스크랩한 글번호
	private String bdreply;		//스크랩한 글 댓글수
	private String mnickname;	// 원본 글 작성자 닉네임
	private String bddate;		// 글 작성 날짜

}
