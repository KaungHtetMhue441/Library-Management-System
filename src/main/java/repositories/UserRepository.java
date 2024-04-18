package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import dao.User;
import utils.Str;

public class UserRepository {
	private Connection con;
	
	public UserRepository() {
		this.con = DatabaseConnection.getConnection();
	}
	
	public void create (User user) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("insert into users(name,phone,email,type,cardno) "
				+ "values(?,?,?,?,?)");
		stmt.setString(1, user.getName());
		stmt.setString(2, user.getPhone());
		stmt.setString(3, user.getEmail());
		stmt.setString(4, user.getType());
		stmt.setString(5, user.getCardNo());
		stmt.executeUpdate();
	}
	
	public void update(User user) throws SQLException {
		PreparedStatement stmt = this.con.prepareStatement("update users set name=?,phone=?,email=?,type=?,cardno=? "
				+ "where id="+user.getId());
		stmt.setString(1, user.getName());
		stmt.setString(2, user.getPhone());
		stmt.setString(3, user.getEmail());
		stmt.setString(4, user.getType());
		stmt.setString(5, user.getCardNo());
		stmt.executeUpdate();
	}
	
	public List<User> getAll(String search,String type,int page) throws SQLException {
		
		int recordsPerPage=10;
		
		int totalRecords = getTotalRecords(search,type); // Implement this method to get total records from the database

        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

        int start = (page - 1) * recordsPerPage;
		
		String condition = "";
		
		if(!Str.isNullorEmpty(search)||!Str.isNullorEmpty(type)) {
			condition+="where ";
		}
		if(!Str.isNullorEmpty(type)) {
			condition +="type like '%"+type+"%' ";
		}
		if(!(Str.isNullorEmpty(search)||Str.isNullorEmpty(type))) {
			condition+="and ";
		}
		if(!Str.isNullorEmpty(search)) {
			condition+="name like ? or phone like ? or cardno like ? or email like ? ";
		}
		
		PreparedStatement stmt = this.con.prepareStatement("select * from users "+condition+" limit "+start+","+recordsPerPage);
		
		if(!Str.isNullorEmpty(search)) {
		   if(!Str.isNullorEmpty(type)) {
			   stmt.setString(2,"%"+search+"%");
			   stmt.setString(3,"%"+search+"%");
			   stmt.setString(4, "%"+search+"%");
			   stmt.setString(5, "%"+search+"%");
		   }else {
			   stmt.setString(1,"%"+search+"%");
			   stmt.setString(2,"%"+search+"%");
			   stmt.setString(3, "%"+search+"%");
			   stmt.setString(4, "%"+search+"%");
		   }
		}
		
		ResultSet rs = stmt.executeQuery();
		List<User> userList = new ArrayList<User>();
		while(rs.next()) {
			userList.add(new User(
					rs.getInt("id"),
					rs.getString("name"),
					rs.getString("phone"),
					rs.getString("email"),
					rs.getString("type"),
					rs.getString("cardno")
				));
		}
		
		return userList;
	}
	
	public int getTotalRecords(String search,String type) throws SQLException {
		String condition = "";
		
		if(!Str.isNullorEmpty(search)||!Str.isNullorEmpty(type)) {
			condition+="where ";
		}
		if(!Str.isNullorEmpty(type)) {
			condition +="type like '%"+type+"%' ";
		}
		if(!(Str.isNullorEmpty(search)||Str.isNullorEmpty(type))) {
			condition+="and ";
		}
		if(!Str.isNullorEmpty(search)) {
			condition+="name like ? or phone like ? or cardno like ? or email like ? ";
		}
		
		PreparedStatement stmt = this.con.prepareStatement("select count(*) as total from users "+condition);
		
		if(!Str.isNullorEmpty(search)) {
		   if(!Str.isNullorEmpty(type)) {
			   stmt.setString(2,"%"+search+"%");
			   stmt.setString(3,"%"+search+"%");
			   stmt.setString(4, "%"+search+"%");
			   stmt.setString(5, "%"+search+"%");
		   }else {
			   stmt.setString(1,"%"+search+"%");
			   stmt.setString(2,"%"+search+"%");
			   stmt.setString(3, "%"+search+"%");
			   stmt.setString(4, "%"+search+"%");
		   }
		}
		
		ResultSet rs = stmt.executeQuery();
		rs.next();
		return rs.getInt("total");
	}
	
	public void delete(int id) throws SQLException {
		Statement stmt = this.con.createStatement();
		System.out.println("delete");
		stmt.executeUpdate("delete from users where id="+id);
	}
	
}
