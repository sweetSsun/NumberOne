package com.NumberOne.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.NumberOne.dto.MemberDto;

public interface MemberDao {

	@Select("SELECT MID FROM MEMBERS WHERE MID='ADMIN'")
	String test1();

	
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
	@Select("SELECT MID FROM MEMBERS WHERE mname = #{mname} AND memail = #{memail}")
	String ajax_selectMid(@Param("mname")String checkMname, @Param("memail")String checkMemail);
}
