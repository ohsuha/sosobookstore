package com.bookstore.comment.model;

import java.util.Date;

public class CommentDTO {
	int c_no; //NUMBER NOT NULL, /* 댓글번호 */
	int bd_no; //NUMBER NOT NULL, /* 상품번호 */
	String bu_userid; // VARCHAR2(20) NOT NULL, /* 작성자아이디 */
	String sc_about; // VARCHAR2(3000) NOT NULL, /* 댓글내용 */
	Date sc_regdate; // DATE /* 작성일 */
	//table join으로 가져오는 책이름 변수
	String bd_title; //책 이름
	
	public CommentDTO() {
		super();
	}
	
	public CommentDTO(int c_no, int bd_no, String bu_userid, String sc_about, Date sc_regdate, String bd_title) {
		super();
		this.c_no = c_no;
		this.bd_no = bd_no;
		this.bu_userid = bu_userid;
		this.sc_about = sc_about;
		this.sc_regdate = sc_regdate;
		this.bd_title = bd_title;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getBd_no() {
		return bd_no;
	}
	public void setBd_no(int bd_no) {
		this.bd_no = bd_no;
	}

	public String getBu_userid() {
		return bu_userid;
	}

	public void setBu_userid(String bu_userid) {
		this.bu_userid = bu_userid;
	}

	public String getSc_about() {
		return sc_about;
	}

	public void setSc_about(String sc_about) {
		this.sc_about = sc_about;
	}

	public Date getSc_regdate() {
		return sc_regdate;
	}

	public void setSc_regdate(Date sc_regdate) {
		this.sc_regdate = sc_regdate;
	}

	public String getBd_title() {
		return bd_title;
	}

	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}

	@Override
	public String toString() {
		return "CommentDTO [c_no=" + c_no + ", bd_no=" + bd_no + ", bu_userid=" + bu_userid + ", sc_about=" + sc_about
				+ ", sc_regdate=" + sc_regdate + ", bd_title=" + bd_title + "]";
	}
}
