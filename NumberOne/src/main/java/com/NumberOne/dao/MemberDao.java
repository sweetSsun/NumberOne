package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.ContactDto;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.ReplyDto;

public interface MemberDao {

	//회원가입 처리
	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MNICKNAME, MPHONE, MEMAIL, MREGION ,MADDR, MPROFILE, MMESSAGE, MJOINDATE ) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, #{mnickname}, #{mphone}, #{memail}, #{mregion}, #{maddr}, #{mprofile}, #{mmessage}, SYSDATE )")
	int insertRegisterWrite(MemberDto member);
	
	//아이디 중복 확인
	@Select("SELECT MID FROM MEMBERS WHERE MID = #{inputId}")
	String selectMemberId_ajax(String inputId);
	
	//닉네임 중복 확인
	@Select("SELECT MNICKNAME FROM MEMBERS WHERE MNICKNAME = #{inputNickname}")	
	String selectMemberNickname_ajax(String inputNickname);

	//로그인 요청
	@Select("SELECT MID, MPROFILE, MSTATE FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto selectMemberLogin(@Param("mid") String mid, @Param("mpw") String mpw);
	
	//아이디 찾기 요청
	@Select("SELECT MID FROM MEMBERS WHERE MNAME = #{mname} AND MEMAIL = #{memail}")
	String selectLookforId_ajax(@Param("mname")String checkMname, @Param("memail")String checkMemail);

	//회원정보
	@Select("SELECT MID, MPW, MNAME, MNICKNAME, MPHONE, MEMAIL, MREGION, MADDR, MPROFILE, MMESSAGE FROM MEMBERS WHERE MID = #{loginId}")
	MemberDto selectMyInfoMemberView(String loginId);

	//회원정보수정
	@Update("UPDATE MEMBERS SET MPW = #{mpw}, MNAME = #{mname}, MNICKNAME = #{mnickname}, MPHONE = #{mphone}, MEMAIL = #{memail}, MADDR = #{maddr}, "
			+ "MPROFILE = #{mprofile}, MMESSAGE = #{mmessage} WHERE MID = #{mid}")	
	int updateMyInfoMemberModify(MemberDto member);
	
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

	//회원탈퇴
	@Update("UPDATE MEMBERS SET MSTATE = 2 WHERE MID = #{loginId}")
	int updateMemberWithdraw(String loginId);

	//1:1문의 글 번호 생성 (최대값)
	@Select("SELECT NVL(MAX(CTCODE), 'CT00000') FROM CONTACT")
	String selectMaxCtcode();

	//1:1문의 글 작성 요청
	@Insert("INSERT INTO CONTACT (CTCODE, CTTITLE, CTCONTENTS, CTMID, CTDATE) "
			+ "VALUES (#{ctcode}, #{cttitle}, #{ctcontents}, #{ctmid}, SYSDATE) ")
	int insertMyInfoQuestionWrite(ContactDto contact);

	//1:1 문의 내역
	@Select("SELECT CTCODE, CTTITLE, CTCONTENTS, CTMID, TO_CHAR(CTDATE,'YYYY-MM-DD HH24:MI') AS CTDATE, "
			+ "CTANS, TO_CHAR(CTANSDATE,'YYYY-MM-DD HH24:MI') AS CTANSDATE FROM CONTACT WHERE CTMID=#{loginId} ORDER BY CTCODE DESC")
	ArrayList<ContactDto> selectMyInfoQuestionListView(String loginId);

	
	//카카오 가입확인
	@Select("SELECT MID, MPROFILE FROM MEMBERS WHERE MID = #{mid}")
		MemberDto selectMemberKakao(String mid);
	
	//카카오 회원가입 처리
/*	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MNICKNAME, MPHONE, MEMAIL, MREGION ,MPROFILE, MSTATE) "
			+ "VALUES(#{mid}, #{mpw},#{mname} ,#{mnickname},#{mphone}, #{memail},#{mregion}, #{mprofile}, 5 )")
		    int insertMemberKakao(MemberDto member);	
*/
	 

 	//카카오 회원가입 처리
	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MNICKNAME, MPHONE, MEMAIL, MREGION ,MPROFILE, MSTATE) "
			+ "VALUES(#{mid}, #{mpw},'kakaoLogin' ,#{mnickname},'000-0000-0000', #{memail},'인천', #{mprofile}, 5 )")
		    int insertMemberKakao(MemberDto member);
 	
	 
	 	


	
}





