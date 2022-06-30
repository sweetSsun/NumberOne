package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.MemberDto;

public interface AdminDao {

	ArrayList<MemberDto> selectMemberList(String searchVal);

	int updateMstate_ajax(@Param("mid") String mid, @Param("mstate") String mstate);

	MemberDto selectMemberInfo_ajax(String mid);
}
