package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.ReplyDto;

public interface MemberDao {

	//회원가입 처리
	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MNICKNAME, MPHONE, MEMAIL, MADDR, MPROFILE, MMESSAGE, MJOINDATE ) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, #{mnickname}, #{mphone}, #{memail}, #{maddr}, #{mprofile}, #{mmessage}, SYSDATE )")
	int insertRegisterWrite(MemberDto member);
	
	//아이디 중복 확인
	@Select("SELECT MID FROM MEMBERS WHERE MID = #{inputId}")
	String selectMemberId_ajax(String inputId);

	//로그인 요청
	@Select("SELECT MID, MPROFILE, MSTATE FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto selectMemberLogin(@Param("mid") String mid, @Param("mpw") String mpw);
	
	//아이디 찾기 요청
	@Select("SELECT MID FROM MEMBERS WHERE MNAME = #{mname} AND MEMAIL = #{memail}")
	String selectLookforId_ajax(@Param("mname")String checkMname, @Param("memail")String checkMemail);

	//회원정보
	@Select("SELECT MID, MPW, MNAME, MNICKNAME, MPHONE, MEMAIL, MADDR, MPROFILE, MMESSAGE FROM MEMBERS WHERE MID = #{loginId}")
	MemberDto selectMyInfoMemberView(String loginId);

	//마이페이지 회원정보 _ 작성글
	@Select("SELECT BD.BDCODE, BD.BDTITLE, RP.BDREPLY, BD.BDMID, BD.BDDATE "
			+ "FROM BOARDS BD, (SELECT RPBDCODE, COUNT (RPBDCODE) AS BDREPLY FROM REPLY GROUP BY RPBDCODE) RP "
			+ "WHERE BDCODE = RP.RPBDCODE AND BDMID = #{loginId} "
			+ "ORDER BY BD.BDCODE DESC")
	ArrayList<BoardDto> selectMyInfoMemberView_Boards(String loginId);

	//마이페이지 회원정보 _ 댓글 작성한 글	
	@Select("SELECT RP.RPBDCODE, RP.RPCODE, BD.BDTITLE as rpbdtitle, RP.RPCONTENTS, RP.RPDATE "
			+ "FROM BOARDS BD, REPLY RP "
			+ "WHERE BDCODE = RPBDCODE AND RPMID = #{loginId} "
			+ "ORDER BY RP.RPCODE DESC")
	ArrayList<ReplyDto> selectMyInfoMemberView_Reply(String loginId);

	
}





