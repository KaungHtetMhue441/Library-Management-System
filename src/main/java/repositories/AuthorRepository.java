package repositories;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.Author;
import dao.DatabaseConnection;
import utils.Path;

public class AuthorRepository {
	Connection con;
	public AuthorRepository() {
		con = DatabaseConnection.getConnection();
	}
	
	public Author get(int id) throws SQLException {
		PreparedStatement stmt = con.prepareStatement("select * from authors where author_id=?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		
		return new Author(
				rs.getInt("author_id"),
				rs.getString("name"),
				rs.getString("image"),
				rs.getString("image_name")
			);
	}
	
	public List<Author> getAll(String search) throws SQLException{
		con = DatabaseConnection.getConnection();
		List<Author> authors = new ArrayList<Author>();
		String condition = "";
		
		if(search!=null) {
			condition = "where name like ?";
		}
		
		PreparedStatement stmt = con.prepareStatement("select * from authors "+condition);

		if(search!=null) {
			stmt.setString(1, "%"+search+"%");
		}
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			authors.add(new Author(
					rs.getInt("author_id"),
					rs.getString("name"),
					rs.getString("image"),
					rs.getString("image_name")
					));
		}
		return authors;
	}
	
	public void create(Author author) throws SQLException {
			PreparedStatement stmt = con.prepareStatement("insert into authors(name,image,image_name) values (?,?,?)");
			stmt.setString(1,author.getName());
			stmt.setString(2,author.getImageName());
			stmt.setString(3,author.getImageOriginalName());
			stmt.executeUpdate();
	}
	
	public void update(Author author) throws SQLException {
		PreparedStatement stmt = con.prepareStatement("update authors set name=?,image=?,image_name=? where author_id=?");
		stmt.setString(1,author.getName());
		stmt.setString(2,author.getImageName());
		stmt.setString(3,author.getImageOriginalName());
		stmt.setInt(4, author.getId());
		stmt.executeUpdate();

	}
	
	public void delete(int id) throws SQLException, IOException {
		
		Author author = this.get(id);
		File file= new File(Path.getRealImagePath("authors\\"+author.getImageName()));
		
		if(file.exists()) {
			
			PreparedStatement stmt2 = con.prepareStatement("delete from authors where author_id=?");
			stmt2.setInt(1,id);
			stmt2.executeUpdate();
			//Delete Image After delete record from table
			file.delete();
			
			System.out.println("Delete File successfully!");
		}else {
			System.out.println("File is null!");
		}
		
		
		
	}
}
