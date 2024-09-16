package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author hp
 */
public class CategoriesDao {
    Connection conn;

    public CategoriesDao(Connection conn) {
        this.conn=conn;
    }
    public ArrayList <Category> getAllCategories(){
        
        ArrayList <Category> list=null;
        try{
            list=new ArrayList<>();
            String q="select * from categories";
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery(q);
            while(rs.next()){
                int cid=rs.getInt(1);
                String name=rs.getString(2);
                String description=rs.getString(3);
                
                
                Category cd=new Category(cid,name,description);
                list.add(cd);
            }
            
        }catch(Exception e)
        {
            
            e.printStackTrace();
            
        }
        return list;
    }
}