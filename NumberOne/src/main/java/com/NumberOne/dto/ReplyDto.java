package com.NumberOne.dto;

import lombok.Data;

@Data
public class ReplyDto {
	//댓긅-일반, 자랑 
	private String rpcode;      //댓글번호
	private String rpbdcode;	//글번호
	private String rpcontents;	//내용
	private String rpmid;		//작성자
	private String rpdate;		//작성일
	private int rpstate;		//상태

	private String rpbdtitle;		//댓글 원본글 제목
	private String rpbdcategory;	//댓글 원본글 카테고리

	private String rpnickname;	//작성자 닉네임
	
	private String rpprofile;	//작성자 프로필
	private String rpmprofile;
	
	private String rpmstate;
	private String bdstate;
	
	public String getRpcode() {
		return rpcode;
	}
	public void setRpcode(String rpcode) {
		this.rpcode = rpcode;
	}
	public String getRpbdcode() {
		return rpbdcode;
	}
	public void setRpbdcode(String rpbdcode) {
		this.rpbdcode = rpbdcode;
	}
	public String getRpcontents() {
		return rpcontents;
	}
	public void setRpcontents(String rpcontents) {
		this.rpcontents = rpcontents;
	}
	public String getRpmid() {
		return rpmid;
	}
	public void setRpmid(String rpmid) {
		this.rpmid = rpmid;
	}
	public String getRpdate() {
		return rpdate;
	}
	public void setRpdate(String rpdate) {
		this.rpdate = rpdate;
	}
	public int getRpstate() {
		return rpstate;
	}
	public void setRpstate(int rpstate) {
		this.rpstate = rpstate;
	}
	
	public String getRpnickname() {
		return rpnickname;
	}
	public void setRpnickname(String rpnickname) {
		this.rpnickname = rpnickname;
	}
	public String getRpbdtitle() {
		return rpbdtitle;
	}
	public void setRpbdtitle(String rpbdtitle) {
		this.rpbdtitle = rpbdtitle;
	}
	public String getRpbdcategory() {
		return rpbdcategory;
	}
	public void setRpbdcategory(String rpbdcategory) {
		this.rpbdcategory = rpbdcategory;
	}
	public String getRpprofile() {
		return rpprofile;
	}
	public void setRpprofile(String rpprofile) {
		this.rpprofile = rpprofile;
	}
	public String getRpmprofile() {
		return rpprofile;
	}
	public void setRpmprofile(String rpmprofile) {
		this.rpprofile = rpmprofile;
	}
	public String getRpmstate() {
		return rpmstate;
	}
	public void setRpmstate(String rpmstate) {
		this.rpmstate = rpmstate;
	}
	public String getBdstate() {
		return bdstate;
	}
	public void setBdstate(String bdstate) {
		this.bdstate = bdstate;
	}
	@Override
	public String toString() {
		return "ReplyDto [rpcode=" + rpcode + ", rpbdcode=" + rpbdcode + ", rpcontents=" + rpcontents + ", rpmid="
				+ rpmid + ", rpdate=" + rpdate + ", rpstate=" + rpstate + ", rpbdtitle=" + rpbdtitle + ", rpbdcategory="
				+ rpbdcategory + ", rpnickname=" + rpnickname + ", rpprofile=" + rpprofile + ", rpmprofile="
				+ rpmprofile + ", rpmstate=" + rpmstate + ", bdstate=" + bdstate + "]";
	}
	
	
	
	
	
	
	
	
}
