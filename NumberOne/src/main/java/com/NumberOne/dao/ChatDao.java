package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.NumberOne.dto.ChatDto;

public interface ChatDao {

	// 채팅 목록 조회
	// ArrayList<ChatDto> selectChatList();
	
	// 채팅번호 확인
	int selectMaxChcode();
	
	// 채팅정보 입력
	int insertChat(ChatDto chatDto);
	
	



	
	
}
