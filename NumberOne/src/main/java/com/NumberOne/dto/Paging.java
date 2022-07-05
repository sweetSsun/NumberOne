package com.NumberOne.dto;

import lombok.Data;

@Data
public class Paging {

	// 페이지 처리 된 데이터를 DB에서 가져올 때 필요한 정보
	private int page;		// 요청페이지
	private int perPageNum;	// 한 페이지당 보여줄 글의 갯수
	private int startRow;	// 특정 페이지의 게시글 시작번호
	private int endRow;		// 특정 페이지의 게시글 끝번호
	
	// jsp 하단 부분의 페이지 표시에 필요한 정보
	private int totalCount;		// 게시글의 총 갯수
	private int maxPage;		// 총 페이지 수
	private int displayPageNum;	// 페이지에 보여줄 페이지 넘버 갯수
	private int startPage;		// 특정 페이지에서 보일 시작 페이지 넘버
	private int endPage;		// 특정 페이지에서 보일 마지막 페이지 넘버
	
	// 페이지 처리 시 앞뒤 페이지가 있는지 확인
	private boolean prev;	// 앞페이지 유무 여부
	private boolean next;		// 뒷페이지 유무 여부
	
	// 검색, 정렬을 위한 필드
	private String searchVal;	// 정렬 항목(카테고리)
	private String searchType;	// 검색할 항목
	private String keyword;		// 검색 문자열
	
	// 생성자
	public Paging() {
		// 초기값 설정
		page = 1;
		perPageNum = 20;
		startRow = 1;
		endRow = 10;
		
		displayPageNum = 5;
		
		prev = false;
		next = false;
		
		searchVal = "all";
	}
	
	// 데이터 들어올 경우 페이지 정보 계산
	public void calc() {
		// DB에서 받아올 글번호 rownum 계산
		startRow = (page - 1) * perPageNum + 1;
		endRow = startRow + perPageNum - 1;
		
		// jsp 하단 부분의 페이지 표시에 필요한 데이터 계산
		maxPage = (totalCount - 1) / perPageNum + 1;
		startPage = (int) ( (Math.ceil( (double)page/displayPageNum )) -1 ) * displayPageNum + 1;
		endPage = startPage + displayPageNum - 1; 
		if(startPage >= 0) {
			startPage = 1;
		}
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 앞뒤 페이지 유무 확인
		if (startPage != 1) {
			prev = true;
		}
		if (endPage <= maxPage) {
			next = true;
		}
	}
}
