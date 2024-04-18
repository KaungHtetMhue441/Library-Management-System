package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.Book;
import dao.DatabaseConnection;
import utils.FileAction;

public class BookRepository {
	private Connection con;
	public BookRepository() {
		con = DatabaseConnection.getConnection();
	}
	
	public void create(Book book) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("insert into books(title,code,author_id,category_id,description,image,image_name)"
				+ " values(?,?,?,?,?,?,?)");
		stmt.setString(1, book.getTitle());
		stmt.setString(2, book.getCode());
		stmt.setInt(3, book.getAuthor_id());
		stmt.setInt(4, book.getCategory_id());
		stmt.setString(5, book.getDescription());
		stmt.setString(6,book.getImage());
		stmt.setString(7, book.getImage_name());
		stmt.executeUpdate();
	}
	
	public String getImage(int id) throws SQLException{
		PreparedStatement stmt = this.con.prepareStatement("select * from books where book_id=?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		return rs.getString("image");
	}
	
	public List<Book> getAll(String search,String category_id) throws SQLException{
		
		String condition = "";
		
		int filterCount=0;
		if(search!=null||category_id!=null) {
			condition+="where ";
			if(search!=null) {
				condition += "books.title like ? or books.code like ? or authors.name like ?";
				++filterCount;
			}
				
			if(filterCount>0&&category_id!=null) {
				condition +=" and ";
			}
			
			if(category_id!=null) {
				System.out.println("Hellow sldfkjdf");
				condition +="books.category_id =?";
			}
		}
				
		PreparedStatement stmt = con.prepareStatement("select "
				+ "book_id,title,code,books.image as image,books.image_name as image_name,authors.name as author_name,categories.name as category_name,is_borrowed,description "
				+ "from books join authors on authors.author_id=books.author_id join categories on categories.category_id=books.category_id "+condition);
		
		if(search!=null){
			stmt.setString(1,"%"+search+"%");
			stmt.setString(2,"%"+search+"%");
			stmt.setString(3,"%"+search+"%");
		}
		if(category_id!=null) {
			
			if(filterCount>0) {
				System.out.print("hhhhhhhh");
				stmt.setInt(4, Integer.parseInt(category_id));
			}else {
				stmt.setInt(1, Integer.parseInt(category_id));
			}
		}
		
		
		ResultSet rs = stmt.executeQuery();
		List<Book> books  = new ArrayList<Book>();
		while(rs.next()) {
			Book book = new Book();
			book.setId(rs.getInt("book_id"));
			book.setTitle(rs.getString("title"));
			book.setAuthorName(rs.getString("author_name"));
			book.setCategoryName(rs.getString("category_name"));
			book.setIs_borrowed(rs.getBoolean("is_borrowed"));
			book.setImage(rs.getString("image"));
			book.setDescription(rs.getString("description"));
			books.add(book);
		}
		return books;
	}
	
	public void update(Book book) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("update books set title=?,code=?,author_id=?,category_id=?,description=?,image=?,image_name=? where book_id=?");
		stmt.setString(1, book.getTitle());
		stmt.setString(2, book.getCode());
		stmt.setInt(3, book.getAuthor_id());
		stmt.setInt(4, book.getCategory_id());
		stmt.setString(5, book.getDescription());
		stmt.setString(6,book.getImage());
		stmt.setString(7, book.getImage_name());
		stmt.setInt(8,book.getId());
		stmt.executeUpdate();
	}
	
	public void delete(int id) throws SQLException {
		PreparedStatement stmt1 = this.con.prepareStatement("select * from books where book_id=?");
		stmt1.setInt(1, id);
		ResultSet rs = stmt1.executeQuery();
		rs.next();
		
		String image = rs.getString("image");
		FileAction.deleteFile("books\\"+image);
		
		PreparedStatement stmt = this.con.prepareStatement("delete from books where book_id=?");
		stmt.setInt(1, id);
		stmt.executeUpdate();
		
	}
}
