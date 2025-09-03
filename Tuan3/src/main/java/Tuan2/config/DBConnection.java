package Tuan2.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private final String serverName = "localhost";
	private final String dbName = "LapTrinhWeb";
	private final String portNumber = "1433";
	private final String instance = "";
	private final String userID = "sa";
	private final String password = "123456";
	
	public Connection getConnection() throws Exception {
		String url =
		"jdbc:sqlserver://" + serverName + "\\" + instance + ":" + portNumber +
		";databaseName=" + dbName;
		if (instance == null || instance.trim().isEmpty())
		url =
		"jdbc:sqlserver://"+serverName+":"+portNumber
		+";databaseName="+dbName + ";encrypt=false;trustServerCertificate=true";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
		}
	
	public static void main(String[] args) {
		try {
		System.out.println(new DBConnection().getConnection());
		} catch (Exception e) {
		e.printStackTrace();
		}
		}
}
