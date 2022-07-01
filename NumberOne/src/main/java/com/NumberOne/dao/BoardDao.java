package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.NoticeDto;

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
	
	//게시판 글상세페이지
	BoardDto selectBoardView(String bdcode);	
	
	   //일반게시판 글목록 조회 
	   @Select("SELECT BDCODE, BDRGCODE, BDCATEGORY, BDMID, BDTITLE, BDCONTENTS, "
	          + "      TO_CHAR(BDDATE,'YY-MM-DD') AS BDDATE, "
	          + "      BDIMG, BDDETAILIMG, BDSTATE, BDHITS, MB.MNICKNAME AS BDNICKNAME "
	          + "FROM BOARDS BD, MEMBERS MB "
	          + "WHERE BD.BDMID = MB.MID "
	          + "ORDER BY BDCODE DESC " )
	   ArrayList<BoardDto> selectBoardList();

	//아이디로 닉네임 찾기
	@Select("select mnickname from members where mid= #{mid}")
	String selectRoomWriterMnickname(String mid);

	//자취방 자랑글 상세 조회
	BoardDto selectRoomList(String bdcode);

	//자취방 자랑글 추천
	@Insert("insert into recommend values (#{rcmid}, #{rcbdcode})")
	int insertRecommend(@Param ("rcbdcode") String bdcode,@Param ("rcmid") String bdmid);
	

	//자취방 자랑글 추천 이력 조회
	@Select("select count(*) from recommend where rcbdcode = #{rcbdcode} and rcmid=#{rcmid}")
	int recommendCh(@Param ("rcbdcode") String bdcode,@Param ("rcmid") String bdmid);

	//자취방 자랑글 추천 취소(recommend 테이블에서 튜플 삭제)
	@Delete("delete from recommend where rcbdcode = #{rcbdcode} and rcmid=#{rcmid}")
	int deleteRecommend(@Param ("rcbdcode") String bdcode,@Param ("rcmid") String bdmid);




	
}
