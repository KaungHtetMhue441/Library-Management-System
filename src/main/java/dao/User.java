package dao;

public class User {
	private int id;
	private String name;
	private String phone;
	private String email;
	private String type;
	private String cardNo;
	
	
	public User() {
		
	}
	public User(String name,String phone,String email,String type,String cardNo) {
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.type = type;
		this.cardNo = cardNo;
	}
	public User(int id, String name, String phone, String email, String type, String cardNo) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.type = type;
		this.cardNo = cardNo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", phone=" + phone + ", email=" + email + ", type=" + type
				+ ", cardNo=" + cardNo + "]";
	}
	
	
	
}
