<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="main.java.model.bean.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Blog | Dashboard</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/cosmo/bootstrap.min.css" rel="stylesheet" integrity="sha384-qdQEsAI45WFCO5QwXBelBe1rR9Nwiss4rGEqiszC+9olH1ScrLrMQr1KmDR964uZ" crossorigin="anonymous">
<link href="style/dashboard.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" href="style/logo_blog.png" />
<style>
.title {
	font-size: 20px;
	font-weight: bold;
	width: 100%;
	height: 20px;
	text-overflow: ellipsis;
	white-space: nowrap; 
	overflow: hidden;
	color: #0085FF; 
	cursor: pointer;
	line-height: 20px;
	margin-top: 6px;
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
			<div class="col-10" style="margin-top: 10px">
				<p class="alert alert-success d-inline-block" role="alert" style="border-radius: 10px;"><i class="fa-solid fa-user-shield"></i> <%= (String)session.getAttribute("username") %></p>
				<button class="btn btn-primary" >
					<a href="MyPost.jsp" style="color:white"><i class="fa-solid fa-list"></i></i> My Post</a>
				</button>
				<button class="btn btn-danger" >
					<a href="LogoutServlet" style="color:white"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
				</button>
			</div>
<% 
	}
%>
			<div class="col-2" style="margin-top: 10px">
				<p class="alert alert-primary d-inline-block float-right" role="alert" style="border-radius: 10px;"><i class="fa-solid fa-border-all"></i> All Article</p>
			</div>
		</div>


		<div id="main">
<%
	List<Article> articles = (ArrayList<Article>) request.getAttribute("articles");
	if(articles == null){
		response.sendRedirect("ShowAllServlet");
	}
	else {
		for (int i = 0; i < articles.size(); i++) {
%>
			<li>
				<a href="PostDetailsServlet?id_article=<%= articles.get(i).getId()%>&id_user=<%= articles.get(i).getId_user() %>">
					<p class="title" style=""><i class="fa-solid fa-bookmark"></i> <%= articles.get(i).getTitle() %></p>
					<textarea rows="7" style="width: 100%;outline: none;border: none;cursor: pointer;overflow: hidden;margin-top: -10px;resize: none;" disabled class="content"><%= articles.get(i).getContent() %></textarea>					
				</a>
			</li>

<%
		}
	}; 
%>
		</div>
   </div>
</body>
<!-- resize: none; là không cho chỉnh kích thước của textarea -->
</html>