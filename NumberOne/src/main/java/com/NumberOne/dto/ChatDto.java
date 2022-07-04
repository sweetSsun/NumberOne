package com.NumberOne.dto;

import lombok.Data;

@Data
public class ChatDto {
	//채팅

	private int chcode;				//채팅번호
	private String chfrmid;			//보낸사람	
	private String chtomid;			//받는사람	
	private String chcontents;		//내용
	private String chdate;			//작성일


	private String chfrmnick;		//보낸사람 닉네임
	private String chtomnick;		//받는사람 닉네임
	
	private String chdatetime;		//작성시간

	public int getChcode() {
		return chcode;
	}

	public void setChcode(int chcode) {
		this.chcode = chcode;
	}

	public String getChfrmid() {
		return chfrmid;
	}

	public void setChfrmid(String chfrmid) {
		this.chfrmid = chfrmid;
	}

	public String getChtomid() {
		return chtomid;
	}

	public void setChtomid(String chtomid) {
		this.chtomid = chtomid;
	}

	public String getChcontents() {
		return chcontents;
	}

	public void setChcontents(String chcontents) {
		this.chcontents = chcontents;
	}

	public String getChdate() {
		return chdate;
	}

	public void setChdate(String chdate) {
		this.chdate = chdate;
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

	public String getChdatetime() {
		return chdatetime;
	}

	public void setChdatetime(String chdatetime) {
		this.chdatetime = chdatetime;
	}

	@Override
	public String toString() {
		return "ChatDto [chcode=" + chcode + ", chfrmid=" + chfrmid + ", chtomid=" + chtomid + ", chcontents="
				+ chcontents + ", chdate=" + chdate + ", chfrmnick=" + chfrmnick + ", chtomnick=" + chtomnick
				+ ", chdatetime=" + chdatetime + "]";
	}
	
	
	
}
