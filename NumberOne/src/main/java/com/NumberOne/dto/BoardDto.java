package com.NumberOne.dto;

import lombok.Data;

@Data
public class BoardDto {
	//일반게시글, 자취방 자랑	
	String bdcode; 			//글번호
	String bdrgcode;		//지역코드(말머리)
	String bdcategory;		//카테고리	
	String bdmid;			//작성자
	String bdtitle;			//제목
	String bdcontents;		//내용
	String bddate;			//작성일
	String bdimg;			//대표사진
	String bddetailimg;		//상세사진
	int bdstate;			//글상태
	int bdhits;				//조회수
	
	int bdrecommend;        //추천수-자취방 자랑, 일반게시글 (recommend 테이블 조인)
	int bdwarning;			//신고수-자취방 자랑, 일반게시글 (warning 테이블 조인)
	int bdreply;			//댓글수-자취방 자랑, 일반게시글 (reply 테이블 조인)
	int bdscrap;            //스크랩수-자취방 자랑 (필요없으면 삭제)
}
