<%-- 
    Document   : profile
    Created on : 19 Aug, 2024, 8:04:55 PM
    Author     : hp
--%>


<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dbutil.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.CategoriesDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.entities.Message"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="css/mystyle.css" />
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 58% 99%, 20% 91%, 0 100%, 0 0);
            }
            .hidden{
                display: none;
            }
            .txt-overflow{


                height:100px;
                overflow: hidden;
                text-overflow: ellipsis; 


            }
            #fix-btn{
                position: relative;
                margin-top: 30px;


            }
        </style>
        <script>
            function sendData(data) {
                // Set the hidden field value based on the button clicked
                document.getElementById("hiddenData").value = data;
                document.getElementById("dynamicForm").submit();
            }
            
             function sendToPid(data) {
            // Set the hidden field value based on the button clicked
          
            document.getElementById("hiddenDataa").value = data;
            document.getElementById("dynamicForma").submit();
        }
        </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>



        <%
            User user = (User) session.getAttribute("currentUser");
        %>

        <!--Navbar starts here -->
        <nav class="navbar navbar-expand-lg primary-background position-fixed w-100" style="z-index:10;">
            <div class="container-fluid">
                <a class="navbar-brand" href="profile.jsp">Tech Blog</a> 
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Learn Code</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Categories
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Programming Language</a></li>
                                <li><a class="dropdown-item" href="#">Projects</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Data Structure</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal" ><span class="fa fa-asterisk"></span>Do Post</a>
                        </li>



                    </ul>
                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#user-modal" ><span class="fa fa-user-circle"></span><%=user.getName()%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-outline-light btn-md" href="LogoutServlet">Logout</a>
                        </li>


                    </ul>
                </div>
            </div>
        </nav>
        <!--navbar ends here--> 
        <%
            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {
        %>
        <div class="alert <%=msg.getCssClass()%>" role="alert">
            <%=msg.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>




        <!--alert when the post is successfully uploaded-->
        <%
            Message pu = (Message) session.getAttribute("post-upload");
            if (pu != null) {
        %>
        <div class="alert <%=pu.getCssClass()%> alert-dismissible fade show" role="alert">
            <%=pu.getContent()%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>



        <%
                session.removeAttribute("post-upload");
            }
        %>
        <!--ends here-->

        <!--main body of the page-->
        <main>
            <div class="p-4">
                <div class="row mt-5">
                    <!--first col-->
                    <div class="col-md-3 position-fixed">
                        <!--categories-->
                        <div class="list-group">
                            <a href="profile.jsp" class="list-group-item list-group-item-action active" aria-current="true">
                                All Posts
                            </a>
                            <form action="load_post.jsp" id="dynamicForm" method="post">
                                <input id="hiddenData" value="" name="uid" style="display:none;"/>

                                <%
                                    CategoriesDao ccd = new CategoriesDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list1 = ccd.getAllCategories();
                                    for (Category cc : list1) {
                                %>
                                <button type="submit" onclick="sendData('<%=cc.getCid()%>')" class="list-group-item list-group-item-action"><%=cc.getName()%></button>

                                <%

                                    }
                                %>
                            </form>



                        </div>

                    </div>
                    <!--second col-->
                    <div class="col-md-8 offset-md-3">
                        <!--post-->
                        <!-- <div class="container text-center" id="loader">
                             <i class="fa fa-refresh fa-3x fa-spin"></i>
                             <h3 class="mt-2">Loading...</h3>
                         </div>
                        -->
                        <form action="single-post.jsp" id="dynamicForma" method="post">
                                   <input id="hiddenDataa" value="" name="pid" style="display:none;"/>
                        <div class="row">
                            <%
                                int id = Integer.parseInt(request.getParameter("uid"));
                                PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Post> post = postDao.getPostByCatId(id);

                                if (post.isEmpty()) {
                            %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                No post found related to this Category
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                            } else {

                                for (int i = 0; i < post.size(); i++) {
                                    Post post1 = post.get(i);
                            %>
                            <div class="col-md-4 mb-2">
                                <div class="card " style="width:18rem;">

                                    <div class="card-body">
                                        <h5 class="card-title"><%=post1.getpTitle()%></h5>
                                        <div class="txt-overflow">
                                            <p class="card-text" ><%=post1.getpContent()%></p>
                                        </div>
                                        <div id="fix-btn" class="text-center">
                                   <button type="submit" onclick="sendToPid('<%=post1.getPid()%>')" class="btn btn-primary btn-sm">Read More..</button>                           
                                
                                <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"><span>10</span></i></a>
                                <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
                               </div>
                                    </div>
                                </div>
                            </div>

                            <%
                                    }
                                }

                            %>
                        </form>

                        </div>
                    </div>
                </div>

            </div>
        </main>


        <!--profile model-->




        <!-- Modal -->
        <div class="modal fade" id="user-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h1>
                        <button type="button" id="closebtn" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">

                            <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%; height:100px; width: 100px; " />
                            <br>
                            <h3 class="modal-title fs-5 mt-3" id="exampleModalLabel">Welcome ! <%=user.getName()%></h3>
                            <!--details-->
                            <div class="table-edit">

                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%=user.getId()%></td>                                        
                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%=user.getEmail()%></td>                                       

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>                                      
                                            <td><%=user.getGender()%></td>
                                    <br>
                                    </tr>
                                    </tbody>
                                </table>
                                <!--end details-->

                                <!--profile update-->
                            </div>
                            <div id="table-update"  class="hidden">
                                <h5 class="mt-2">Please Edit Carefully</>

                                    <form action="EditServlet" method="post" enctype="multipart/form-data">
                                        <table class="table mt-3" style="font-size:15px">
                                            <tr>
                                                <td>ID :</td>
                                                <td><%=user.getId()%></td>
                                            </tr>
                                            <tr>
                                                <td >Email :</td>
                                                <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td >Name :</td>
                                                <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" /></td>
                                            </tr>
                                            <tr>
                                                <td >Password :</td>
                                                <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" /></td>
                                            </tr>
                                            <tr>
                                                <td>New Profile :</td>
                                                <td>
                                                    <input type="file" name="image" class="form-control"/>
                                                </td>
                                            </tr>

                                        </table>



                                        </div>

                                        </div>
                                        <!--profile update ends here-->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="close-btn" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button id="edit-btn" type="button" class="btn btn-primary"><span id="btn-edit">Edit</span></button>
                                        </div>
                                    </form>

                            </div>
                        </div>
                    </div>

                    <!--end profile model-->

                    <!--starts add post modal-->


                    <!-- Modal -->
                    <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title fs-5" id="exampleModalLabel">Provide the post details</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="AddPostServlet" method="post" id="add-post-form" >
                                        <div class="form-group">
                                            <select class="form-control" name="cid" enctype="multipart/form-data">
                                                <option selected disabled>---Select Category---</option>

                                                <%
                                                    CategoriesDao cd = new CategoriesDao(ConnectionProvider.getConnection());
                                                    ArrayList<Category> list = cd.getAllCategories();
                                                    for (Category c : list) {

                                                %>                      
                                                <option value="<%=c.getCid()%>"><%=c.getName()%></option>

                                                <%
                                                    }

                                                %>



                                            </select>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                                        </div>
                                        <div class="form-group mt-2">
                                            <textarea name="pContent" class="form-control" style="height:100px;" placeholder="Enter your Content"></textarea>

                                        </div>   
                                        <div class="form-group mt-2">
                                            <textarea name="pCode" class="form-control" style="height:100px;" placeholder="Enter your Program (if any)"></textarea>

                                        </div> 
                                        <div class="form-group mt-2">
                                            <label>Select Image (if any)</label><br>
                                            <input name="Image" type="file" >
                                        </div> 
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="Submit" class="btn btn-primary">Post</button>
                                        </div>
                                    </form>

                                </div>


                            </div>
                        </div>
                    </div>


                    <!--end add post model-->




                    <!-- javascript -->
                    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
                    <script src="js/script.js"></script>


                    <!--now add post js-->
                    <script>

                                    /* let form=document.querySelector("#add-post-form");
                                     form.addEventListener("submit",(e)=>{
                                     
                                     // e.preventDefault();
                                     form.action="/TechBlog/AddPostServlet";
                                     
                                     
                                     })
                                     */

                                    let loader = document.querySelector("#loader");
                                    setTimeout(() => {
                                        loader.classList.add("hidden");

                                    }, 2000)
                    </script>

                    </body>
                    </html>

