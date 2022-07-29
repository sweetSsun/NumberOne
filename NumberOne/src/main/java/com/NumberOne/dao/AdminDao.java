package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.ContactDto;
import com.NumberOne.dto.GonguDto;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.dto.ReplyDto;
import com.NumberOne.dto.UsedBoardDto;

public interface AdminDao {

	int admin_selectMemberTotalCount(Paging paging);

	ArrayList<MemberDto> admin_selectMemberList(Paging paging);

	int admin_updateMstate_ajax(@Param("mid") String mid, @Param("mstate") int mstate);

	MemberDto admin_selectMemberInfo_ajax(String mid);

	int admin_selectNoticeTotalCount(Paging paging);
	int admin_selectGonguTotalCount(Paging paging);

	ArrayList<NoticeDto> admin_selectNoticeList(Paging paging);
	ArrayList<NoticeDto> admin_selectGonguList(Paging paging);
	
	int admin_updateNbstate_ajax(@Param("nbcode") String nbcode, @Param("nbstate") int nbstate);

	int admin_updateNbfix_ajax(@Param("nbcode") String nbcode, @Param("nbfix") int nbfix);
	
	String admin_selectMaxNbcode();
	String admin_selectMaxGbcode();

	int admin_insertNoticeWrite(NoticeDto notice);

	int admin_updateNoticeModify(NoticeDto notice);
	
	int admin_selectResellTotalCount(Paging paging);
	
	ArrayList<UsedBoardDto> admin_selectResellList(Paging paging);
	
	int admin_updateUbstate_ajax(@Param("ubcode") String ubcode, @Param("ubstate") int ubstate);

	int admin_selectBoardTotalCount(Paging paging);

	ArrayList<BoardDto> admin_selectBoardList(Paging paging);
	
	int admin_selectBdfixTotalCount(Paging paging);

	ArrayList<BoardDto> admin_selectBdfixList(Paging paging);
	
	int admin_updateBdfix_ajax(@Param("bdcode") String bdcode, @Param("bdfix") int bdfix);
	
	
	
	int admin_updateBdstate_ajax(@Param("bdcode") String bdcode, @Param("bdstate") int bdstate);

	int admin_selectReplyTotalCount(Paging paging);

	ArrayList<ReplyDto> admin_selectReplyList(Paging paging);

	int admin_updateRpstate_ajax(@Param("rpcode") String rpcode, @Param("rpstate") int rpstate);

	int admin_selectContactTotalCount(Paging paging);

	ArrayList<ContactDto> admin_selectContactList(Paging paging);

	int admin_updateQuestionAns_ajax(@Param("ctcode") String ctcode, @Param("ctans") String ctans);

	int admin_updateBoardStop(String bdcode);

	int admin_updateResellStop(String ubcode);
	
	//관리자 - 댓글정지 
	int admin_updateReplyStop(String rpcode);

	
	//공동구매 & 공구 카카오결제정보 DB입력 
	int insertGonguResgister(GonguDto gongu);
	//공동구매 & 공구 카카오결제정보 DB삭제 
	int deleteGonguResgister(GonguDto gongu);
	//공동구매 & 공구 카카오결제정보 DB찾기 
	String insertCheck_ajax(String nbcode, String mid);
}
