package com.NumberOne.dto;

import lombok.Data;

@Data
public class ChatRoomDto {
	// 채팅방
	
	private String crcode;			//채팅방번호
	private String crfrmid;			//보낸사람
	private String crtomid;			//받는사람
	
	// 각 채팅방의 안읽은 메세지수
	private int unreadCount;		//읽음상태 count (chatmessage 조인)

	public String getCrcode() {
		return crcode;
	}

	public void setCrcode(String crcode) {
		this.crcode = crcode;
	}

	public String getCrfrmid() {
		return crfrmid;
	}

	public void setCrfrmid(String crfrmid) {
		this.crfrmid = crfrmid;
	}

	public String getCrtomid() {
		return crtomid;
	}

	public void setCrtomid(String crtomid) {
		this.crtomid = crtomid;
	}

	public int getUnreadCount() {
		return unreadCount;
	}

	public void setUnReadCount(int crReadCount) {
		this.unreadCount = crReadCount;
	}

	@Override
	public String toString() {
		return "ChatRoomDto [crcode=" + crcode + ", crfrmid=" + crfrmid + ", crtomid=" + crtomid + ", unReadCount="
				+ unreadCount + "]";
	}
	
	
}
