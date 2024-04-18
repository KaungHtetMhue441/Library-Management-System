package dao;

import java.time.LocalDateTime;

public class TextBookList {
	private int id;
	private int testBookId;
	private String image;
	private String description;
	private String title;
	private String isbn;
	private String code;
	private boolean is_borrowed=false;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	
	public TextBookList() {
		
	}
	public TextBookList(int id, int testBookId, String code, boolean is_borrowed, LocalDateTime created_at,
			LocalDateTime updated_at) {
		this.id = id;
		this.testBookId = testBookId;
		this.code = code;
		this.is_borrowed = is_borrowed;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTestBookId() {
		return testBookId;
	}
	public void setTestBookId(int testBookId) {
		this.testBookId = testBookId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public boolean isIs_borrowed() {
		return is_borrowed;
	}
	public void setIs_borrowed(boolean is_borrowed) {
		this.is_borrowed = is_borrowed;
	}
	public String getBorrowStatus() {
		return this.is_borrowed?"Borrowed":"active";
	}
	public LocalDateTime getCreated_at() {
		return created_at;
	}
	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
	}
	public LocalDateTime getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(LocalDateTime updated_at) {
		this.updated_at = updated_at;
	}
	
}
