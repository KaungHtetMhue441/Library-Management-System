package dao;

import java.time.LocalDateTime;

public class BorrowDetails {
	private String bookName;
	private String userName;
	private LocalDateTime borrow_date;
	private LocalDateTime overdue_date;
	private String type;
	
	public BorrowDetails() {
		
	}

	public BorrowDetails(String bookName, String userName, LocalDateTime borrow_date, LocalDateTime overdue_date,
			String type) {
		this.bookName = bookName;
		this.userName = userName;
		this.borrow_date = borrow_date;
		this.overdue_date = overdue_date;
		this.type = type;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public LocalDateTime getBorrow_date() {
		return borrow_date;
	}

	public void setBorrow_date(LocalDateTime borrow_date) {
		this.borrow_date = borrow_date;
	}

	public LocalDateTime getOverdue_date() {
		return overdue_date;
	}

	public void setOverdue_date(LocalDateTime overdue_date) {
		this.overdue_date = overdue_date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
