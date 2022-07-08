package com.NumberOne.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDto {
	//회원게시판
	private String mid;				//아이디
	private String mpw;				//비밀번호
	private String mname;			//이름	
	private String mnickname;		//닉네임	
	private String mphone;			//전화번호
	private String memail;			//이메일
	
	private String mregion;			//관심지역
	
	private String maddr;			//주소


	private String mprofile;		//프로필
	private String mmessage;		//상태메세지
	private int mstate; 			//상태
	private String mjoindate;		//가입일

	private int mwarning;   		//신고수 (warningBoards 테이블 조인)
	
	
	private MultipartFile mfile; //프로필 파일
	
	private String mpostcode;   //우편번호
	private String maddress;	//주소
	private String mdetailAddr; //상세주소
	private String mextraAddr;  //참고항목
	
	private String memailId; //이메일아이디 
	private String memailDomain;  //이메일도메인
	
	private String bdtitle; //마이페이지 - 작성자 상세페이지 (작성글)
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMregion() {
		return mregion;
	}
	public void setMregion(String mregion) {
		this.mregion = mregion;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMprofile() {
		return mprofile;
	}
	public void setMprofile(String mprofile) {
		this.mprofile = mprofile;
	}
	public String getMmessage() {
		return mmessage;
	}
	public void setMmessage(String mmessage) {
		this.mmessage = mmessage;
	}
	public int getMstate() {
		return mstate;
	}
	public void setMstate(int mstate) {
		this.mstate = mstate;
	}
	public String getMjoindate() {
		return mjoindate;
	}
	public void setMjoindate(String mjoindate) {
		this.mjoindate = mjoindate;
	}
	public int getMwarning() {
		return mwarning;
	}
	public void setMwarning(int mwarning) {
		this.mwarning = mwarning;
	}
	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
	public String getMpostcode() {
		return mpostcode;
	}
	public void setMpostcode(String mpostcode) {
		this.mpostcode = mpostcode;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getMdetailAddr() {
		return mdetailAddr;
	}
	public void setMdetailAddr(String mdetailAddr) {
		this.mdetailAddr = mdetailAddr;
	}
	public String getMextraAddr() {
		return mextraAddr;
	}
	public void setMextraAddr(String mextraAddr) {
		this.mextraAddr = mextraAddr;
	}
	public String getMemailId() {
		return memailId;
	}
	public void setMemailId(String memailId) {
		this.memailId = memailId;
	}
	public String getMemailDomain() {
		return memailDomain;
	}
	public void setMemailDomain(String memailDomain) {
		this.memailDomain = memailDomain;
	}
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mnickname=" + mnickname + ", mphone="
				+ mphone + ", memail=" + memail + ", mregion=" + mregion + ", maddr=" + maddr + ", mprofile=" + mprofile
				+ ", mmessage=" + mmessage + ", mstate=" + mstate + ", mjoindate=" + mjoindate + ", mwarning="
				+ mwarning + ", mfile=" + mfile + ", mpostcode=" + mpostcode + ", maddress=" + maddress
				+ ", mdetailAddr=" + mdetailAddr + ", mextraAddr=" + mextraAddr + ", memailId=" + memailId
				+ ", memailDomain=" + memailDomain + "]";
	}
	
	
	
	
	
}
