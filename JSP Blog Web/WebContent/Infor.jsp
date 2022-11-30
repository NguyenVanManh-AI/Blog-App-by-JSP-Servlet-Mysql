<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="main.java.model.bean.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Infor | My Post</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/cosmo/bootstrap.min.css" rel="stylesheet" integrity="sha384-qdQEsAI45WFCO5QwXBelBe1rR9Nwiss4rGEqiszC+9olH1ScrLrMQr1KmDR964uZ" crossorigin="anonymous">
<link href="style/infor.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" href="style/logo_blog.png" />
<style>
#infor:hover {
background-color: #6bd845;
}
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
#showpw {
position: absolute;
top:186px;
left:375px;
background-color: red;
}
</style>

</head>
<body>

<% 
    // Nếu chưa đăng nhập thì trả về Login.jsp 
    if (session.getAttribute("id") == null || session.getAttribute("id").equals("")){
    	response.sendRedirect("LoginServlet");
    }
    else {
%>

    <div class="area" >
        <ul class="circles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
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
				<a href="Infor.jsp" ><p id="infor" class="alert alert-success d-inline-block" role="alert" style="border-radius: 10px;"><i class="fa-solid fa-user-shield"></i> <%= (String)session.getAttribute("fullname") %></p></a>
				<button class="btn btn-primary" >
					<a href="Dashboard.jsp" style="color:white"><i class="fa-solid fa-house"></i> Dashboard</a>
				</button>
				<button class="btn btn-primary" >
					<a href="MyPost.jsp" style="color:white"><i class="fa-solid fa-list"></i></i> My Post</a>
				</button>
				<button class="btn btn-danger" >
					<a href="LogoutServlet" style="color:white"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
				</button>
				
			    <div class="col-3 float-right" style="margin-top: 10px;margin-right: -210px">
				     <p class="alert alert-primary d-inline-block float-right" role="alert" style="border-radius: 10px;"><i class="fa-solid fa-user-pen"></i> Update Information</p>
			    </div>
			</div>
<% 
	}
%>

		</div>

   
        <section class="container wrapper col-4" style="border-radius:10px;margin-top:0px;padding:30px;background-color: white;position: relative;">
            <form action="InforServlet" method="POST" >
                <div class="d-flex justify-content-center"><h3>Update Infor</h3></div>  
                
                <i class="fa-solid fa-user"></i> Username<input type="text" disabled="disabled" class="form-control" name="username" placeholder="Username" value='<%= request.getSession().getAttribute("username") %>' /> </br>
                <i class="fa-solid fa-key"></i> Password<input type="password" id="pw" style="padding-right:26px" class="form-control" name="password" placeholder="Password" value='<%= request.getSession().getAttribute("password") %>' /> <br>
                <input id="showpw" type="checkbox" onclick="myFunction()">
                <i class="fa-solid fa-signature"></i> Full Name<input type="text" class="form-control" name="fullname" placeholder="Full Name" value='<%= request.getSession().getAttribute("fullname") %>' /> <br>
					<button class="btn btn-outline-primary col-12 mb-2" type="submit"><i class="fa-solid fa-paper-plane"></i> Update</button>
					<button class="btn btn-outline-primary col-12 mb-2" type="reset"><i class="fa-solid fa-feather-pointed"></i> Reset</button>
				
				                <!-- succes -->
                <% if(request.getAttribute("mess_infor_success") != null){ %>
                    <div class="alert alert-success" role="alert"><i class="fa-solid fa-check-double"></i> <%= request.getAttribute("mess_infor_success") %></div>
                <% } %>
                
                <!-- error -->
                <% if(request.getAttribute("mess_infor_error") != null){ %>
                    <div class="alert alert-danger" role="alert"><i class="fa-solid fa-triangle-exclamation"></i> <%= request.getAttribute("mess_infor_error") %></div>
                <% } %>
                
            </form>
        </section>
    </div>
    
   </div>
   <% } // int id = (int)session.getAttribute("id") ; out.print("id user : "+id); %>
<script>

function myFunction() {
	  var x = document.getElementById("pw");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}

</script>
</body>
<!-- resize: none; là không cho chỉnh kích thước của textarea -->
</html>
<!-- chú ý nếu ta khai báo biến String hoặc Int để lưu biến username hoặc id sau đó so sánh với null thì 
sẽ gây lỗi bởi vì nó sẽ báo lỗi là không thể so sánh object với int hoặc string vì id và username là 
một bộ object -->
