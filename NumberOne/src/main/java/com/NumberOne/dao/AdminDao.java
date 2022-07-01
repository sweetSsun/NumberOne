package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.NoticeDto;

public interface AdminDao {

	ArrayList<MemberDto> admin_selectMemberList(String searchVal);

	int admin_updateMstate_ajax(@Param("mid") String mid, @Param("mstate") String mstate);

	MemberDto admin_selectMemberInfo_ajax(String mid);

	ArrayList<NoticeDto> admin_selectNoticeList(String searchVal);

	int admin_updateNbstate_ajax(@Param("nbcode") String nbcode, @Param("nbstate") String nbstate);
}
