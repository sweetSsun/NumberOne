package com.NumberOne.dto;

import lombok.Data;

@Data
public class ChatMessageDto {
	//채팅메세지

	private int cmcode;				//채팅번호
	private String cmcrcode;		//채팅방번호
	private String cmfrmid;			//보낸사람	
	private String cmcontents;		//내용
	private String cmdate;			//보낸시간
	private int cmread;				//읽음상태
	
	// 채팅방 출력시 닉네임으로
	private String chfrmnick;		//보낸사람 닉네임
	private String chtomnick;		//받는사람 닉네임
	
	//읽음상태 값을 저장하기 위해 필요한 세션
	private int sessionCount;

	public int getCmcode() {
		return cmcode;
	}

	public void setCmcode(int cmcode) {
		this.cmcode = cmcode;
	}

	public String getCmcrcode() {
		return cmcrcode;
	}

	public void setCmcrcode(String cmcrcode) {
		this.cmcrcode = cmcrcode;
	}

	public String getCmfrmid() {
		return cmfrmid;
	}

	public void setCmfrmid(String cmfrmid) {
		this.cmfrmid = cmfrmid;
	}

	public String getCmcontents() {
		return cmcontents;
	}

	public void setCmcontents(String cmcontents) {
		this.cmcontents = cmcontents;
	}

	public String getCmdate() {
		return cmdate;
	}

	public void setCmdate(String cmdate) {
		this.cmdate = cmdate;
	}

	public int getCmread() {
		return cmread;
	}

	public void setCmread(int cmread) {
		this.cmread = cmread;
	}

	public String getChfrmnick() {
		return chfrmnick;
	}

	public void setChfrmnick(String chfrmnick) {
		this.chfrmnick = chfrmnick;
	}

	public String getChtomnick() {
		return chtomnick;
	}

	public void setChtomnick(String chtomnick) {
		this.chtomnick = chtomnick;
	}

	public int getSessionCount() {
		return sessionCount;
	}

	public void setSessionCount(int sessionCount) {
		this.sessionCount = sessionCount;
	}

	@Override
	public String toString() {
		return "ChatMessageDto [cmcode=" + cmcode + ", cmcrcode=" + cmcrcode + ", cmfrmid=" + cmfrmid + ", cmcontents="
				+ cmcontents + ", cmdate=" + cmdate + ", cmread=" + cmread + ", chfrmnick=" + chfrmnick + ", chtomnick="
				+ chtomnick + ", sessionCount=" + sessionCount + "]";
	}
	
}
