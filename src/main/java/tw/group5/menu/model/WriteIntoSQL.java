package tw.group5.menu.model;

import java.beans.JavaBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class WriteIntoSQL {
	
	public static Connection conn;	
	
	public void createConnection() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=subject2;"
				+ "user=sa;password=P@ssw0rd!;trustServerCertificate=true";
		this.conn = DriverManager.getConnection(urlStr);

		boolean status = !conn.isClosed();

		if (status) {
			System.out.println("開啟連線成功");
		}
	}
	public void closeConnection() throws Exception {
		if (conn != null) {
			conn.close();
			System.out.println("成功關閉連線");
		}
	}
//------------------------------------------------------------------------------------------------------------------------------------------	
	public boolean intodatabase(String part1){
		String sqlString = "DECLARE @jsonData NVARCHAR(MAX) = N'"
	      		+ "{\"menu\":"+part1+"}';"
	      				+ " INSERT INTO menu "
	      				+ "SELECT * FROM OPENJSON(@jsonData,'$.menu') "
	      				+ "WITH(Partlist  nvarchar(50) '$.Partlist', "
	      				+ "sectorlist  nvarchar(50) '$.sectorlist',"
	      				+ "setCount  nvarchar(50) '$.setCount',"
	      				+ "exercisekilloo  nvarchar(50) '$.exercisekilloo',"
	      				+ "exerciseTimes  nvarchar(50) '$.exerciseTimes',"
	      				+ "breakTime  nvarchar(50) '$.breakTime',"
	      				+ "menuSet varchar(50),"
	      				+ "exerciseNum varchar(50)"
	      				+ " );";
		
		System.out.println(sqlString);
		
		try {
			PreparedStatement pre = this.conn.prepareStatement(sqlString);
			return pre.executeUpdate() > 0;	
		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}
	
}
	
        }
