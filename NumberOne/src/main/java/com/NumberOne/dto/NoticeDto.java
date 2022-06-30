package com.NumberOne.dto;

import lombok.Data;

@Data
public class NoticeDto {
	//공지글(추천, 스크랩, 신고, 댓글 없음)
	private String nbcode;		//글번호
	private String nbmid;		//작성자
	private String nbtitle;   	//제목
	private String nbcontents;	//내용
	private String nbdate;		//작성일
	private String nbimg;		//사진	
	private int nbstate;		//글상태	
	private int nbhits;			//조회수
}
