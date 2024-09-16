/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author hp
 */
public class PostDao {
    
   
    private Connection conn;

    public PostDao(Connection conn) {
        this.conn = conn;
    }
    
    public boolean savePost(Post p){
        boolean flag=false;
        try {
            String q="insert into posts (ptitle,pcontent,pcode,catid,userId) values(?,?,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(q);
            ps.setString(1,p.getpTitle());
            ps.setString(2, p.getpContent());
            ps.setString(3, p.getpCode());
           //image
            ps.setInt(4, p.getCatId());
            ps.setInt(5, p.getUserId());
            ps.executeUpdate();
            flag=true;
            System.out.print(p.getpTitle()+" "+p.getpContent()+" "+p.getpCode()+" "+p.getpPic()+" "+p.getCatId()+" "+p.getUserId());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    //get all the posts
    public ArrayList<Post> getAllPosts(){
        //all post ko return karega
        ArrayList<Post> list=new ArrayList<>();
        
        try {
            PreparedStatement ps=conn.prepareStatement("select * from posts");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                int pid=rs.getInt(1);
                String ptitle=rs.getString(2);
                String pcontent=rs.getString(3);
                String pcode=rs.getString(4);
                //image left
                int catid=rs.getInt("catId");
                int userid=rs.getInt("userId");
                Post p=new Post(pid,ptitle,pcontent,pcode,catid,userid);
                list.add(p);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    public ArrayList<Post> getPostByCatId(int catId){
       //return those post whose a spacific id
        ArrayList<Post> list=new ArrayList<>();
        
         try {
            PreparedStatement ps=conn.prepareStatement("select * from posts where catId=?");
            ps.setInt(1, catId);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                int pid=rs.getInt(1);
                String ptitle=rs.getString(2);
                String pcontent=rs.getString(3);
                String pcode=rs.getString(4);
                //image left
                int catid=rs.getInt("catId");
                int userid=rs.getInt("userId");
                Post p=new Post(pid,ptitle,pcontent,pcode,catid,userid);
                list.add(p);
                
            }
            
        } catch (Exception e) {
           
            e.printStackTrace();
        }
        
        return list;
    }
    
    //get post by post id
    public Post getPostByPostId(int postId){
       //return those post whose a spacific id
        Post p=null;
        
         try {
            PreparedStatement ps=conn.prepareStatement("select * from posts where pid=?");
            ps.setInt(1, postId);
            ResultSet rs=ps.executeQuery();
           if(rs.next()){
                int pid=rs.getInt(1);
                String ptitle=rs.getString(2);
                String pcontent=rs.getString(3);
                String pcode=rs.getString(4);
                //image left
                int catid=rs.getInt("catId");
                int userid=rs.getInt("userId");
                 p=new Post(pid,ptitle,pcontent,pcode,catid,userid);
           }
                               
            
            
        } catch (Exception e) {
             
            e.printStackTrace();
        }
        
        return p;
    }
    
    //return all the post by userId
    //selectedprofile.jsp
    public ArrayList<Post> allPostsByUserId(int userId){
        ArrayList<Post> post=new ArrayList<>();        
         try {
            PreparedStatement ps=conn.prepareStatement("select * from posts where userId=?");
            ps.setInt(1, userId);
            ResultSet rs=ps.executeQuery();
           while(rs.next()){
                int pid=rs.getInt(1);
                String ptitle=rs.getString(2);
                String pcontent=rs.getString(3);
                String pcode=rs.getString(4);
                //image left
                int catid=rs.getInt("catId");
                int userid=rs.getInt("userId");
                Post p=new Post(pid,ptitle,pcontent,pcode,catid,userid);
                post.add(p);           }
                               
            
            
        } catch (Exception e) {
             
            e.printStackTrace();
        }
        
        return post;
   
    }
}
    

