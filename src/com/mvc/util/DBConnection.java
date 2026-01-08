//The following code is applicable while connecting to SQL server only.
package com.mvc.util;
 
import java.sql.Connection;
 import java.sql.DriverManager;
 
public class DBConnection {
 
public static Connection createConnection()
 {
 Connection con = null;


String url = "jdbc:mysql://localhost:3306/usfd"; 
 String username = "root"; 
 String password = "password"; 
 
try
 {
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 }
 catch (ClassNotFoundException e)
 {
 e.printStackTrace();
 }
 
con = DriverManager.getConnection(url, username, password);
 
}
 catch (Exception e)
 {
 e.printStackTrace();
 }
return con;
 }



public static void close(Connection con){
	try {
		con.close();
	}
	catch (Exception e){
		
	}

}

 }
