package com.NumberOne.dto;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDto {

	//일반게시글, 자취방 자랑	

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
	
	private String bdrecommend;        	//추천수-자취방 자랑, 일반게시글 (recommend 테이블 조인)
	private String bdwarning;			//신고수-자취방 자랑, 일반게시글 (warning 테이블 조인)
	private String bdreply;				//댓글수-자취방 자랑, 일반게시글 (reply 테이블 조인)
	private String bdscrap;            	//스크랩수-자취방 자랑 (필요없으면 삭제)
	
	//파일 처리를 위한 필드
	private MultipartFile bdimgfile;			//프로필 파일
	private MultipartFile[] bddetailimgfile;	//프로필 파일
	
	//검색할 때 필요한 필드
	private String bdnickname;      //작성자 닉네임
	private String bdmprofile;      //작성자 프로필
	
	//로그인 아이디의 추천, 스크랩, 신고 기록
	private String rchistory;   //추천 기록
	private String schistory;   //스크랩 기록
	private String wbhistory;   //신고 기록	
	

}
