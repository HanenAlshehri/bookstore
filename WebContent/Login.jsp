<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ include file="Common.jsp" %>
      <%@ page import="store.user.Data" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
		<h1>Login Form</h1>
		<%
		if (request.getParameter("submit") != null) {
		    // ...
	   //ArrayList<User> users2 = new ArrayList<User>();
	    String username=request.getParameter("username");
		String password=request.getParameter("password");
		//var isExist =users.stream().filter(carnet -> username.equals(carnet.getUsername())).findFirst().orElse(null);
	    //	boolean isExist  = Data.users.stream().anyMatch(p -> p.getUsername().equals(username));
		if(Data.IsUserExist(username)){
			boolean isSuccess=Data.Login(username, password);
			if(isSuccess){
				out.write("<p style='color:green'>Success</p>");
			 	  response.sendRedirect("/BookStore/Index.jsp");
			}
			else{
				out.write("<p style='color:red'>Failed</p>");
			}
		}
		else{
			out.write("<p style='color:red'>Failed</p>");
		}
		}
		%>
		<form action="Login.jsp" method="post">

			<div class="form-group">
				<label for="uname">User Name:</label> <input type="text"
					class="form-control" id="username" placeholder="User Name"
					name="username" required>
			</div>

			<div class="form-group">
				<label for="uname">Password:</label> <input type="password"
					class="form-control" id="password" placeholder="Password"
					name="password" required>
			</div>


			<button type="submit" name="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	   <%@ include file="Footer.jsp" %>
</body>
</html>