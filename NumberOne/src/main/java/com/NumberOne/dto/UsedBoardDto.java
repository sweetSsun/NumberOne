package com.NumberOne.dto;

import lombok.Data;

@Data
public class UsedBoardDto {
	//중고게시판
	String ubcode;		//글번호
	String ubrgcode;	//지역코드
	String ubsellbuy;	//구매 or 판매
	String ubmid;		//작성자
	String ubtitle;		//제목
	String ubcontents;	//내용
	String ubdate;		//작성일
	String ubmainimg;	//대표사진
	String ubdetailimg;	//상세사진
	int ubstate;		//글상태
	
	int ubrecommend;	//추천수 (recommend 테이블 조인)
	int ubwarning;		//경고수 (warningBoards 테이블 조인)
	int ubzzim;			//찜수 (zzim 테이블 조인)
}
