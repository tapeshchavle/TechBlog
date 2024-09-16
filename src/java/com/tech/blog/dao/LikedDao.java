/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hp
 */
public class LikedDao {
    
    private Connection conn;
    public LikedDao(Connection conn){
        this.conn=conn;
    }
    
    //insert like in database
    public boolean insertLike(int pid,int uid){
        boolean flag=false;
        String q="insert into liked(uid,pid)values(?,?)";
        
        try{
        PreparedStatement ps=conn.prepareStatement(q);
        ps.setInt(1, uid);
        ps.setInt(2, pid);
        
        ps.executeUpdate();
        flag=true;
            
        }catch(SQLException ex){
            ex.printStackTrace();
        }     
        
        return  flag;
        
        
  
        
    }
    //count like on post
    public int countLikeOnPost(int pid){
        int count=0;
        String q="select count(*) from liked where pid=?";
        try{
            PreparedStatement ps=conn.prepareStatement(q);
            ps.setInt(1, pid);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                count=rs.getInt(1);
            }
            
            
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return count;
    }
    //check is post is already liked by user or not
    public boolean isLikedByUser(int uid,int pid){
        boolean flag=false;
        String q="select from liked where uid=? and pid=?";
        try{
            PreparedStatement ps=conn.prepareStatement(q);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                flag=true;
            }
            
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return flag;
    }
    //delete like
    public boolean deleteLike(int uid,int pid){
        boolean flag=false;
        String q="delete from liked where uid=? and pid=?";
        try {
            PreparedStatement ps=conn.prepareStatement(q);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.executeUpdate();
            flag=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }    
}
