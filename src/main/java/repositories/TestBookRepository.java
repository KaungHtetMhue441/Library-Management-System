package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import dao.TestBook;
import utils.FileAction;
import utils.Str;

public class TestBookRepository {
	private Connection con;
	
	public TestBookRepository() {
		this.con = DatabaseConnection.getConnection();
	}
	
	public TestBook get(int id) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("select * from test_books where id=?");
		stmt.setInt(1,id);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		TestBook testBook = new TestBook();
		testBook.setImage(rs.getString("image"));
		return testBook;
	}
	
	public List<TestBook> getAll(String search,String year,int page) throws SQLException {
		
		
		String condition = "";
		
		int recordsPerPage=10;
		
		int totalRecords = getTotalRecords(search,year); // Implement this method to get total records from the database

        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

        int start = (page - 1) * recordsPerPage;
        
        System.out.println(start+","+recordsPerPage);
		
		if(!Str.isNullorEmpty(search)||!Str.isNullorEmpty(year)) {
			condition += "where ";
		}
		
		if(!Str.isNullorEmpty(year)) {
			condition+="year like ?";
		}
		
		if(!(Str.isNullorEmpty(year)||Str.isNullorEmpty(search))) {
			condition+=" and ";
		}
		
		if(!Str.isNullorEmpty(search)) {
			condition += "title like ? or semester like ? or isbn like ?";
		}
		
		
		
		PreparedStatement stmt = this.con.prepareStatement("select id,title,isbn,year,semester,test_books.image as image,test_books.image_name as image_name,authors.name as author_name,categories.name as category_name,description,"
				+ "(select count(*)from test_books_list where test_books_list.test_book_id=test_books.id) as total from test_books "
				+ "join authors on authors.author_id=test_books.author_id join categories on categories.category_id=test_books.category_id "+condition+" limit "+start+","+recordsPerPage);
		
		if(!Str.isNullorEmpty(year)) {
			stmt.setString(1, "%"+year+"%");
		}
		
		
		
		
		if(!Str.isNullorEmpty(search)) {
			if(Str.isNullorEmpty(year)) {
				stmt.setString(1, "%"+search+"%");
				stmt.setString(2, "%"+search+"%");
				stmt.setString(3, "%"+search+"%");
			}else {
				stmt.setString(2, "%"+search+"%");
				stmt.setString(3, "%"+search+"%");
				stmt.setString(4, "%"+search+"%");
			}
		}else {
		}
		
		System.out.print("conditioin"+condition);
		
		ResultSet rs = stmt.executeQuery();
		List<TestBook> testBooks = new ArrayList<TestBook>();
		while(rs.next()) {
			TestBook testBook= new TestBook();
			testBook.setId(rs.getInt("id"));
			testBook.setIsbn(rs.getString("isbn"));
			testBook.setTitle(rs.getString("title"));
			testBook.setYear(rs.getString("year"));
			testBook.setSemester(rs.getString("semester"));
			testBook.setImage(rs.getString("image"));
			testBook.setImageName(rs.getString("image_name"));
			testBook.setDescription(rs.getString("description"));
			testBook.setAuthorName(rs.getString("author_name"));
			testBook.setCategoryName(rs.getString("category_name"));
			testBook.setTotal(rs.getInt("total"));
			testBooks.add(testBook);
			System.out.println("Enter your ");
		}
		return testBooks;
		
	}
	
	public int getTotalRecords(String search,String year) throws SQLException {
		String condition = "";
		
		if(!Str.isNullorEmpty(search)||!Str.isNullorEmpty(year)) {
			condition += "where ";
		}
		
		if(!Str.isNullorEmpty(year)) {
			condition+="year like ?";
		}
		
		if(!(Str.isNullorEmpty(year)||Str.isNullorEmpty(search))) {
			condition+=" and ";
		}
		
		if(!Str.isNullorEmpty(search)) {
			condition += "title like ? or semester like ? or isbn like ?";
		}
		
		
		
		PreparedStatement stmt = this.con.prepareStatement("select count(test_books.title) as total from test_books "
				+ "join authors on authors.author_id=test_books.author_id join categories on categories.category_id=test_books.category_id "+condition);
		
		if(!Str.isNullorEmpty(year)) {
			stmt.setString(1, "%"+year+"%");
		}
		
		if(!Str.isNullorEmpty(search)) {
			if(Str.isNullorEmpty(year)) {
				stmt.setString(1, "%"+search+"%");
				stmt.setString(2, "%"+search+"%");
				stmt.setString(3, "%"+search+"%");
			}else {
				stmt.setString(2, "%"+search+"%");
				stmt.setString(3, "%"+search+"%");
				stmt.setString(4, "%"+search+"%");
			}
		}
		
		ResultSet rs = stmt.executeQuery();
		rs.next();
		return rs.getInt("total");
	}
	
	public void create(TestBook testBook) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("insert into test_books(title,year,semester,isbn,image,image_name,author_id,category_id,description)"
				+ " values(?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, testBook.getTitle());
		stmt.setString(2, testBook.getYear());
		stmt.setString(3,testBook.getSemester());
		stmt.setString(4,testBook.getIsbn());
		stmt.setString(5,testBook.getImage());
		stmt.setString(6,testBook.getImageName());
		stmt.setInt(7, testBook.getAuthorId());
		stmt.setInt(8, testBook.getCategoryId());
		stmt.setString(9,testBook.getDescription());
		stmt.executeUpdate();
	}
	
	public void update(TestBook testBook) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("update test_books set title=?,year=?,semester=?,isbn=?,image=?,image_name=?,author_id=?,category_id=?,description=? where id=?");
		stmt.setString(1, testBook.getTitle());
		stmt.setString(2, testBook.getYear());
		stmt.setString(3,testBook.getSemester());
		stmt.setString(4,testBook.getIsbn());
		stmt.setString(5,testBook.getImage());
		stmt.setString(6,testBook.getImageName());
		stmt.setInt(7, testBook.getAuthorId());
		stmt.setInt(8, testBook.getCategoryId());
		stmt.setString(9,testBook.getDescription());
		stmt.setInt(10,testBook.getId());
		stmt.executeUpdate();
	}
	public void delete(int id) throws SQLException {
		PreparedStatement stmt  = this.con.prepareStatement("select * from test_books where id=?");
		stmt.setInt(1,id);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		String image = rs.getString("image");
		
		PreparedStatement stmt1 = this.con.prepareStatement("delete from test_books where id=?");
		stmt1.setInt(1, id);
		stmt1.executeUpdate();
		
		FileAction.deleteFile("testbooks\\"+image);
	}
}
