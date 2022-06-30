package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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

	   //일반게시판 글목록 조회 
	   @Select("SELECT BDCODE, BDRGCODE, BDCATEGORY, BDMID, BDTITLE, BDCONTENTS, "
	         + "      TO_CHAR(BDDATE,'YY-MM-DD') AS BDDATE, "
	         + "     BDIMG, BDDETAILIMG, BDSTATE, BDHITS, MB.MNICKNAME AS BDNICKNAME "
	         + "FROM BOARDS BD, MEMBERS MB "
	         + "WHERE BD.BDMID = MB.MID " )
	   ArrayList<BoardDto> selectBoardList();
	   
	   //공지게시판 글목록 조회 
	   ArrayList<NoticeDto> selectNoticeList();
	   
	   //카테고리별 글목록 조회 
	   @Select("SELECT BDCODE, BDRGCODE, BDCATEGORY, BDMID, BDTITLE, BDCONTENTS, TO_CHAR(BDDATE,'YY-MM-DD') AS BDDATE, "
	         + "     BDIMG, BDDETAILIMG, BDSTATE, BDHITS, MB.MNICKNAME AS BDNICKNAME "
	         + "FROM BOARDS BD, MEMBERS MB "
	         + "WHERE BD.BDMID = MB.MID "
	         + "AND BD.BDCATEGORY = #{bdcategory} ")
	   ArrayList<BoardDto> selectBoardCategoryList(String bdcategory);
	   
	   //자취방 자랑 글목록 조회 
	   ArrayList<BoardDto> selectRoomList(String bdcategory);
}
