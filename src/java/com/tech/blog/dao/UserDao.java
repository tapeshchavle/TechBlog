/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;

/**
 *
 * @author hp
 */
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user){
        boolean res=false;
        try {
            
            String query="insert into user(id,name,email,password,gender) values (?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, user.getId());
            ps.setString(2,user.getName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getGender());
            ps.executeUpdate();
            res=true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("some error");
        }
        return res;
    }
    //get user by useremail and userpassword
    
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try{
            String query="select * from user where email =? and password=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2, password);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                user=new User();
                //uppercase name
                String name=rs.getString("name");
                String fna=name.substring(0,1).toUpperCase()+name.substring(1);
                user.setName(fna);
                //
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                //uppercase gender
                String gen=rs.getString("gender");
                String gender=gen.substring(0,1).toUpperCase()+gen.substring(1);
                user.setGender(gender);
                //                
                user.setProfile(rs.getString("profile"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    
    public boolean updateUser(User user){
        boolean f=false;
        try{
            String query="update user set name=? , email=? , password=? , profile=? where id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2,user.getEmail());            
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getProfile());
                        
            
            ps.setInt(5, user.getId());
            ps.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    //get user name by user id
    public String getUserByUid(int uid){
        String s=null;
        try{
            PreparedStatement ps=con.prepareStatement("select * from user where id=?");
            ps.setInt(1, uid);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                s=rs.getString("name");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return s;
        
    }
    
    //get whole user by user id
     public User getWholeUserByUid(int uid){
        User u=null;
        try{
            PreparedStatement ps=con.prepareStatement("select * from user where id=?");
            ps.setInt(1, uid);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String gender=rs.getString("gender");
                String profile=rs.getString("profile");
                u=new User(id,name,gender,profile);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return u;
        
    }
    
}
