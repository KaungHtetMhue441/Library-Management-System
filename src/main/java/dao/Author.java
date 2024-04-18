package dao;

import utils.Path;

public class Author {
	private int id;
	private String name;
	private String imageName;
	private String imageOriginalName;
	public Author(int id, String name) {
		this.id = id;
		this.name = name;
	}
	public Author(String name,String imageName,String imageOriginalName) {
		this.name = name;
		this.imageName = imageName;
		this.imageOriginalName = imageOriginalName;
	}
	public Author(int id,String name,String imageName,String imageOriginalName) {
		this.id = id;
		this.name = name;
		this.imageName = imageName;
		this.imageOriginalName = imageOriginalName;
	}
	
	public String getImageUrl() {
		return Path.getImagePath("/authors/"+this.imageName);
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImageOriginalName() {
		return imageOriginalName;
	}
	public void setImageOriginalName(String imageOriginalName) {
		this.imageOriginalName = imageOriginalName;
	}
	public Author() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		System.out.println(name);
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
