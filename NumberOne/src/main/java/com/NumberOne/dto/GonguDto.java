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
	
	@Override
	public String toString() {
		return "GonguDto [gnbcode=" + gnbcode + ", gmid=" + gmid + ", gphone=" + gphone + ", gemail=" + gemail
				+ ", gaddr=" + gaddr + ", gdate=" + gdate + "]";
	}
	
	
}
