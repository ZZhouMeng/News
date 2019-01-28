package database;

import java.sql.*;
public class DBConnection {
	//�������ݿ���������ĳ�Ա����
	private Connection conn=null;
	
	private static String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";   
	private static String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=JAVAWEB";  
	private static String dbUser = "root";
	private static String dbPassword = "123456";
	
	//���캯��������Class��forname����ע������������
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
	//����������ӵķ���
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
