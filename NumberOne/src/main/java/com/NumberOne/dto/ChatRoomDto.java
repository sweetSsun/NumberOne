package com.NumberOne.dto;

import lombok.Data;

@Data
public class ChatRoomDto {
	// 채팅방
	
	private String crcode;			//채팅방번호
	private String crfrmid;			//보낸사람
	private String crtomid;			//받는사람
	
	// 채팅방 목록 조회하면서 함께 출력해주어야 하는 필드
	private int unreadCount;			//읽음상태 count (chatmessage 조인 sum)
	private String recentCmcontents;	//가장 최신 메세지 (chatmessage 조인)
	private String recentCmdate;		//가장 최신 메세지의 날짜,시간 (chatmessage 조인)
	private String crfrmnickname;		//상대방 닉네임 (members 조인)
	private String crfrmprofile;		//상대방 프로필이미지 (members 조인)
	
	//테스트 용 마지막 메세지 보낸 사람
	private String recentmid;
	
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

	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}

	public String getRecentCmcontents() {
		return recentCmcontents;
	}

	public void setRecentCmcontents(String recentCmcontents) {
		this.recentCmcontents = recentCmcontents;
	}

	public String getRecentCmdate() {
		return recentCmdate;
	}

	public void setRecentCmdate(String recentCmdate) {
		this.recentCmdate = recentCmdate;
	}

	public String getCrfrmnickname() {
		return crfrmnickname;
	}

	public void setCrfrmnickname(String crfrmnickname) {
		this.crfrmnickname = crfrmnickname;
	}

	public String getCrfrmprofile() {
		return crfrmprofile;
	}

	public void setCrfrmprofile(String crfrmprofile) {
		this.crfrmprofile = crfrmprofile;
	}

	@Override
	public String toString() {
		return "ChatRoomDto [crcode=" + crcode + ", crfrmid=" + crfrmid + ", crtomid=" + crtomid + ", unreadCount="
				+ unreadCount + ", recentCmcontents=" + recentCmcontents + ", recentCmdate=" + recentCmdate
				+ ", crfrmnickname=" + crfrmnickname + ", crfrmprofile=" + crfrmprofile + "]";
	}
	
	
	
	
}
