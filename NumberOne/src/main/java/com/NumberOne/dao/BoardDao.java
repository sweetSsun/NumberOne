package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.ReplyDto;

public interface BoardDao {

	//최대 글번호 찾기
	@Select("select nvl(max(bdcode), 'BD00000') from boards")
	String selectMaxBdcode();

	//자랑글 등록
	@Insert("insert into boards (BDCODE, BDCATEGORY, BDMID, BDTITLE, BDCONTENTS, BDDATE, BDIMG, BDDETAILIMG) "
			+ "values (#{bdcode}, #{bdcategory}, #{bdmid}, #{bdtitle}, #{bdcontents}, sysdate, #{bdimg}, #{bddetailimg})")
	int insertRoomWrite(BoardDto room);
	   
	   //자취방 자랑 글목록 조회 
	   ArrayList<BoardDto> selectRoomList(String bdcategory);

	//공지게시판 글목록 조회 
	ArrayList<NoticeDto> selectNoticeList();
	 
	//카테고리별 글목록 조회 
	@Select("SELECT BDCODE, BDRGCODE, BDCATEGORY, BDMID, BDTITLE, BDCONTENTS, TO_CHAR(BDDATE,'YY-MM-DD') AS BDDATE, "
	      + "       BDIMG, BDDETAILIMG, BDSTATE, BDHITS, MB.MNICKNAME AS BDNICKNAME "
	      + "FROM BOARDS BD, MEMBERS MB "
	      + "WHERE BD.BDMID = MB.MID "
	      + "AND BD.BDCATEGORY = #{bdcategory} "
	      + "ORDER BY BDCODE DESC ")
	ArrayList<BoardDto> selectBoardCategoryList_ajax(String bdcategory);
	   
	//글검색 목록 조회 
	ArrayList<BoardDto> selectBoardSearchList( @Param("searchType")String searchType, @Param("searchText")String searchText);
	
	//게시판 공지글 상세페이지 이동 
	NoticeDto selectNoticeBoardView(String nbcode);
	
	//게시판 글상세페이지 이동
	BoardDto selectBoardView(String bdcode);
	
	//댓글 최대번호 조회 
	String selectReplyMaxNumber();
	
	//댓글 등록 (ajax)
	int insertBoardReply_ajax(ReplyDto reply);
	
	//댓글목록 조회 
	ArrayList<ReplyDto> selectBoardReplyList(String bdcode);

	//댓글개수 조회 (ajax)
	int selectReplyCount_ajax(String bdcode);
	
	//댓글삭제[상태변경]  (ajax)
	int updateReplyState_ajax(String rpcode);
	
	//게시글 신고 
	int insertBoardWarning_ajax(@Param("loginId")String loginId, @Param("bdcode")String bdcode);
	
	//게시글 추천
	int insertBoardRecommend_ajax(@Param("loginId")String loginId, @Param("bdcode")String bdcode);
	
	//게시글 추천수 조회
	int selectBoardRecommendCount_ajax(String bdcode);	
	
	   //일반게시판 글목록 조회 
	   @Select("SELECT BDCODE, BDRGCODE, BDCATEGORY, BDMID, BDTITLE, BDCONTENTS, "
	          + "      TO_CHAR(BDDATE,'YY-MM-DD') AS BDDATE, "
	          + "      BDIMG, BDDETAILIMG, BDSTATE, BDHITS, MB.MNICKNAME AS BDNICKNAME "
	          + "FROM BOARDS BD, MEMBERS MB "
	          + "WHERE BD.BDMID = MB.MID "
	          + "ORDER BY BDCODE DESC " )
	   ArrayList<BoardDto> selectBoardList();
	
}
