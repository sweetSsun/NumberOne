package com.NumberOne.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UsedBoardDto {
	//중고게시판
	private String ubcode;		//글번호
	private String ubrgcode;	//지역코드
	private String ubsellbuy;	//구매 or 판매
	private String ubmid;		//작성자
	private String ubtitle;		//제목
	private String ubcontents;	//내용
	private String ubdate;		//작성일
	private String ubmainimg;	//대표사진
	private String ubdetailimg;	//상세사진
	private int ubstate;		//글상태
	
	private int ubrecommend;	//추천수 (recommend 테이블 조인)
	private int ubwarning;		//경고수 (warningBoards 테이블 조인)
	private int ubzzim;			//찜수 (zzim 테이블 조인)
	
	private MultipartFile ubmainimgfile;	//대표사진
	private MultipartFile[] ubdetailimgfile;	
}
