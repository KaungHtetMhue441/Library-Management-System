package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.Author;
import dao.Category;
import dao.DatabaseConnection;

public class CategoryRepository {
	private Connection con;
	
	public CategoryRepository() {
		con = DatabaseConnection.getConnection();
	}
	
	public void  create(Category category) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("insert into categories(name) values(?)");
		stmt.setString(1, category.getName());
		stmt.executeUpdate();

	}
	
	public Category get(int id) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("select * from categories where category_id=?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		return new Category(
				rs.getInt("category_id"),
				rs.getString("name")
		);
	}
	
	public List<Category> getAll(String search) throws SQLException{
		List<Category> categories  = new ArrayList<Category>();
		
		String condition = "";
		
		if(search!=null) {
			condition = "where name like ?";
		}
		
		PreparedStatement stmt = con.prepareStatement("select * from categories "+condition);

		if(search!=null) {
			stmt.setString(1, "%"+search+"%");
		}
		
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			categories.add(new Category(
					rs.getInt("category_id"),
					rs.getString("name")
					));
		}
		return categories;
	}
	
	public void update(Category category) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("update categories set name=? where category_id=?");
		stmt.setString(1,category.getName());
		stmt.setInt(2, category.getId());
		stmt.executeUpdate();
		
	}
	
	public void delete(int id) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("delete from categories where category_id=?");
		stmt.setInt(1,id);
		stmt.executeUpdate();
	}
}
