package com.NumberOne.dto;

import lombok.Data;

@Data
public class BoardDto {

	private String bdcode; 			//글번호
	private String bdrgcode;		//지역코드(말머리)
	private String bdcategory;		//카테고리	
	private String bdmid;			//작성자
	private String bdtitle;			//제목
	private String bdcontents;		//내용
	private String bddate;			//작성일
	private String bdimg;			//대표사진
	private String bddetailimg;		//상세사진
	private int bdstate;			//글상태
	private int bdhits;				//조회수
	
	private int bdrecommend;        //추천수-자취방 자랑, 일반게시글 (recommend 테이블 조인)
	private int bdwarning;			//신고수-자취방 자랑, 일반게시글 (warning 테이블 조인)
	private int bdreply;			//댓글수-자취방 자랑, 일반게시글 (reply 테이블 조인)
	private int bdscrap;            //스크랩수-자취방 자랑 (필요없으면 삭제)

}
