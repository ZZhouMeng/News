package database;

import java.sql.*;
public class DBConnection {
	//定义数据库连接所需的成员属性
	private Connection conn=null;
	
	private static String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";   
	private static String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=JAVAWEB";  
	private static String dbUser = "root";
	private static String dbPassword = "123456";
	
	//构造函数，调用Class的forname函数注册驱动程序类
	public DBConnection(){
			try {
				Class.forName(dbDriver).newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				System.out.println("error occour @DBConnection() with InstantiationException");
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				System.out.println("error occour @DBConnection() with IllegalAccessException");
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("error occour @DBConnection() with ClassNotFoundException");
				e.printStackTrace();
			}
	}
	//获得数据连接的方法
	public Connection getConnection() {
		try {
			conn=DriverManager.getConnection(dbURL, dbUser, dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error occour @DBConnection() with SQLException");
			e.printStackTrace();
		}
		return conn;
	}
}
