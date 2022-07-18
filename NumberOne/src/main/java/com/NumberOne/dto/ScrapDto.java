package com.NumberOne.dto;

import lombok.Data;

@Data
public class ScrapDto {
	
	private String scmid;		//스크랩한 사람
	private String scbdcode;	//스크랩한 글번호	
	
	//마이페이지 - 스크랩 목록 출력으로 추가
	private String bdtitle;		//스크랩한 글제목
	private String bdreply;		//스크랩한 글 댓글수
	private String mnickname;	// 원본 글 작성자 닉네임
	private String bddate;		// 글 작성 날짜
	private int bdstate;		// 글 상태
	public String getScmid() {
		return scmid;
	}
	public void setScmid(String scmid) {
		this.scmid = scmid;
	}
	public String getScbdcode() {
		return scbdcode;
	}
	public void setScbdcode(String scbdcode) {
		this.scbdcode = scbdcode;
	}
	public String getBdtitle() {
		return bdtitle;
	}
	public void setBdtitle(String bdtitle) {
		this.bdtitle = bdtitle;
	}
	public String getBdreply() {
		return bdreply;
	}
	public void setBdreply(String bdreply) {
		this.bdreply = bdreply;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getBddate() {
		return bddate;
	}
	public void setBddate(String bddate) {
		this.bddate = bddate;
	}
	public int getBdstate() {
		return bdstate;
	}
	public void setBdstate(int bdstate) {
		this.bdstate = bdstate;
	}
	@Override
	public String toString() {
		return "ScrapDto [scmid=" + scmid + ", scbdcode=" + scbdcode + ", bdtitle=" + bdtitle + ", bdreply=" + bdreply
				+ ", mnickname=" + mnickname + ", bddate=" + bddate + ", bdstate=" + bdstate + "]";
	}
	
	
	
}
