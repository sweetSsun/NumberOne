package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	   ArrayList<BoardDto> selectRoomList();

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
	
	//게시글 신고 유무 확인 
	String checkBoardWarning_ajax(@Param("loginId")String loginId, @Param("bdcode")String bdcode);
		
	//게시글 신고 
	int insertBoardWarning_ajax(@Param("loginId")String loginId, @Param("bdcode")String bdcode);
	
	//게시글 신고 취소(삭제)
	int deleteBoardWarning_ajax(@Param("loginId")String loginId, @Param("bdcode")String bdcode);
	
	//게시글 추천
	int insertBoardRecommend_ajax(@Param("loginId")String loginId, @Param("bdcode")String bdcode);
	
	//게시글 추천 취소 
	int deleteBoardRecommend_ajax(@Param("loginId")String loginId, @Param("bdcode")String bdcode);
	
	//게시글 추천유무 확인 
	String checkBoardRecommend_ajax(@Param("loginId")String loginId, @Param("bdcode")String bdcode);

	//게시글 추천수 조회
	int selectBoardRecommendCount_ajax(String bdcode);	
	
	//글 전체 목록 조회 
	@Select("SELECT BDCODE, BDRGCODE, BDCATEGORY, BDMID, BDTITLE, BDCONTENTS, "
	          + "   TO_CHAR(BDDATE,'YY-MM-DD') AS BDDATE, "
	          + "   BDIMG, BDDETAILIMG, BDSTATE, BDHITS, MB.MNICKNAME AS BDNICKNAME "
	          + "FROM BOARDS BD, MEMBERS MB "
	          + "WHERE BD.BDMID = MB.MID "
	          + "AND BDSTATE = 1 "
	          + "ORDER BY BDCODE DESC " )
	  ArrayList<BoardDto> selectBoardList();
	
	
	/* 일반게시판 글목록 조회 */
	//자유 게시글 목록 
	ArrayList<BoardDto> selectBoardList_Free(String bdcategory_Free);
	//질문 게시글 목록 
	ArrayList<BoardDto> selectBoardList_Question(String bdcategory_Question);
	//정보 게시글 목록  
	ArrayList<BoardDto> selectBoardList_Information(String bdcategory_Infomation);
	//후기 게시글 목록 
	ArrayList<BoardDto> selectBoardList_Review(String bdcategory_Review);
	
	//아이디로 닉네임 찾기
	@Select("select mnickname from members where mid= #{mid}")
	String selectRoomWriterMnickname(String mid);

	//자취방 자랑글 추천
	@Insert("insert into recommend values (#{rcmid}, #{rcbdcode})")
	int insertRecommend(@Param ("rcbdcode") String bdcode,@Param ("rcmid") String bdmid);

	//자취방 자랑글 추천/스크랩/신고 취소(테이블에서 튜플 삭제)
	int deleteState(@Param ("bdcode")String bdcode, @Param ("loginId")String attribute,@Param ("history") String history);

	//자취방 상세보기 누르면 조회수 업데이트
	int updateRoomhits(String bdcode);

	//자취방 상세보기 글 정보 select
	BoardDto selectRoomView(@Param ("bdcode") String bdcode, @Param ("loginId") String loginId);

	//자취방 글의 현재 추천,스크랩,신고 상태 조회
	String selectCurrentHisroty(@Param ("bdcode")String bdcode, @Param ("history") String history, @Param ("loginId")String loginId);

	//자취방 자랑글 추천/스크랩/신고
	int insertState(@Param ("bdcode")String bdcode, @Param ("loginId")String attribute,@Param ("history") String history);

	//자취방 자랑글 추천 이력 조회
	@Select("select count(*) from recommend where rcbdcode = #{rcbdcode} and rcmid=#{rcmid}")
	int recommendCh(@Param ("rcbdcode") String bdcode,@Param ("rcmid") String bdmid);

	//자취방 자랑글 추천 취소(recommend 테이블에서 튜플 삭제)
	@Delete("delete from recommend where rcbdcode = #{rcbdcode} and rcmid=#{rcmid}")
	int deleteRecommend(@Param ("rcbdcode") String bdcode,@Param ("rcmid") String bdmid);
	
	//게시글 삭제 (상태변경)
	int updateBoardDelete(String bdcode);
	
	//게시글 수정
	int updateBoardModify(BoardDto board);
	
	//게시글 작성
	int insertBoard(BoardDto board);
	
	//게시글 조회수 증가
	int updateBoardHits(String bdcode);

	
	
	
	



	
}
