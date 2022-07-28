package com.NumberOne.dto;

import lombok.Data;

@Data
public class GonguDto {
	//공구게시판
	private String gnbcode;
	private String gmid;
	private String gphone;
	private String gemail;
	private String gaddr;
	private String gdate;

	private String gnbtitle; // 글 제목 (마이페이지 공구)
	private String gnbstate; // 글 상태 (마이페이지 공구) 

	public String getGnbcode() {
		return gnbcode;
	}
	public void setGnbcode(String gnbcode) {
		this.gnbcode = gnbcode;
	}
	public String getGmid() {
		return gmid;
	}
	public void setGmid(String gmid) {
		this.gmid = gmid;
	}
	public String getGphone() {
		return gphone;
	}
	public void setGphone(String gphone) {
		this.gphone = gphone;
	}
	public String getGemail() {
		return gemail;
	}
	public void setGemail(String gemail) {
		this.gemail = gemail;
	}
	public String getGaddr() {
		return gaddr;
	}
	public void setGaddr(String gaddr) {
		this.gaddr = gaddr;
	}
	public String getGdate() {
		return gdate;
	}
	public void setGdate(String gdate) {
		this.gdate = gdate;
	}
	public String getGnbtitle() {
		return gnbtitle;
	}
	public void setGnbtitle(String gnbtitle) {
		this.gnbtitle = gnbtitle;
	}
	public String getGnbstate() {
		return gnbstate;
	}
	public void setGnbstate(String gnbstate) {
		this.gnbstate = gnbstate;
	}
	
	@Override
	public String toString() {
		return "GonguDto [gnbcode=" + gnbcode + ", gmid=" + gmid + ", gphone=" + gphone + ", gemail=" + gemail

				+ ", gaddr=" + gaddr + ", gdate=" + gdate + ", gnbtitle=" + gnbtitle + ", gnbstate=" + gnbstate + "]";
	}

	
}
