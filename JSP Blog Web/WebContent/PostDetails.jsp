<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="main.java.model.bean.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Blog | Post Details</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/cosmo/bootstrap.min.css" rel="stylesheet" integrity="sha384-qdQEsAI45WFCO5QwXBelBe1rR9Nwiss4rGEqiszC+9olH1ScrLrMQr1KmDR964uZ" crossorigin="anonymous">
<link href="style/dashboard.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" href="style/logo_blog.png" />
<style>
.title {
	font-size: 20px;
	font-weight: bold;
	width: 100%;
	text-overflow: ellipsis;
	white-space: nowrap; 
	overflow: hidden;
	color: #0085FF; 
	margin-top: 10px;
	margin-bottom: 20px;
}
#main li {
	width: 69%;
	height: 400px;
	padding: 10px 30px;
	box-shadow: rgb(204, 219, 232) 6px 6px 12px -3px inset, rgba(255, 255, 255, 0.5) -6px -6px 12px 2px inset;
	border: 20px solid white;
	border-radius: 10px;
	cursor:default
}
.content {
	height: 270px;
	overflow: hidden;
	overflow-y: scroll;
	width: 100%;
	outline: none;
	border: none;
	margin-top: -10px;
	resize: none;
}

/* ẩn thanh scroll đi */
::-webkit-scrollbar {
    display: none;
}

</style>

</head>
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
				<p class="alert alert-primary d-inline-block" role="alert" style="border-radius: 10px;"><i class="fa-solid fa-bars-staggered"></i> Post Details</p>
			</div>
		</div>


		<div id="main">
			<li>
				<%
					Article article = (Article) request.getAttribute("article_detail");
					if(article == null){
						response.sendRedirect("PostDetailsServlet");
					}
					else {
						// out.print(article.getId_user());
						// String id_user = Integer.toString(article.getId_user());
						// request.setAttribute("id_user", id_user);
						// out.print(id_user);
						// out.print(session.getAttribute("id"));
				%>
					<p class="title alert alert-primary" style="cursor:default ;"><i class="fa-solid fa-bookmark"></i> <%= article.getTitle() %></p>
					<textarea rows="7" style="" disabled class="content"><%= article.getContent() %></textarea>					
				</a>
			<% } %>
			</li>


		</div>
		    <% 
		    // Chú ý session.getAttribute("id") là một objetc nên ta phải convert nó sang String 
			String id_user = Integer.toString(article.getId_user());
            if(session.getAttribute("id") != null && String.valueOf(session.getAttribute("id")).equals(id_user)){ %>
            <div class="col-2 mx-auto" style="margin-top: 10px;padding-left:30px;">
				<button class="btn btn-primary">
					<a href="EditPostServlet?id_article=<%= article.getId() %>" style="color:white"><i class="fa-solid fa-pen-to-square"></i> Edit </a>
				</button>
				<button class="btn btn-danger">
					<a href="DeletePostServlet?id_article=<%= article.getId() %>" style="color:white"><i class="fa-solid fa-trash"></i> Delete </a>
				</button>
			</div>
            <% } 
            else {}%>
   </div>
</body>
</body>
</html>


