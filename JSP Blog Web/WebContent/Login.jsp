
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Blog | Login</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/cosmo/bootstrap.min.css" rel="stylesheet" integrity="sha384-qdQEsAI45WFCO5QwXBelBe1rR9Nwiss4rGEqiszC+9olH1ScrLrMQr1KmDR964uZ" crossorigin="anonymous">
<link href="style/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" href="style/logo_blog.png" />
<style>

</style>

</head>
<% 
    // Nếu như đã đăng nhập thì phải về trang MyPost.jsp 
    if (session.getAttribute("id") == null || session.getAttribute("id").equals("")){
%>

<body>

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
   
        <div class="col-4" style="margin-top: 10px">
            <button class="btn btn-primary" ><a href="Dashboard.jsp" style="color:white"><i class="fa-solid fa-house-user"></i> Dashboard</a></button>
            <button class="btn btn-primary" ><a href="Register.jsp" style="color:white"><i class="fa-solid fa-user-plus"></i> Register</a></button>
        </div>
   
        <section class="container wrapper col-4" style="border-radius:10px;margin-top:30px;padding:30px;background-color: white;">
            <form action="CheckLoginServlet" method="POST">
                <h1 class="d-flex justify-content-center">Login</h1>
                
                <!-- error -->
                <% if(request.getAttribute("mess_login_error") != null){ %>
                    <div class="alert alert-danger" role="alert"><i class="fa-solid fa-triangle-exclamation"></i> <%= request.getAttribute("mess_login_error") %></div>
                <% } %>
                
                <i class="fa-solid fa-user"></i> Username<input type="text" class="form-control" name="username" placeholder="Username" /> </br>
                <i class="fa-solid fa-key"></i> Password<input type="password" class="form-control" name="password" placeholder="Password" /> <br>
                <button type="submit" class="btn btn-block btn-outline-primary" ><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</button> 
                <input type="reset" value="Reset" class="btn btn-block btn-outline-primary"> 
            </form>
        </section>
    </div>

<%

}
else {
	response.sendRedirect("MyPost.jsp");
}
%>
</body>
</html>