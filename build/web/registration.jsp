<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.dbutil.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="css/mystyle.css" />
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 58% 99%, 20% 91%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>

        
              <main class="primary-background banner-background" style="height:90vh">
            <div class="container">
                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        <div class="card-header text-center primary-background">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register Here

                        </div>
                        <div class="card-body">

                            <form action="RegisterServlet" method="POST" id="my-form">
                                <div class="mb-2">
                                    <label for="user_name" class="form-label" >User Name</label>
                                    <input type="text" class="form-control" id="user_name" aria-describedby="emailHelp" name="user_name" >

                                </div>

                                <div class="mb-2">
                                    <label for="exampleInputEmail1" class="form-label" name="">Email address</label>
                                    <input type="email" class="form-control" aria-describedby="emailHelp" name="user_email">
                                    
                                </div>


                                <div class="mb-2">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" name="user_password">
                                </div>
                                <%
                               Message msg=(Message)session.getAttribute("msg");
                               if(msg!=null)
                               {
                            %>
                            <div class="alert <%=msg.getCssClass() %>" role="alert">
                                <%=msg.getContent() %>
                            </div>
                            <%  
                                session.removeAttribute("msg");
                                //when refresh the page the message will disapear
                               }
                            %>

                                <div class="mb-2">
                                    <label for="gender" class="form-label">Select Gender</label><br>
                                    <input type="radio"  id="gender" name="gender" value="male">Male
                                    <input type="radio"  name="gender" value="female">Female
                                </div>


                            <div class=" d-flex w-100 gap-4">
                                        <button type="submit" class="btn btn-primary w-50">Submit</button>
                                        <a href="loginpage.jsp" class="btn btn-outline-dark w-50">Login</a>
                             </div>
                            </form>

                        </div>


                    </div>

                </div>

            </div>
        </main>
       



        <!-- javascript -->

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        
        <!--
          Code for Checking JQuery Proper working or not
          <script>
              $(document).ready(function(){
                  alert("document Loaded");
              })
          </script>
        -->
    </body>
</html>

