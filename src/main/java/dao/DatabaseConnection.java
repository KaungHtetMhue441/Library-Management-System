 package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static String dbDriver;
	private static String dbURL;
	private static String dbName;
	private static String dbUsername;
	private static String dbPassword;
	private static Connection con = null;

	private static void setData() {
		dbDriver = "com.mysql.cj.jdbc.Driver";
		dbURL = "jdbc:mysql://localhost:3306/";
		dbName = "library";
		dbUsername = "root";
		dbPassword = "root";

	}

	public static Connection getConnection() {
		if (con !=null) {
			return con;
		}
		setData();
		
		try {
			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		

		return con;
	}
}
