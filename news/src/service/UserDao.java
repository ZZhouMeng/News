package service;
import object.User;
import database.DBConnection;
import java.sql.*;
import java.util.Vector;

public class UserDao {
	public boolean addUser(User user){
		DBConnection myDB=new DBConnection();
		Connection conn=myDB.getConnection();
		String sql="INSERT INTO Users(userid,username,password) VALUES (?,?,?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			pstmt.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;	
	}
}
