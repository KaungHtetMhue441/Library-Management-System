package dao;

import java.time.LocalDateTime;
import java.util.Date;

import utils.Path;

public class Book {
	private int id;
	private String title;
	private String code;
	private int author_id;
	private int category_id;
	private String description;
	private String image;
	private String image_name;
	private boolean is_borrowed;
	private String authorName;
	private String categoryName;
	
	
	public Book() {
		
	}
	public Book(int id, String title, String code, String description, String image, String image_name,
			boolean is_borrowed, String authorName, String categoryName) {
		this.id = id;
		this.title = title;
		this.code = code;
		this.description = description;
		this.image = image;
		this.image_name = image_name;
		this.is_borrowed = is_borrowed;
		this.authorName = authorName;
		this.categoryName = categoryName;
	}
	public Book(String title, String code, int author_id, int category_id, String description, String image,
			String image_name) {
		this.title = title;
		this.code = code;
		this.author_id = author_id;
		this.category_id = category_id;
		this.description = description;
		this.image = image;
		this.image_name = image_name;
	}
	
	public String getImageUrl() {
		return Path.getImagePath("/books/"+this.image);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
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
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public boolean isIs_borrowed() {
		return is_borrowed;
	}
	public void setIs_borrowed(boolean is_borrowed) {
		this.is_borrowed = is_borrowed;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	

}
