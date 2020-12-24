package com.bookstore.cart.model;

public class cartDTO {
	private int c_no; 			//NUMBER NOT NULL, /* 장바구니번호 */
	private int c_bookqty;		// NUMBER DEFAULT 1 NOT NULL, /* 수량 */
	private String bu_userid;	// VARCHAR2(20) NOT NULL, /* 아이디 */
	private int bd_no ;			// NUMBER NOT NULL /* 상품번호 */
	
	public cartDTO() {
		super();
	}
	
	public cartDTO(int c_no, int c_bookqty, String bu_userid, int bd_no) {
		super();
		this.c_no = c_no;
		this.c_bookqty = c_bookqty;
		this.bu_userid = bu_userid;
		this.bd_no = bd_no;
	}


	public int getC_no() {
		return c_no;
	}


	public void setC_no(int c_no) {
		this.c_no = c_no;
	}


	public int getC_bookqty() {
		return c_bookqty;
	}


	public void setC_bookqty(int c_bookqty) {
		this.c_bookqty = c_bookqty;
	}


	public String getBu_userid() {
		return bu_userid;
	}


	public void setBu_userid(String bu_userid) {
		this.bu_userid = bu_userid;
	}


	public int getBd_no() {
		return bd_no;
	}


	public void setBd_no(int bd_no) {
		this.bd_no = bd_no;
	}


	@Override
	public String toString() {
		return "cartDTO [c_no=" + c_no + ", c_bookqty=" + c_bookqty + ", bu_userid=" + bu_userid + ", bd_no=" + bd_no
				+ "]";
	}
	
}
