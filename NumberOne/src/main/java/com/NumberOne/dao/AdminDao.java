package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.NoticeDto;

public interface AdminDao {

	int admin_selectMemberTotalCount(String searchVal);

	ArrayList<MemberDto> admin_selectMemberList(@Param("searchVal") String searchVal, @Param("startRow") int startRow, @Param("endRow") int endRow);

	int admin_updateMstate_ajax(@Param("mid") String mid, @Param("mstate") String mstate);

	MemberDto admin_selectMemberInfo_ajax(String mid);

	int admin_selectNoticeTotalCount(@Param("searchVal") String searchVal, @Param("searchType") String searchType, @Param("keyword") String keyword);

	ArrayList<NoticeDto> admin_selectNoticeList(@Param("searchVal") String searchVal, @Param("searchType") String searchType, @Param("keyword") String keyword, @Param("startRow") int startRow, @Param("endRow") int endRow);

	int admin_updateNbstate_ajax(@Param("nbcode") String nbcode, @Param("nbstate") String nbstate);

	String admin_selectMaxNbcode();

	int admin_insertNoticeWrite(NoticeDto notice);


}
