package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.ChatDto;

public interface ChatDao {

	// 채팅 목록 조회
	ArrayList<ChatDto> selectChatList();
	
	// 채팅번호 확인
	int selectMaxChcode();
	
	// 채팅정보 입력
	int insertChat(ChatDto chatDto);

	// 채팅 보낸사람 닉네임 확인
	String selectMfrnick(String chfrmid);
		
	// 채팅 받는사람 닉네임 확인
	String selectMtonick(String chtomid);
	
	// 채팅 작성시간 확인
	String selectTime(int chcode);

	
	



	
	
}
