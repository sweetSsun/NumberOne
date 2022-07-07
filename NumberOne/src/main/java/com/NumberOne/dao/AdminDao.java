package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.dto.ReplyDto;
import com.NumberOne.dto.UsedBoardDto;

public interface AdminDao {

	int admin_selectMemberTotalCount(Paging paging);

	ArrayList<MemberDto> admin_selectMemberList(Paging paging);

	int admin_updateMstate_ajax(@Param("mid") String mid, @Param("mstate") String mstate);

	MemberDto admin_selectMemberInfo_ajax(String mid);

	int admin_selectNoticeTotalCount(@Param("searchVal") String searchVal, @Param("searchType") String searchType, @Param("keyword") String keyword);

	ArrayList<NoticeDto> admin_selectNoticeList(@Param("searchVal") String searchVal, @Param("searchType") String searchType, @Param("keyword") String keyword, @Param("startRow") int startRow, @Param("endRow") int endRow);

	int admin_updateNbstate_ajax(@Param("nbcode") String nbcode, @Param("nbstate") String nbstate);

	String admin_selectMaxNbcode();

	int admin_insertNoticeWrite(NoticeDto notice);

	int admin_updateNoticeModify(NoticeDto notice);
	
	int admin_selectResellTotalCount(Paging paging);
	
	ArrayList<UsedBoardDto> admin_selectResellList(Paging paging);
	
	int admin_updateUbstate_ajax(@Param("ubcode") String ubcode, @Param("ubstate") String ubstate);

	
	
	int admin_selectBoardTotalCount(Paging paging);

	ArrayList<BoardDto> admin_selectBoardList(Paging paging);

	int admin_updateBdstate_ajax(@Param("bdcode") String bdcode, @Param("bdstate") String bdstate);

	int admin_selectReplyTotalCount(Paging paging);

	ArrayList<ReplyDto> admin_selectReplyList(Paging paging);

	int admin_updateRpstate_ajax(@Param("rpcode") String rpcode, @Param("rpstate") String rpstate);

}
