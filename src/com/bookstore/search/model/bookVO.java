package com.bookstore.search.model;

public class bookVO {
	private String ISBN; // VARCHAR2(20) NOT NULL, /* ISBN */
	private int orderno; //NUMBER NOT NULL, /* 분류번호 */
	private String booktitle;// VARCHAR2(40) NOT NULL, /* 제목 */
	private String publisher;// VARCHAR2(20) NOT NULL, /* 출판사 */
	private String writer;// VARCHAR2(25) NOT NULL, /* 저자 */
	private int price;// NUMBER NOT NULL /* 정가 */
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getBooktitle() {
		return booktitle;
	}
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "bookVO [ISBN=" + ISBN + ", orderno=" + orderno + ", booktitle=" + booktitle + ", publisher=" + publisher
				+ ", writer=" + writer + ", price=" + price + "]";
	}
	
	
}
