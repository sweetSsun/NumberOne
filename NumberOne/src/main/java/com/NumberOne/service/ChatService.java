package com.NumberOne.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dao.ChatDao;
import com.NumberOne.dto.ChatDto;

@Service
public class ChatService {

	@Autowired
	private ChatDao chdao;
	
	private ChatDto chdto;
	
	
	public void insertChat() {
		System.out.println("ChatService.insertChat() 호출");
		
		// 채팅 목록 확인 (select) : 번호생성조건으로 넣으려고 했는데 무조건 번호+1라서 pass
		// ArrayList<ChatDto> chatList = chdao.selectChatList();
		// System.out.println("입력 전 chatList.size() : "+chatList.size());
		
		
		// 채팅 번호 생성 (select)
		int maxChcode = chdao.selectMaxChcode();
			System.out.println("채팅MAX번호 : "+maxChcode);
			int chcode = maxChcode++;
			chdto.setChcode(chcode);
			System.out.println("채팅번호 : "+chcode);

		// 채팅 입력
		System.out.println(chdto);
		chdao.insertChat(chdto);
		
	}	
	
	
	
	
	
}
