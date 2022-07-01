package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.NoticeDto;

public interface AdminDao {

	ArrayList<MemberDto> admin_selectMemberList(@Param("searchVal") String searchVal, @Param("startRow") int startRow, @Param("endRow") int endRow);

	int admin_updateMstate_ajax(@Param("mid") String mid, @Param("mstate") String mstate);

	MemberDto admin_selectMemberInfo_ajax(String mid);

	ArrayList<NoticeDto> admin_selectNoticeList(@Param("searchVal") String searchVal, @Param("searchType") String searchType, @Param("keyword") String keyword);

	//ArrayList<NoticeDto> admin_selectSearchNoticeList(@Param("searchType") String searchType, @Param("keyword") String keyword);

	int admin_updateNbstate_ajax(@Param("nbcode") String nbcode, @Param("nbstate") String nbstate);

	int selectMemberTotalCount(String searchVal);
}
