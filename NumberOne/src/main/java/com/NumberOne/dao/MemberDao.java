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
	int insertMemberRegister(MemberDto member);
	
	//아이디 중복 확인
	@Select("SELECT MID FROM MEMBERS WHERE MID = #{inputId}")
	String selectCheckMid(String inputId);

	//로그인 요청
	@Select("SELECT MID, MPROFILE, MSTATE FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto selectMemberLogin(@Param("mid") String mid, @Param("mpw") String mpw);

}
