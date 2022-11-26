<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="main.java.model.bean.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Blog | Add Post</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/cosmo/bootstrap.min.css" rel="stylesheet" integrity="sha384-qdQEsAI45WFCO5QwXBelBe1rR9Nwiss4rGEqiszC+9olH1ScrLrMQr1KmDR964uZ" crossorigin="anonymous">
<link href="style/dashboard.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>

</style>

</head>

<% 
    // Nếu chưa đăng nhập thì trả về Login.jsp 
    if (session.getAttribute("id") == null || session.getAttribute("id").equals("")){
    	response.sendRedirect("LoginServlet");
    }
    else {
%>

<body>
    <div class="area" >
		<div class="wrapper">
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
			<div><span class="dot"></span></div>
		</div>
    </div >

	<div class="context">
		<div id="header">

<% 
    // Nếu chưa đăng nhập thì hiện các nút này ra 
    if (session.getAttribute("id") == null || session.getAttribute("id").equals("")){ %>
			<div class="col-4" style="margin-top: 10px">
				<button class="btn btn-primary" >
					<a href="Login.jsp" style="color:white"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
				</button>
				<button class="btn btn-primary" >
					<a href="Register.jsp" style="color:white"><i class="fa-solid fa-user-plus"></i> Register</a>
				</button>
			</div>
<% 
    }
    else { %> 
			<div class="col-9" style="margin-top: 10px">
				<p class="alert alert-success d-inline-block" role="alert" style="border-radius: 10px;"><i class="fa-solid fa-user-shield"></i> <%= (String)session.getAttribute("username") %></p>
				<button class="btn btn-primary" >
					<a href="MyPost.jsp" style="color:white"><i class="fa-solid fa-list"></i></i> My Post</a>
				</button>
				<button class="btn btn-primary" >
					<a href="AddPost.jsp" style="color:white"><i class="fa-solid fa-square-plus"></i> Add Post</a>
				</button>
				<button class="btn btn-danger" >
					<a href="LogoutServlet" style="color:white"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
				</button>
			</div>
<% 
	}
%>
			<div class="col-3" style="margin-top: 10px;float: right;padding-left:30px ;">
				<button class="btn btn-primary">
					<a href="Dashboard.jsp" style="color:white"><i class="fa-solid fa-house-user"></i> Dashboard </a>
				</button>
				<p class="alert alert-primary d-inline-block" role="alert" style="border-radius: 10px;"><i class="fa-solid fa-square-plus"></i> Add Post</p>
			</div>
		</div>

            <form class="col-8 mx-auto" action="AddPostServlet" method="POST" style="background-color: white; padding:16px 40px 30px 40px;border-radius: 10px">
                <h1 class="d-flex justify-content-center">Add Post</h1>
                <!-- error -->
                <% if(request.getAttribute("mess_add_error") != null){ %>
                    <div class="alert alert-danger" role="alert"><%= request.getAttribute("mess_add_error") %></div>
                <% } %>

                <% if(request.getAttribute("mess_add_success") != null){ %>
                    <div class="alert alert-success" role="alert"><%= request.getAttribute("mess_add_success") %></div>
                <% } %>
                
                Title <input type="text" class="form-control" name="title" placeholder="Title" /> </br>
                Content 
				<textarea class="form-control" name="content" rows="7" style="resize: none;" placeholder="Content" class="content"></textarea></br>		

				<div class="col-6 mx-auto">
					<button class="btn btn-outline-primary col-12 mb-2" type="submit"><i class="fa-solid fa-paper-plane"></i> Add</button>
					<button class="btn btn-outline-primary col-12 mb-2" type="reset"><i class="fa-solid fa-feather-pointed"></i> Reset</button>
				</div>
            </form>
   </div>
   
<% }  %>
</body>
</body>
</html>

