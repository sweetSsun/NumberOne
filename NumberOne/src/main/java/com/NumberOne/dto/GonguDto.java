package com.NumberOne.dto;

import lombok.Data;

@Data
public class GonguDto {
	//공구게시판
	private String ggbcode;
	private String ggmid;
	private String ggphone;
	private String ggemail;
	private String ggaddr;
	private String ggdate;

	private String ggbtitle; // 글 제목 (마이페이지 공구)
	private String ggbstate; // 글 상태 (마이페이지 공구) 
	
	public String getGgbcode() {
		return ggbcode;
	}
	public void setGgbcode(String ggbcode) {
		this.ggbcode = ggbcode;
	}
	public String getGgmid() {
		return ggmid;
	}
	public void setGmid(String ggmid) {
		this.ggmid = ggmid;
	}
	public String getGgphone() {
		return ggphone;
	}
	public void setGphone(String ggphone) {
		this.ggphone = ggphone;
	}
	public String getGgemail() {
		return ggemail;
	}
	public void setGemail(String ggemail) {
		this.ggemail = ggemail;
	}
	public String getGgaddr() {
		return ggaddr;
	}
	public void setGaddr(String ggaddr) {
		this.ggaddr = ggaddr;
	}
	public String getGgdate() {
		return ggdate;
	}
	public void setGdate(String ggdate) {
		this.ggdate = ggdate;
	}
	public String getGgbtitle() {
		return ggbtitle;
	}
	public void setGgbtitle(String ggbtitle) {
		this.ggbtitle = ggbtitle;
	}
	public String getGgbstate() {
		return ggbstate;
	}
	public void setGgbstate(String ggbstate) {
		this.ggbstate = ggbstate;
	}

	@Override
	public String toString() {
		return "GonguDto [ggbcode=" + ggbcode + ", ggmid=" + ggmid + ", ggphone=" + ggphone + ", ggemail=" + ggemail

				+ ", ggaddr=" + ggaddr + ", gdate=" + ggdate + ", ggbtitle=" + ggbtitle + ", ggbstate=" + ggbstate + "]";
	}

	
}
