package com.NumberOne.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

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
	private String searchVal;	// 정렬 항목(카테고리,지역)
	private String searchType;	// 검색할 항목
	private String keyword;		// 검색 문자열
	
	// ajax로 페이징 할 경우 필요한 필드
	private String ajaxCheck;
	/* ajax로 페이징할 경우(정렬 선택 시) 리스트, 페이징넘버 두 번을 보내야하기 때문에
	 	ajax는 두 번 보내더라도, 컨트롤러와 서비스는 하나의 메소드로 처리하기 위한 필드
	 	ajax 내에서 ajaxCheck 변수의 data를 "page"로 보내면 list가 아니라 page를 return하도록 활용 가능*/
	
	
	// 중고거래 페이징에서 필요한 필드
	private String sellBuy;		//중고거래 사구,팔구 구분용
	
	//지역게시판 지역이름 저장을 위한 필드 
	private String bdrgname;	//서울 ~ 제주 게시판 이름 출력용
	//일반게시판 / 지역게시판 구분을 위한 필드
	private String bdtype;	
	//일반게시판 카테고리 구분을 위한 필드
	private String bdcategory;	//자유~후기 게시판 구분
	
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
		if(startPage <= 0) {
			startPage = 1;
		}
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 앞뒤 페이지 유무 확인
		if (page != 1) {
			prev = true;
		}
		if (page != maxPage) {
			next = true;
		}
	}
	
	// 상세페이지에서 목록으로 돌아가기 위한 uri 생성 메소드
	// 인덱스 없는 버전
	public String makeQueryPage(int page) {
		UriComponents uri = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", perPageNum)
				.queryParam("searchVal", searchVal)
				.queryParam("searchType", searchType)
				.queryParam("keyword", keyword)
				.encode()
				.build();
//		System.out.println("생성된 파라미터 : " + uri.toUriString());
		return uri.toUriString();
	}
	// 인덱스 있는 버전(상세페이지에서 수정, 삭제시)
	public String makeQueryPage(String codeIdx, int page) {
		System.out.println(codeIdx);
		UriComponents uri = UriComponentsBuilder.newInstance()
				.queryParam("codeIdx", codeIdx)
				.queryParam("page", page)
				.queryParam("perPageNum", perPageNum)
				.queryParam("searchVal", searchVal)
				.queryParam("searchType", searchType)
				.queryParam("keyword", keyword)
				.encode()
				.build();
//		System.out.println("생성된 파라미터 : " + uri.toUriString());
		return uri.toUriString();
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public String getSearchVal() {
		return searchVal;
	}

	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getAjaxCheck() {
		return ajaxCheck;
	}

	public void setAjaxCheck(String ajaxCheck) {
		this.ajaxCheck = ajaxCheck;
	}

	public String getSellBuy() {
		return sellBuy;
	}

	public void setSellBuy(String sellBuy) {
		this.sellBuy = sellBuy;
	}

	public String getBdrgname() {
		return bdrgname;
	}

	public void setBdrgname(String bdrgname) {
		this.bdrgname = bdrgname;
	}

	public String getBdtype() {
		return bdtype;
	}

	public void setBdtype(String bdtype) {
		this.bdtype = bdtype;
	}

	public String getBdcategory() {
		return bdcategory;
	}

	public void setBdcategory(String bdcategory) {
		this.bdcategory = bdcategory;
	}

	@Override
	public String toString() {
		return "Paging [page=" + page + ", perPageNum=" + perPageNum + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", totalCount=" + totalCount + ", maxPage=" + maxPage + ", displayPageNum=" + displayPageNum
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", searchVal=" + searchVal + ", searchType=" + searchType + ", keyword=" + keyword + ", ajaxCheck="
				+ ajaxCheck + ", sellBuy=" + sellBuy + ", bdrgname=" + bdrgname + ", bdtype=" + bdtype + ", bdcategory="
				+ bdcategory + "]";
	}


	
	
	
}
