
package com.tech.blog.dbutil;
import java.sql.*;
import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionProvider {
    private static Connection conn;
    public static Connection getConnection(){
        try{
            if(conn==null)
            {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","Tapesh@2005");
            }             
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return conn;
    }
    
}

