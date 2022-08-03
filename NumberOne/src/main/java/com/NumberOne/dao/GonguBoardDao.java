package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.GonguBoardDto;
import com.NumberOne.dto.GonguDto;
import com.NumberOne.dto.Paging;

public interface GonguBoardDao {

	
	//관리자 - 공구글 개수 조회
	int admin_selectGonguTotalCount(Paging paging);
	//관리자 - 공구글검색 목록 조회
	ArrayList<GonguBoardDto> admin_selectGonguList(Paging paging);
	
	//관리자 - 공구글 state값 변경
	int admin_updateGbstate_ajax(@Param("gbcode") String gbcode, @Param("gbstate") int gbstate);
	//관리자 - 공구글 fix
	int admin_updateGbfix_ajax(@Param("gbcode") String gbcode, @Param("gbfix") int gbfix);
	
	//관리자 - 공구글 gbcode 생성
	String admin_selectMaxGbcode();
	//관리자 - 공구글 DB입력
	int admin_insertGonguWrite(GonguBoardDto gonguBoard);
	//관리자 - 공구글 DB수정
	int admin_updateGonguModify(GonguBoardDto gonguBoard);
	
	

	//일반 - 공구게시판 전체 글 개수 조회 
	int selectGonguTotalCount(Paging paging);
	//일반 - 공구글검색 목록 조회
	ArrayList<GonguBoardDto> selectGonguBoardList( Paging paging );
	
	//일반 - 공구글 상세페이지 이동 
	GonguBoardDto selectGonguBoardView(String gbcode);
	//일반 - 공구글 조회수 증가
	int updateGonguBdHits(String gbcode);
	
	
	//공동구매 & 공구 카카오결제정보 DB입력 
	int insertGonguResgister(GonguDto gongu);
	//공동구매 & 공구 카카오결제정보 DB삭제 
	int deleteGonguResgister(GonguDto gongu);
	//공동구매 & 공구 카카오결제정보 DB찾기 
	String insertCheck_ajax(@Param("ggbcode") String ggbcode, @Param("ggmid") String ggmid);


	//관리자_공동구매 참여회원 목록
	ArrayList<String> admin_selectGonguAttendList(String ggbcode);
	//관리자_공동구매 참여회원 count
	int admin_selectGonguAttendCount(String ggbcode);
	
}
