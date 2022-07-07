package com.NumberOne.dto;

import lombok.Data;

@Data
public class ContactDto {
	//문의게시판
	private String ctcode;		//글번호
	private String cttitle;		//글제목	
	private String ctcontents;	//글내용
	private String ctmid;		//작성자		
	private String ctdate;		//작성일
	private String ctans;		//답변
	private String ctansdate;	//답변일
	
	private String ctnickname;	//작성자닉네임 (members 테이블 조인)

	public String getCtcode() {
		return ctcode;
	}
	public void setCtcode(String ctcode) {
		this.ctcode = ctcode;
	}
	public String getCttitle() {
		return cttitle;
	}
	public void setCttitle(String cttitle) {
		this.cttitle = cttitle;
	}
	public String getCtcontents() {
		return ctcontents;
	}
	public void setCtcontents(String ctcontents) {
		this.ctcontents = ctcontents;
	}
	public String getCtmid() {
		return ctmid;
	}
	public void setCtmid(String ctmid) {
		this.ctmid = ctmid;
	}
	public String getCtdate() {
		return ctdate;
	}
	public void setCtdate(String ctdate) {
		this.ctdate = ctdate;
	}
	public String getCtans() {
		return ctans;
	}
	public void setCtans(String ctans) {
		this.ctans = ctans;
	}
	public String getCtansdate() {
		return ctansdate;
	}
	public void setCtansdate(String ctansdate) {
		this.ctansdate = ctansdate;
	}
	@Override
	public String toString() {
		return "ContactDto [ctcode=" + ctcode + ", cttitle=" + cttitle + ", ctcontents=" + ctcontents + ", ctmid="
				+ ctmid + ", ctdate=" + ctdate + ", ctans=" + ctans + ", ctansdate=" + ctansdate + "]";
	}
	
	
	
}
