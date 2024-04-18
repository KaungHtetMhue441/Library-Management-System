package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import dao.TextBookList;
import utils.Str;

public class TextBookListRepository2 {
	private Connection con;
	
	public TextBookListRepository2() {
		this.con = DatabaseConnection.getConnection();
	}
	
	public void create(TextBookList textBook) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("insert into test_books_list"
				+ "(id,code,test_book_id) values (?,?,?)");
		stmt.setInt(1,textBook.getId());
		stmt.setString(2, textBook.getCode());
		stmt.setInt(3,textBook.getTestBookId());
		stmt.executeUpdate();
	}
	
	public void update(TextBookList textBook) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("update test_books_list id=?,code=?,test_book_id=? where id="+textBook.getId());
		stmt.setInt(1,textBook.getId());
		stmt.setString(2, textBook.getCode());
		stmt.setInt(3,textBook.getTestBookId());
		stmt.executeUpdate();
	}
	public List<TextBookList> getAll(String search,String year ,String semester,int page) throws SQLException{
		List<TextBookList> textBookLists = new ArrayList<TextBookList>();
		String condition = "";
		if(!(Str.isNullorEmpty(search)&&Str.isNullorEmpty(year)&&Str.isNullorEmpty(semester))) {
			condition +="where ";
		}
		if(!Str.isNullorEmpty(semester)) {
			condition +="test_books.semester like '%"+semester+"%' ";
		}
		if(!Str.isNullorEmpty(semester)&& (!Str.isNullorEmpty(year)||!Str.isNullorEmpty(search))) {
			condition+="and ";
		}
		if(!Str.isNullorEmpty(year)) {
			condition +="test_books.year like '%"+year+"%' ";
		}
		
		if(!Str.isNullorEmpty(year)&&!Str.isNullorEmpty(search)) {
			condition +="and ";
		}
		if(!Str.isNullorEmpty(search)) {
			condition +="test_books.title like '%"+search+"%'";
		}
				
		int recordsPerPage=10;
		
		int totalRecords = getTotalRecords(search,year,semester); // Implement this method to get total records from the database

        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

        int start = (page - 1) * recordsPerPage;
        
		
        System.out.println(condition);
		PreparedStatement stmt = this.con.prepareStatement("select test_books_list.id as id,code,is_borrowed,test_books.description as description,test_books.title as title,test_books.image as image"
				+ " from test_books_list join test_books on test_books_list.test_book_id=test_books.id "+condition+" limit "+start+","+recordsPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			TextBookList book = new TextBookList();
			book.setId(rs.getInt("id"));
			book.setCode(rs.getString("code"));
			book.setImage(rs.getString("image"));
			book.setTitle(rs.getString("title"));
			book.setDescription(rs.getString("description"));
			book.setIs_borrowed(rs.getBoolean("is_borrowed"));
			textBookLists.add(book);
		}
		return textBookLists;
	}
	
	public int getTotalRecords(String search,String year ,String semester) throws SQLException{
		String condition = "";
		
		if(!(Str.isNullorEmpty(search)&&Str.isNullorEmpty(year)&&Str.isNullorEmpty(semester))) {
			condition +="where ";
		}
		if(!Str.isNullorEmpty(semester)) {
			condition +="test_books.semester like '%"+semester+"%' ";
		}
		if(!Str.isNullorEmpty(semester)&& (!Str.isNullorEmpty(year)||!Str.isNullorEmpty(search))) {
			condition+="and ";
		}
		if(!Str.isNullorEmpty(year)) {
			condition +="test_books.year like '%"+year+"%' ";
		}
		
		if(!Str.isNullorEmpty(year)&&!Str.isNullorEmpty(search)) {
			condition +="and ";
		}
		if(!Str.isNullorEmpty(search)) {
			condition +="test_books.title like '%"+search+"%'";
		}
		
		System.out.println(condition);
		
		PreparedStatement stmt = this.con.prepareStatement("select count(test_books_list.id) as total"
				+ " from test_books_list join test_books on test_books_list.test_book_id=test_books.id "+condition);
		ResultSet rs = stmt.executeQuery();
		
		rs.next();
		return rs.getInt("total");
	}
	
	public void delete(int id) throws SQLException {
		Statement stmt = this.con.createStatement();
		stmt.executeUpdate("delete from test_books_list where id="+id);
	}
}
