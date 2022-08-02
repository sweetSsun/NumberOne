package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.dto.ReplyDto;

public interface BoardDao {

	//최대 글번호 찾기
	@Select("select nvl(max(bdcode), 'BD00000') from boards")
	String selectMaxBdcode();

	//자랑글 등록
	@Insert("insert into boards (BDCODE, BDCATEGORY, BDMID, BDTITLE, BDCONTENTS, BDDATE, BDIMG, BDDETAILIMG) "
			+ "values (#{bdcode}, #{bdcategory}, #{bdmid}, #{bdtitle}, #{bdcontents}, sysdate, #{bdimg}, #{bddetailimg})")
	int insertRoomWrite(BoardDto room);
	   
	//자취방 자랑글 목록 조회 
	ArrayList<BoardDto> selectRoomList();
	
	//자랑글 목록 조회 페이징
	ArrayList<BoardDto> selectRoomList_paging(Paging paging);
	
	//자랑글 목록 조회 페이징
	ArrayList<BoardDto> adminSelectRoomList_paging(Paging paging);

	//공지게시판 글목록 조회 
	ArrayList<NoticeDto> selectNoticeList();
	 
	//글검색 목록 조회 
	ArrayList<BoardDto> selectBoardSearchList( @Param("bdcategory") String bdcategory, @Param("searchType") String searchType, @Param("searchText") String searchText);
	
	//공지글검색 목록 조회 
	ArrayList<NoticeDto> selectNoticeBoardList( Paging paging );

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
	
	//글 전체 목록 조회 ( Boards 테이블 + 닉네임, 댓글수, 추천수)
	@Select("SELECT BDCODE, BDRGCODE, BDCATEGORY, BDMID, BDTITLE, BDCONTENTS, "
			+ "	   TO_CHAR(BDDATE,'YY-MM-DD') AS BDDATE, "
			+ "	   BDIMG, BDDETAILIMG, BDSTATE, BDHITS, "
			+ "       MB.MNICKNAME AS BDNICKNAME, "
			+ "       NVL(RPCOUNT.BDRPCOUNT, 0) AS BDRPCOUNT, "
			+ "       NVL(RCCOUNT.BDRCCOUNT, 0) AS BDRCCOUNT "
			+ "FROM BOARDS BD "
			+ "LEFT OUTER JOIN MEMBERS MB "
			+ "ON BD.BDMID = MB.MID "
			+ "LEFT OUTER JOIN (SELECT BD.BDCODE AS RPBDCODE, COUNT(*) AS BDRPCOUNT "
			+ "                        FROM BOARDS BD LEFT OUTER JOIN REPLY RP "
			+ "                        ON BD.BDCODE = RP.RPBDCODE "
			+ "                        WHERE RP.RPSTATE = 1 OR RP.RPSTATE = 2 "
			+ "                        GROUP BY BD.BDCODE "
			+ "                        ORDER BY BD.BDCODE) RPCOUNT "
			+ "ON BD.BDCODE = RPCOUNT.RPBDCODE "
			+ "LEFT OUTER JOIN (SELECT RCBDCODE, COUNT(*) AS BDRCCOUNT "
			+ "                        FROM recommend "
			+ "                        GROUP BY RCBDCODE ) RCCOUNT "
			+ "ON BD.BDCODE = RCCOUNT.RCBDCODE "
			+ "WHERE BD.BDSTATE = 1 "
			+ "ORDER BY BDCODE DESC " )
	  ArrayList<BoardDto> selectBoardList();
	
	  ArrayList<BoardDto> selectBoardList_Paging(Paging paging);
	
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
	
	//관리자용 자랑글 상세 뷰
	BoardDto adminSelectRoomView(@Param ("bdcode") String bdcode, @Param ("loginId") String loginId);

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
	
	//공지글 조회수 증가 
	int updateNoticeBdHits(String nbcode);

	//댓글정보 불러오기
	ReplyDto selectRpContents_ajax(String rpcode);
	
	//댓글 수정
	int updateRpcontents_ajax(@Param("rpcode") String rpcode, @Param("rpcontents") String rpcontents);

	//자랑글 수정용 select
	@Select("select * from boards where bdcode=#{bdcode}")
	BoardDto selectRoomModify(String bdcode);

	//자랑글 수정
	int updateRoomView(BoardDto room);
	
	//자랑글 총 개수
	int selectRoomTotalCount(Paging paging);

	//고정된 자랑글 목록(민희)
	ArrayList<BoardDto> selectFixedRoomView();

	//일반게시판 전체 글 개수 조회 
	int selectBoardTotalCount(Paging paging);
	
	//글정렬 + 글검색 + 페이징 
	ArrayList<BoardDto> selectBoardPagingList_ajax(Paging paging);
	
	//공지게시판 전체 글 개수 조회 
	int selectNoticeTotalCount(Paging paging);
		
	//지역게시판 전체 글 개수 조회
	int selectRegionTotalCount(Paging paging);
	
	//지역게시판 전체 글 조회
	ArrayList<BoardDto> selectRegionBoardList_Paging(Paging paging);
	
	//자랑방 검색한 글 개수 조회
	int selectSearchRoomCount(Paging paging);
	
	//모댓글의 최대 depth 구하기 
	int selectreplyMaxDepth(String rerpcode);
	
	//댓글 목록 조회2 (+ 대댓글)
	ArrayList<ReplyDto> selectBoardReplyList2(@Param("bdcode") String bdcode,@Param("loginId")  String loginId);

	//자랑글 rn 조회
	int selectRoomList_page(String bdcode);

	//관리자용 댓글 조회
	ArrayList<ReplyDto> adminSelectBoardReplyList2(String bdcode);


	//공구게시판-진행완료 글 조회
	//ArrayList<NoticeDto> selectGonguEndBoardList(Paging paging);

	
	
}
