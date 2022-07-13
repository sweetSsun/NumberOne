package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.ChatMessageDto;
import com.NumberOne.dto.ChatRoomDto;

public interface ChatDao {

	// 채팅 목록 조회
	ArrayList<ChatMessageDto> selectChatList();
	
	// 채팅번호 확인
	int selectMaxChcode();
	
	// 채팅정보 입력
	int insertChat(ChatMessageDto chatDto);

	// 채팅 보낸사람 닉네임 확인
	String selectMfrnick(String chfrmid);
		
	// 채팅 받는사람 닉네임 확인
	String selectMtonick(String chtomid);
	
	// 채팅 작성시간 확인
	String selectTime(int chcode);

	
	
	
	/* 새로한거! */
	ChatRoomDto selectChatRoom(String cmcrcode);
	
	
	



	
	
}
