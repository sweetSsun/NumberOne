package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.ChatMessageDto;
import com.NumberOne.dto.ChatRoomDto;

public interface ChatDao {
//
//	// 채팅 목록 조회
//	ArrayList<ChatMessageDto> selectChatList();
//	

//	


//		
//	// 채팅 받는사람 닉네임 확인
//	String selectMtonick(String chtomid);
//	
//	// 채팅 작성시간 확인
//	String selectTime(int chcode);
//
	
	
	
	/* 새로한거! */
//	ChatRoomDto selectChatRoom(String cmcrcode);

	int insertChatRoom(ChatMessageDto chatMessage);

	String selectMaxCrcode();

	ChatRoomDto selectChatRoom_1(String crcode);
	
	ChatRoomDto selectChatRoom_2(@Param ("crfrmid") String crfrmid, @Param ("crtomid") String crtomid);
	
	int selectMaxCmcode();

	int insertChatMessage(ChatMessageDto chatMessage);

	String selectMnickname(String mid);

	ArrayList<ChatMessageDto> selectChatRoomMessage(String crcode);

	void updateCmread(@Param ("crcode") String crcode, @Param ("mid") String mid);

	ArrayList<ChatRoomDto> selectChatRoomList(String loginId);

	int selectUnReadCount(@Param ("loginId") String loginId, @Param ("cmcrcode") String cmcrcode);

	ChatMessageDto selectRecentMessage(String cmcrcode);

	String selectCrfrMprofile(String mid);

	
	
}
