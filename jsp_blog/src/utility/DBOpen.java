package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {

	public static Connection open() {
		// TODO Auto-generated method stub
		
		Connection con =null;
				
		try {
			Class.forName(Constant.driver);
			con = DriverManager.getConnection(Constant.url,Constant.user,Constant.password);
			
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return con;
	}

}
