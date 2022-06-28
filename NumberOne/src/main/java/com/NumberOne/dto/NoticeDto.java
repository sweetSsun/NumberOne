package com.NumberOne.dto;

import lombok.Data;

@Data
public class NoticeDto {
	//공지글(추천, 스크랩, 신고, 댓글 없음)
	String nbcode;		//글번호
	String nbmid;		//작성자
	String nbtitle;   	//제목
	String nbcontents;	//내용
	String nbdate;		//작성일
	String nbimg;		//사진	
	int nbstate;		//글상태	
	int nbhits;			//조회수
}
